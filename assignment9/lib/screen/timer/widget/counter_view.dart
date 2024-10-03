import 'package:assignment9/main.dart';
import 'package:flutter/material.dart';

class CounterView extends StatelessWidget {
  final String title;
  final int current;
  final int max;

  const CounterView({
    super.key,
    required this.title,
    required this.current,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$current/$max",
          style: TextStyle(
            color: MyApp.secondRed,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: MyApp.mainWhite,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
