import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FooterComponent extends StatelessWidget {
  const FooterComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 17),
        const Icon(
          LucideIcons.xCircle,
          size: 20,
        ),
        const SizedBox(width: 6),
        Text(
          "0",
          style: GoogleFonts.lato(fontSize: 17),
        ),
        const SizedBox(width: 6),
        const Icon(
          LucideIcons.alertTriangle,
          size: 20,
        ),
        const SizedBox(width: 6),
        Text(
          "0",
          style: GoogleFonts.lato(fontSize: 17),
        ),
        const SizedBox(width: 16),
        Text(
          "Debug my code",
          style: GoogleFonts.lato(fontSize: 17),
        ),
        const Spacer(),
        Text(
          "Spaces: 2",
          style: GoogleFonts.lato(fontSize: 17),
        ),
        const SizedBox(width: 16),
        Text(
          "UTF-8",
          style: GoogleFonts.lato(fontSize: 17),
        ),
        const SizedBox(width: 16),
        Text(
          "Markdown",
          style: GoogleFonts.lato(fontSize: 17),
        ),
        const SizedBox(width: 16),
        Text(
          "Chrome (web-javascript)",
          style: GoogleFonts.lato(fontSize: 17),
        ),
        const SizedBox(width: 16),
        const Icon(
          LucideIcons.bellDot,
          size: 20,
        ),
        const SizedBox(width: 17),
      ],
    );
  }
}
