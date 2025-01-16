import 'package:assignment9/model/my_color.dart';
import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onTap;

  const TimerButton({
    super.key,
    required this.isRunning,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xffBF392B),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          isRunning ? Icons.pause : Icons.play_arrow,
          color: MyColor.mainWhite,
          size: 70,
        ),
      ),
    );
  }
}
