import 'package:custom_painter/constants/app_colors.dart';
import 'package:custom_painter/view_models/home_view_model.dart';
import 'package:custom_painter/views/widgets/background_circle.dart';
import 'package:custom_painter/views/widgets/circle_icon_button.dart';
import 'package:custom_painter/views/widgets/timer_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomePage({super.key, required this.viewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((duration) {
      // TODO: (촬영용으로 빠르게 하는 중) duration 1초마다 진행하도록 수정
      widget.viewModel.pomodoro.progressTimer();
    });
    widget.viewModel.pomodoro.initTicker(_ticker);
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel.pomodoro,
      builder: (context, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    widget.viewModel.restTime(),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomPaint(
                  painter: BackgroundCircle(),
                  size: Size.fromRadius(120),
                ),
                CustomPaint(
                  painter: TimerCircle(
                    progress: widget.viewModel.pomodoro.progress,
                  ),
                  size: Size.fromRadius(120),
                ),
              ],
            ),
            Expanded(
              child: Row(
                spacing: 30,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleIconButton(
                    icon: Icons.refresh,
                    onTap: widget.viewModel.pomodoro.resetTimer,
                  ),
                  CircleIconButton(
                    icon:
                        widget.viewModel.pomodoro.isActive
                            ? Icons.pause
                            : Icons.play_arrow,
                    iconColor: Colors.white,
                    iconSize: 40,
                    radius: 40,
                    backgroundColor: AppColors.lightRed,
                    onTap:
                        widget.viewModel.pomodoro.isActive
                            ? widget.viewModel.pomodoro.pauseTimer
                            : widget.viewModel.pomodoro.startTimer,
                  ),
                  CircleIconButton(
                    icon: Icons.stop,
                    onTap: widget.viewModel.pomodoro.resetTimer,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
