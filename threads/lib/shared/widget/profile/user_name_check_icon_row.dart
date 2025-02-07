import 'package:flutter/material.dart';
import 'package:threads/core/constants/gaps.dart';

class UserNameCheckIconRow extends StatelessWidget {
  final String userName;
  final bool isChecked;

  const UserNameCheckIconRow({
    super.key,
    required this.userName,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          userName,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.h4,
        if (isChecked)
          const Icon(
            Icons.check_circle,
            size: 14,
            color: Colors.blue,
          ),
      ],
    );
  }
}
