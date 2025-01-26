import 'package:flutter/material.dart';
import 'package:vxport/src/common_widgets/mouse_handler.dart';
import 'package:vxport/src/features/main/presentation/components/expandable_side_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinksWidget extends StatelessWidget {
  const LinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ExpandableSideItem(
            title: "Profile Picture",
            isExpanded: true,
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                  "https://avatars.githubusercontent.com/u/41370460?v=4"),
            ),
          ),
          const ExpandableSideItem(
            title: "Social Links",
            isExpanded: true,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MiniHeader("General"),
                const LinkItem(
                  title: "Github",
                  icon: Icon(LucideIcons.github, size: 20),
                  url: "https://github.com/prateekmedia",
                ),
                const LinkItem(
                  title: "Linkedin",
                  icon: Icon(LucideIcons.linkedin, size: 20),
                  url: "https://linkedin.com/in/prateek-sunal",
                ),
                const LinkItem(
                  title: "x.com (Twitter)",
                  icon: Icon(LucideIcons.x),
                  url: "https://x.com/prateek_su",
                ),
                const MiniHeader("Freelancing/Gig work contact"),
                const LinkItem(
                  title: "Email",
                  icon: Icon(Icons.mail, size: 20),
                  url: "mailto:workwithme@sunal.in",
                ),
                const LinkItem(
                  title: "Telegram",
                  icon: Icon(Icons.send, size: 20),
                  url: "https://t.me/prateek_media",
                ),
                LinkItem(
                  title: "Discord",
                  icon: Center(
                    child: Image.network(
                        height: 24,
                        width: 24,
                        "https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0a6cc3c481a15a141738_icon_clyde_white_RGB.png"),
                  ),
                  url: "https://discordapp.com/users/prateeksunal",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MiniHeader extends StatelessWidget {
  const MiniHeader(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, top: 16, bottom: 8),
      child: SelectableText(
        title.toUpperCase(),
        style: GoogleFonts.lato(
            fontSize: 15, color: Colors.white70, letterSpacing: 18 / 15),
      ),
    );
  }
}

class LinkItem extends StatelessWidget {
  const LinkItem({
    super.key,
    required this.title,
    required this.icon,
    required this.url,
  });

  final String title;
  final Widget icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return MouseHandler(
      onTap: () => launchUrlString(url),
      child: (isHovered) => Container(
        decoration: BoxDecoration(
          color: isHovered ? Colors.white.withValues(alpha: 0.1) : null,
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            SizedBox(
              height: 40,
              width: 40,
              child: icon,
            ),
            Text(
              title,
              style: GoogleFonts.lato(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                letterSpacing: 22 / 17,
                decoration: isHovered ? TextDecoration.underline : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
