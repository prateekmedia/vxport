import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class WindowButtonsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color =
        const Color.fromRGBO(230, 106, 103, 1.0).withValues(alpha: 1.0);
    canvas.drawCircle(Offset(size.width * 0.2500000, size.height * 0.5000000),
        size.width * 0.1000000, paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color =
        const Color.fromRGBO(233, 214, 137, 1.0).withValues(alpha: 1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.5000000),
        size.width * 0.1000000, paint1Fill);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color =
        const Color.fromRGBO(184, 227, 139, 1.0).withValues(alpha: 1.0);
    canvas.drawCircle(Offset(size.width * 0.7500000, size.height * 0.5000000),
        size.width * 0.1000000, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
