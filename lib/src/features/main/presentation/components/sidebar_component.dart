import 'package:flutter/material.dart';
import 'package:vxport/src/features/about/presentation/about_the_website.dart';
import 'package:vxport/src/features/main/application/navigation_item_state.dart';
import 'package:vxport/src/features/main/presentation/sidebar/explorer_widget.dart';
import 'package:vxport/src/features/main/presentation/sidebar/links_widget.dart';
import 'package:vxport/src/features/main/presentation/sidebar/settings_widget.dart';
import 'package:vxport/src/features/projects/presentation/projects_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:vxport/src/utils/constants.dart';

class SidebarComponent extends ConsumerWidget {
  const SidebarComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final names = [
      "Explorer",
      "Projects",
      "Links",
      "About Website",
      "Settings"
    ];
    final index = ref.watch(navigationItemStateProvider) ?? 0;

    if (index < 0) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 28),
          color: Colors.black.withOpacity(0.2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  names[index].toUpperCase(),
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 18 / 16,
                  ),
                ),
              ),
              const Icon(LucideIcons.moreHorizontal),
            ],
          ),
        ),
        Expanded(
          child: switch (index) {
            0 => const ExplorerWidget(),
            1 => const ProjectsWidget(),
            2 => const LinksWidget(),
            3 => const AboutTheWebsite(),
            4 => const SettingsWidget(),
            _ => const SizedBox(),
          },
        ),
      ],
    );
  }
}
