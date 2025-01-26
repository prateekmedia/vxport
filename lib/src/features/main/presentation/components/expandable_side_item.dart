import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ExpandableSideItem extends StatelessWidget {
  const ExpandableSideItem({
    super.key,
    required this.title,
    this.trailing,
    required this.isExpanded,
  });

  final String title;
  final Widget? trailing;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.2),
        border: Border(
          bottom: BorderSide(
            color: !isExpanded
                ? Colors.white.withValues(alpha: 0.2)
                : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 28,
            child: Icon(
              isExpanded ? LucideIcons.chevronDown : LucideIcons.chevronRight,
              size: 20,
            ),
          ),
          Expanded(
            child: Text(
              title.toUpperCase(),
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 18 / 16,
              ),
            ),
          ),
          if (trailing != null) ...[trailing!, const SizedBox(width: 20)]
        ],
      ),
    );
  }
}
