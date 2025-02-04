import 'package:flutter/material.dart';
import 'package:threads/constants/gaps.dart';

class PostRepliesRow extends StatelessWidget {
  final int replies;
  final int likes;

  const PostRepliesRow({
    super.key,
    required this.replies,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.orange,
        ),
        Gaps.h10,
        Text(
          "$replies replies · $likes likes",
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
