import 'package:assignment9/main.dart';
import 'package:assignment9/screen/timer/interval_select_view.dart';
import 'package:assignment9/screen/timer/widget/counter_view.dart';
import 'package:assignment9/screen/timer/widget/timer_button.dart';
import 'package:assignment9/screen/timer/widget/timer_card.dart';
import 'package:assignment9/model/my_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    final timer = Provider.of<MyTimer>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerCard(timer.minutesFormat()),
            Text(
              ":",
              style: TextStyle(
                color: MyApp.secondRed,
                fontSize: 80,
              ),
            ),
            TimerCard(timer.secondsFormat()),
          ],
        ),
        const IntervalSelectView(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerButton(
              isRunning: timer.isRunning,
              onTap: () {
                timer.isRunning
                    ? timer.onPausePressed()
                    : timer.onStartPressed();
              },
            ),
            IconButton(
              onPressed: () {
                timer.onResetPressed();
              },
              icon: const Icon(
                Icons.restore,
                size: 40,
                color: MyApp.mainWhite,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CounterView(
              title: "ROUND",
              current: timer.currentRound,
              max: timer.maxRound,
            ),
            CounterView(
              title: "GOAL",
              current: timer.currentGoal,
              max: timer.maxGoal,
            ),
          ],
        ),
      ],
    );
  }
}
