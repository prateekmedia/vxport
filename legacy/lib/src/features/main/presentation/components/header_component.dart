import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vxport/src/features/main/presentation/window_buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationToolbar(
      leading: CustomPaint(
        size: Size(88, (88 * 0.5).toDouble()),
        painter: WindowButtonsPainter(),
      ),
      middle: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 36,
              width: 600,
              decoration: BoxDecoration(
                color: Colors.grey[900]!,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const SelectedFolderWidget(),
            ),
          ),
        ],
      ),
      trailing: const Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: Icon(LucideIcons.moreHorizontal),
      ),
      centerMiddle: true,
    );
  }
}

class SelectedFolderWidget extends StatelessWidget {
  const SelectedFolderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: const Icon(
            Icons.search,
            size: 22,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          "prateeks_portfolio",
          style: GoogleFonts.inter(
              fontSize: 18,
              letterSpacing: 19 / 18,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
