import 'package:custom_painter/view_models/pomodoro_notifier.dart';

class HomeViewModel {
  final PomodoroNotifier pomodoro;

  HomeViewModel({required this.pomodoro});

  String restTime() {
    final minute = pomodoro.currentTime ~/ 60;
    final seconds = pomodoro.currentTime % 60;
    String minuteString = "$minute";
    String secondsString = "$seconds";

    if (minute < 10) {
      minuteString = "0$minuteString";
    }
    if (seconds < 10) {
      secondsString = "0$secondsString";
    }

    return "$minuteString:$secondsString";
  }
}
