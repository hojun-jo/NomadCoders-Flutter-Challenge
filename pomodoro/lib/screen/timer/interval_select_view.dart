import 'package:assignment9/model/my_timer.dart';
import 'package:assignment9/screen/timer/widget/interval_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntervalSelectView extends StatefulWidget {
  const IntervalSelectView({super.key});

  @override
  State<IntervalSelectView> createState() => _IntervalSelectViewState();
}

class _IntervalSelectViewState extends State<IntervalSelectView> {
  @override
  Widget build(BuildContext context) {
    final intervals = [15, 20, 25, 30, 35];
    final timer = Provider.of<MyTimer>(context);

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: SingleChildScrollView(
        // TODO: - 선택한 인터벌카드가 가운데로 올 수 있도록
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i in intervals)
              IntervalCard(
                interval: i,
                selectedInterval: timer.pomodoroSeconds,
                onTap: () {
                  timer.setPomodoros(i);
                },
              ),
          ],
        ),
      ),
    );
  }
}
