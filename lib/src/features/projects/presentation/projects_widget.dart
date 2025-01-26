import 'package:flutter/material.dart';
import 'package:vxport/src/common_widgets/tap_handler.dart';
import 'package:vxport/src/features/main/presentation/components/expandable_side_item.dart';
import 'package:vxport/src/features/projects/application/projects_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectsWidget extends ConsumerWidget {
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final items = ref.read(projectsProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in items.entries) ...[
            ExpandableSideItem(
              title: item.key,
              isExpanded: true,
              trailing: TapHandler(
                onTap: () => launchUrlString(item.value.$2),
                child: const SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(
                    LucideIcons.github,
                    size: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16).copyWith(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final subItem in item.value.$1)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Text(
                        "\u2022 $subItem",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 20 / 18,
                          height: 1.6,
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ],
      ),
    );
  }
}
