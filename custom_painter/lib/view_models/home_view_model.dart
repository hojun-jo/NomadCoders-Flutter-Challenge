import 'package:custom_painter/notifiers/pomodoro_notifier.dart';

class HomeViewModel {
  final PomodoroNotifier pomodoro;

  HomeViewModel({required this.pomodoro});

  String restTime() {
    return Duration(
      seconds: pomodoro.currentTime,
    ).toString().split(".").first.substring(2, 7);
  }
}
