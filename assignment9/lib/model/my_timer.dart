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

  int totalSeconds = twentyFive;
  int _currentSeconds = twentyFive;
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
      const Duration(seconds: 1),
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
    _currentSeconds = totalSeconds;
    notifyListeners();
  }

  void onTick(Timer timer) {
    if (_currentSeconds == 0) {
      if (isRest) {
        isRest = false;
        _currentSeconds = totalSeconds;
      } else {
        _raiseRound();
        isRest = true;
        _currentSeconds = five;
        totalSeconds = five;
      }
    } else {
      if (isRunning) {
        _currentSeconds--;
      }
    }
    notifyListeners();
  }

  String minutesFormat() {
    return formatter.format(_currentSeconds ~/ 60);
  }

  String secondsFormat() {
    return formatter.format(_currentSeconds % 60);
  }

  void setPomodoros(int seconds) {
    onResetPressed();
    _currentSeconds = seconds;
    totalSeconds = seconds;
    notifyListeners();
  }

  void _raiseRound() {
    if (currentRound < maxRound) {
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
