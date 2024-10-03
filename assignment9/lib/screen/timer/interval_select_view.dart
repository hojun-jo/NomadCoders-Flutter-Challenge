import 'package:assignment9/main.dart';
import 'package:assignment9/model/my_timer.dart';
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
    final timer = Provider.of<MyTimer>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _IntervalCard(
            interval: 15,
            selectedInterval: timer.totalSeconds,
            onTap: () {
              timer.setPomodoros(MyTimer.fifteen);
            },
          ),
          _IntervalCard(
            interval: 20,
            selectedInterval: timer.totalSeconds,
            onTap: () {
              timer.setPomodoros(MyTimer.twenty);
            },
          ),
          _IntervalCard(
            interval: 25,
            selectedInterval: timer.totalSeconds,
            onTap: () {
              timer.setPomodoros(MyTimer.twentyFive);
            },
          ),
          _IntervalCard(
            interval: 30,
            selectedInterval: timer.totalSeconds,
            onTap: () {
              timer.setPomodoros(MyTimer.thirty);
            },
          ),
          _IntervalCard(
            interval: 35,
            selectedInterval: timer.totalSeconds,
            onTap: () {
              timer.setPomodoros(MyTimer.thirtyFive);
            },
          ),
        ],
      ),
    );
  }
}

class _IntervalCard extends StatelessWidget {
  final int _interval;
  final int _selectedInterval;
  final VoidCallback _onTap;

  const _IntervalCard({
    super.key,
    required int interval,
    required int selectedInterval,
    required VoidCallback onTap,
  })  : _selectedInterval = selectedInterval,
        _interval = interval,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        decoration: BoxDecoration(
          color: _isSelected() ? MyApp.mainWhite : MyApp.mainRed,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _isSelected() ? MyApp.mainWhite : MyApp.secondRed,
            width: 4,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        margin: const EdgeInsets.only(right: 15),
        child: Text(
          "$_interval",
          style: TextStyle(
            color: _isSelected() ? MyApp.mainRed : MyApp.secondRed,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  bool _isSelected() {
    return _interval == _selectedInterval / 60;
  }
}
