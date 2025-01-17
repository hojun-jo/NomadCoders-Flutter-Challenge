import 'package:assignment9/model/my_color.dart';
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: MyColor.mainRed,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "POMOTIMER",
                  style: TextStyle(
                    color: MyColor.mainWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Expanded(
                child: TimerView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
