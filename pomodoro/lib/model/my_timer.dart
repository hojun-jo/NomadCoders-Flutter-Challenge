import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyTimer with ChangeNotifier {
  int pomodoroSeconds = 25 * 60;
  int _remainSeconds = 25 * 60;
  int maxRound;
  int currentRound = 0;
  int maxGoal;
  int currentGoal = 0;
  bool isRunning = false;
  bool isRest = false;

  late Timer timer = Timer(const Duration(seconds: 1), () {});
  final NumberFormat formatter = NumberFormat("00");

  MyTimer({
    required this.maxRound,
    required this.maxGoal,
  });

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(milliseconds: 10),
      onTick,
    );
    isRunning = true;
    notifyListeners();
  }

  void onPausePressed() {
    timer.cancel();
    isRunning = false;
    notifyListeners();
  }

  void onResetPressed() {
    timer.cancel();
    isRunning = false;
    _remainSeconds = pomodoroSeconds;
    notifyListeners();
  }

  void onTick(Timer timer) {
    if (_remainSeconds == 0) {
      if (isRest) {
        isRest = false;
        _remainSeconds = pomodoroSeconds;
      } else {
        _raiseRound();
        isRest = true;
        _remainSeconds = 5 * 60;
      }
    } else {
      if (isRunning) {
        _remainSeconds--;
      }
    }
    notifyListeners();
  }

  String minutesFormat() {
    return formatter.format(_remainSeconds ~/ 60);
  }

  String secondsFormat() {
    return formatter.format(_remainSeconds % 60);
  }

  void setPomodoros(int minutes) {
    onResetPressed();
    _remainSeconds = minutes * 60;
    pomodoroSeconds = minutes * 60;
    notifyListeners();
  }

  void _raiseRound() {
    if (currentRound < maxRound - 1) {
      currentRound++;
    } else {
      currentRound = 0;
      _raiseGoal();
    }
  }

  void _raiseGoal() {
    if (currentGoal < maxGoal) {
      currentGoal++;
    } else {
      isRunning = false;
    }
  }
}
