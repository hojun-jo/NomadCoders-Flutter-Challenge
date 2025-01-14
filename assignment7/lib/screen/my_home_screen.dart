import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/model/my_colors.dart';
import 'package:nomadcoders_flutter_challenge/screen/my_app_bar.dart';
import 'package:nomadcoders_flutter_challenge/screen/row_calendar.dart';
import 'package:nomadcoders_flutter_challenge/screen/task_list.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.mainBackground,
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
