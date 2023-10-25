import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vxport/src/common_widgets/tap_handler.dart';
import 'package:vxport/src/features/main/presentation/components/expandable_side_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vxport/src/features/main/presentation/sidebar/links_widget.dart';

class AboutTheWebsite extends StatefulWidget {
  const AboutTheWebsite({super.key});

  @override
  State<AboutTheWebsite> createState() => _AboutTheWebsiteState();
}

class _AboutTheWebsiteState extends State<AboutTheWebsite> {
  PackageInfo? _info;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _info = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ExpandableSideItem(
          title: "about",
          isExpanded: true,
        ),
        const SizedBox(height: 24),
        Center(
          child: Image.asset(
            "assets/vxport.png",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "VXPort",
          style: GoogleFonts.lato(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            letterSpacing: 24 / 22,
          ),
        ),
        Text(
          "( v${_info?.version ?? "..."} )",
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            letterSpacing: 18 / 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Web Portfolio made using Flutter",
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            letterSpacing: 18 / 16,
          ),
        ),
        Text(
          "(Inspired from VSCode)",
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            letterSpacing: 18 / 16,
          ),
        ),
        const SizedBox(height: 8),
        TapHandler(
          onTap: () {
            launchUrlString("https://github.com/prateekmedia");
          },
          child: Text(
            "Created by Prateek Sunal",
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 16 / 14,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Align(
          alignment: Alignment.centerLeft,
          child: MiniHeader("PROJECT SOURCE"),
        ),
        const LinkItem(
            title: "View Source Code",
            icon: Icon(LucideIcons.github),
            url: "https://github.com/prateekmedia/vxport"),
      ],
    );
  }
}
