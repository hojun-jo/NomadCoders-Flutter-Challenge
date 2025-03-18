import 'package:flutter/material.dart';

class ProgressBar extends CustomPainter {
  final double progress;

  ProgressBar({super.repaint, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final background =
        Paint()
          ..color = Colors.black.withAlpha(40)
          ..strokeWidth = size.height
          ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset.zero, Offset(size.width, 0), background);

    final progressBar =
        Paint()
          ..color = Colors.white
          ..strokeWidth = size.height
          ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset.zero, Offset(progress * size.width, 0), progressBar);
  }

  @override
  bool shouldRepaint(ProgressBar oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
