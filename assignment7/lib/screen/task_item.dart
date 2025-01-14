import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nomadcoders_flutter_challenge/model/my_colors.dart';

class TaskItem extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  final String title;
  final List<String> participant;
  final Color color;

  const TaskItem({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.participant,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            children: [
              _timeToText(startTime),
              const Text(
                "⎮",
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 24,
                ),
              ),
              _timeToText(endTime),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _participantToText(participant),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _timeToText(DateTime datetime) {
    final hour = DateFormat("HH").format(datetime);
    final minute = DateFormat("mm").format(datetime);

    return Column(
      children: [
        Text(
          hour,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          minute,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Row _participantToText(List<String> participant) {
    final int visibleCount = participant.length <= 3 ? participant.length : 3;
    final int invisibleCount = participant.length - 3;

    return Row(
      children: [
        for (int i = 0; i < visibleCount; i++)
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              participant[i].toUpperCase(),
              style: TextStyle(
                color: participant[i] == "Me"
                    ? Colors.black
                    : MyColors.blackOpacity,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        if (invisibleCount > 0)
          Text(
            "+$invisibleCount",
            style: const TextStyle(
              color: MyColors.blackOpacity,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
