import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BlurBackdrop extends StatelessWidget {
  const BlurBackdrop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ui.ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 10,
      ),
      child: Container(
        color: Colors.black.withOpacity(0.4),
      ),
    );
  }
}
