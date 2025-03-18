import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PomodoroNotifier extends ChangeNotifier {
  static final int fifteenMinute = 15 * 60;

  late final Ticker _ticker;

  int _currentTime = fifteenMinute;
  bool _isActive = false;

  int get currentTime => _currentTime;
  double get progress => _currentTime / fifteenMinute;
  bool get isActive => _isActive;

  void initTicker(Ticker ticker) {
    _ticker = ticker;
  }

  void startTimer() {
    if (_isActive) return;
    if (_currentTime == 0) {
      resetTimer();
    }
    _isActive = true;
    _ticker.start();
    notifyListeners();
  }

  void pauseTimer() {
    if (!_isActive) return;
    _ticker.stop();
    _isActive = false;
    notifyListeners();
  }

  void resetTimer() {
    if (_isActive) {
      _ticker.stop();
    }
    _currentTime = fifteenMinute;
    _isActive = false;
    notifyListeners();
  }

  void progressTimer() {
    if (_currentTime > 0) {
      _currentTime -= 1;
    } else {
      _ticker.stop();
      _isActive = false;
    }
    notifyListeners();
  }
}
