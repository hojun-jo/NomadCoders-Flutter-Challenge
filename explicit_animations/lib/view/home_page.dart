import 'dart:async';

import 'package:explicit_animations/constant/animation_duration.dart';
import 'package:explicit_animations/widget/red_dot_row.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Timer _timer1;
  late final Timer _timer2;
  late final Timer _timer3;
  late final Timer _timer4;
  late final Timer _timer5;

  @override
  void dispose() {
    _timer1.cancel();
    _timer2.cancel();
    _timer3.cancel();
    _timer4.cancel();
    _timer5.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 40,
      children: [
        RedDotRow(
          animationDuration: animationDuration,
          reverseDuration: reverseDuration,
          startDelay: delayDuration * 4,
          isLeftToRight: true,
          startAnimationWith: (startAnimation) {
            _timer5 = Timer.periodic(intervalDuration, (timer) {
              startAnimation();
            });
          },
        ),
        RedDotRow(
          animationDuration: animationDuration,
          reverseDuration: reverseDuration,
          startDelay: delayDuration * 3,
          isLeftToRight: false,
          startAnimationWith: (startAnimation) {
            _timer4 = Timer.periodic(intervalDuration, (timer) {
              startAnimation();
            });
          },
        ),
        RedDotRow(
          animationDuration: animationDuration,
          reverseDuration: reverseDuration,
          startDelay: delayDuration * 2,
          isLeftToRight: true,
          startAnimationWith: (startAnimation) {
            _timer3 = Timer.periodic(intervalDuration, (timer) {
              startAnimation();
            });
          },
        ),
        RedDotRow(
          animationDuration: animationDuration,
          reverseDuration: reverseDuration,
          startDelay: delayDuration,
          isLeftToRight: false,
          startAnimationWith: (startAnimation) {
            _timer2 = Timer.periodic(intervalDuration, (timer) {
              startAnimation();
            });
          },
        ),
        RedDotRow(
          animationDuration: animationDuration,
          reverseDuration: reverseDuration,
          startDelay: Duration.zero,
          isLeftToRight: true,
          startAnimationWith: (startAnimation) {
            _timer1 = Timer.periodic(intervalDuration, (timer) {
              startAnimation();
            });
          },
        ),
      ],
    );
  }
}
