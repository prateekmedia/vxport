import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:vxport/src/common_widgets/mouse_handler.dart';
import 'package:vxport/src/common_widgets/tap_handler.dart';
import 'package:vxport/src/features/main/application/bg_state_provider.dart';
import 'package:vxport/src/features/main/application/code_style_provider.dart';
import 'package:vxport/src/features/main/application/flash_provider.dart';
import 'package:vxport/src/features/main/presentation/sidebar/links_widget.dart';

class SettingsWidget extends ConsumerWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentBg = ref.watch(bgStateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MiniHeader("GENERAL"),
        const SizedBox(height: 8),
        SettingsItem(
          title: "CODE THEME",
          icon: const Icon(Icons.brightness_4),
          trailing: DropdownButton(
            value: ref.watch(codeStyleTypeProvider),
            items: ["Monokai", "Dracula", "Solarized", "One Dark"]
                .map(
                  (e) => DropdownMenuItem(
                    value: e.toLowerCase(),
                    child: Text(
                      e,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (val) {
              ref.read(codeStyleTypeProvider.notifier).state = val.toString();
            },
            underline: const SizedBox(),
            dropdownColor: Colors.black.withOpacity(0.6),
          ),
          onTap: null,
        ),
        const SizedBox(height: 12),
        const MiniHeader("BACKGROUND"),
        SizedBox(
          height: 150,
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(24),
            primary: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 4 / 3,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              final isSelected = currentBg.startsWith(bg[index]);

              return Stack(
                fit: StackFit.expand,
                children: [
                  TapHandler(
                    onTap: () {
                      ref.read(bgStateProvider.notifier).state = bg[index];
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "${bg[index]}&w=84&h=50",
                        fit: BoxFit.cover,
                        height: 50,
                        width: 84,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      right: 4,
                      top: 4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(
                          LucideIcons.check,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        const MiniHeader("MISCELLANEOUS"),
        const SizedBox(height: 8),
        SettingsItem(
          title: "Flashbang",
          icon: const Icon(Icons.brightness_1),
          onTap: () {
            ref.read(flashProvider.notifier).state = true;
            Future.delayed(const Duration(milliseconds: 1000), () {
              ref.read(flashProvider.notifier).state = false;
            });
          },
        ),
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.trailing,
  });

  final String title;
  final Widget icon;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return MouseHandler(
      onTap: () => onTap?.call(),
      child: (isHovered) => Container(
        decoration: BoxDecoration(
          color:
              onTap != null && isHovered ? Colors.white.withOpacity(0.1) : null,
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            SizedBox(
              height: 40,
              width: 40,
              child: icon,
            ),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 22 / 17,
                ),
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 4),
              trailing!,
              const SizedBox(width: 16),
            ]
          ],
        ),
      ),
    );
  }
}
