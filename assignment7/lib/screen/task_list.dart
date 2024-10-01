import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/screen/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TaskItem(
            startTime: DateTime(2024, 10, 1, 11, 30),
            endTime: DateTime(2024, 10, 1, 12, 20),
            title: "Design Meeting",
            participant: const ["Alex", "Helena", "Nana"],
            color: Colors.yellow,
          ),
          TaskItem(
            startTime: DateTime(2024, 10, 1, 12, 35),
            endTime: DateTime(2024, 10, 1, 14, 10),
            title: "Daily Project",
            participant: const [
              "Me",
              "Richard",
              "Ciry",
              "Alex",
              "Helena",
              "Nana",
              "Mark"
            ],
            color: Colors.purple.shade200,
          ),
          TaskItem(
            startTime: DateTime(2024, 10, 1, 15, 00),
            endTime: DateTime(2024, 10, 1, 16, 30),
            title: "Weekly Planning",
            participant: const ["Den", "Nana", "Mark"],
            color: Colors.green,
          ),
          TaskItem(
            startTime: DateTime(2024, 10, 1, 11, 30),
            endTime: DateTime(2024, 10, 1, 12, 20),
            title: "Design Meeting",
            participant: const ["Alex", "Helena", "Nana"],
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
