import 'package:assignment9/main.dart';
import 'package:flutter/material.dart';

class TimerCard extends StatelessWidget {
  final String title;

  const TimerCard(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(10, -12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(5),
            ),
            width: 130,
            height: 140,
          ),
        ),
        Transform.translate(
          offset: const Offset(5, -6),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(5),
            ),
            width: 140,
            height: 140,
          ),
        ),
        Container(
          width: 150,
          height: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: MyApp.mainWhite,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: MyApp.mainRed,
              fontSize: 88,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
