import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyTimer with ChangeNotifier {
  static const five = 5 * 60;
  static const fifteen = 15 * 60;
  static const twenty = 20 * 60;
  static const twentyFive = 25 * 60;
  static const thirty = 30 * 60;
  static const thirtyFive = 35 * 60;

  int pomodoroSeconds = twentyFive;
  int _remainSeconds = twentyFive;
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
        _remainSeconds = five;
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

  void setPomodoros(int seconds) {
    onResetPressed();
    _remainSeconds = seconds;
    pomodoroSeconds = seconds;
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
