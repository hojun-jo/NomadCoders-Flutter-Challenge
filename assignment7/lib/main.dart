import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/screen/my_app_bar.dart';
import 'package:nomadcoders_flutter_challenge/screen/row_calendar.dart';
import 'package:nomadcoders_flutter_challenge/screen/task_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff202020),
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(),
            SizedBox(
              height: 20,
            ),
            RowCalendar(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TaskList(),
            ),
          ],
        ),
      ),
    );
  }
}
