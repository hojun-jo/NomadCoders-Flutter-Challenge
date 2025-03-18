import 'dart:math';

import 'package:custom_painter/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TimerCircle extends CustomPainter {
  final double progress;

  TimerCircle({super.repaint, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );
    final degree90 = pi / 2;
    final startAngle = -degree90;
    final sweepAngle = progress * 4 * degree90;
    final paint =
        Paint()
          ..color = AppColors.lightRed
          ..strokeWidth = 20
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return (oldDelegate as TimerCircle).progress != progress;
  }
}
