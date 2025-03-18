import 'package:custom_painter/constants/app_colors.dart';
import 'package:custom_painter/view_models/home_view_model.dart';
import 'package:custom_painter/notifiers/pomodoro_notifier.dart';
import 'package:custom_painter/views/home_page.dart';
import 'package:flutter/material.dart';

class CustomPainterApp extends StatelessWidget {
  const CustomPainterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Custom Painter",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.lightRed),
      ),
      home: Scaffold(
        body: SafeArea(
          child: HomePage(
            viewModel: HomeViewModel(pomodoro: PomodoroNotifier()),
          ),
        ),
      ),
    );
  }
}
