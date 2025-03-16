import 'package:custom_painter/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BackgroundCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint =
        Paint()
          ..color = AppColors.lightGrey
          ..strokeWidth = 20
          ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
