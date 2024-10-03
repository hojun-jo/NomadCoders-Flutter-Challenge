import 'package:assignment9/screen/timer/timer_view.dart';
import 'package:assignment9/model/my_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => MyTimer(
        maxRound: 4,
        maxGoal: 12,
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static final Color mainRed = Colors.red.shade400;
  static final Color secondRed = Colors.red.shade200;
  static const Color mainWhite = Colors.white;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: mainRed,
        body: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "POMOTIMER",
                  style: TextStyle(
                    color: mainWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: TimerView()),
            ],
          ),
        ),
      ),
    );
  }
}
