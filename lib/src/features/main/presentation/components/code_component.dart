import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:vxport/src/common_widgets/dividers.dart';
import 'package:vxport/src/common_widgets/mouse_handler.dart';
import 'package:vxport/src/features/main/application/code_controller_provider.dart';
import 'package:vxport/src/features/main/application/selected_file_index_provider.dart';
import 'package:vxport/src/features/main/application/toc_controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CodeComponent extends ConsumerWidget {
  const CodeComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final selectedFileIndex = ref.watch(selectedFileIndexProvider);
    return Column(
      children: [
        const ActiveFiles(),
        const DividerXX(),
        if (selectedFileIndex == 0) ...[
          const CurrentFilePath(),
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.black.withOpacity(0.2),
              child: const CodeArea(),
            ),
          ),
        ] else ...[
          Expanded(
            child: Container(
                height: double.infinity,
                color: Colors.black.withOpacity(0.2),
                child: MarkdownWidget(
                  data: code,
                  tocController: ref.read(tocControllerProvider),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  config: MarkdownConfig.darkConfig.copy(
                    configs: [
                      LinkConfig(
                        style: GoogleFonts.lato(
                          color: Colors.yellow,
                          decoration: TextDecoration.underline,
                        ),
                        onTap: (url) => launchUrlString(url),
                      ),
                      PConfig(
                        textStyle: GoogleFonts.lato(
                          fontSize: 20,
                          letterSpacing: 22 / 20,
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ],
    );
  }
}

class ActiveFiles extends StatelessWidget {
  const ActiveFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      color: Colors.black.withOpacity(0.2),
      child: const SingleChildScrollView(
        child: Row(
          children: [
            OpenFileItem(
              shortpath: "INFO.md",
              tooltip: "About me",
              icon: LucideIcons.info,
              index: 0,
            ),
            OpenFileItem(
              shortpath: "Preview INFO.md",
              tooltip: "Preview of about me",
              icon: LucideIcons.info,
              index: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentFilePath extends StatelessWidget {
  const CurrentFilePath({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: double.infinity,
      color: Colors.black.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text("prateek.sunal.in", style: GoogleFonts.lato(fontSize: 16)),
            const SizedBox(
              width: 28,
              child: Center(
                child: Icon(
                  LucideIcons.chevronRight,
                  size: 22,
                ),
              ),
            ),
            const Icon(LucideIcons.info, size: 16),
            const SizedBox(width: 6),
            Text("aboutme.md", style: GoogleFonts.lato(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class CodeArea extends ConsumerWidget {
  const CodeArea({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.read(codeControllerProvider);
    return CodeTheme(
      data: CodeThemeData(styles: monokaiSublimeTheme),
      child: SingleChildScrollView(
        child: CodeField(
          readOnly: true,
          textStyle: GoogleFonts.jetBrainsMono(fontSize: 20),
          background: Colors.black.withOpacity(0),
          controller: controller,
        ),
      ),
    );
  }
}

class OpenFileItem extends ConsumerWidget {
  const OpenFileItem({
    super.key,
    required this.tooltip,
    required this.shortpath,
    required this.icon,
    required this.index,
  });

  final String tooltip;
  final String shortpath;
  final IconData? icon;
  final int index;

  @override
  Widget build(BuildContext context, ref) {
    final currentIndex = ref.watch(selectedFileIndexProvider);

    return MouseHandler(
      onTap: () {
        ref.read(selectedFileIndexProvider.notifier).state = index;
      },
      child: (isHovered) => Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: index == currentIndex || isHovered
              ? Colors.grey[900]!.withOpacity(0.2)
              : Colors.transparent,
          border: Border(
            top: BorderSide(
              color: index == currentIndex
                  ? Colors.blue[400]!
                  : Colors.transparent,
              width: 2,
            ),
            left: BorderSide(
              color: Colors.white.withOpacity(0.2),
              width: .5,
            ),
            right: BorderSide(
              color: Colors.white.withOpacity(0.2),
              width: .5,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(icon!, size: 20),
            const SizedBox(width: 8),
            JustTheTooltip(
              tailBaseWidth: 8,
              tailLength: 8,
              preferredDirection: AxisDirection.down,
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tooltip,
                ),
              ),
              child: Text(
                shortpath,
                style: GoogleFonts.lato(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
            JustTheTooltip(
              tailBaseWidth: 8,
              tailLength: 8,
              preferredDirection: AxisDirection.down,
              content: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Close",
                ),
              ),
              child: Opacity(
                opacity: currentIndex == index || isHovered ? 1 : 0,
                child: const Icon(LucideIcons.x, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
