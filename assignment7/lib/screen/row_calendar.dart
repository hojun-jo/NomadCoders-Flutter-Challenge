import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RowCalendar extends StatefulWidget {
  const RowCalendar({super.key});

  @override
  State<RowCalendar> createState() => _RowCalendarState();
}

class _RowCalendarState extends State<RowCalendar> {
  final today = DateTime.now();
  final todayFormat = DateFormat("EEEE d");
  late final lastDay = DateTime(today.year, today.month + 1, 0).day;

  List<int> days = [];

  @override
  void initState() {
    super.initState();
    for (int i = today.day + 1; i <= lastDay; i++) {
      days.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            todayFormat.format(today).toUpperCase(),
            style: const TextStyle(
              color: Color(0xffDFDFDF),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const Text(
                  "TODAY",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                const Text(
                  "•",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...days.map((element) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      "$element",
                      style: const TextStyle(
                        color: Color(0xff8E8E8E),
                        fontSize: 40,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
