import 'package:flutter/material.dart';
import 'package:threads/constants/gaps.dart';
import 'package:threads/features/home/views/widgets/avatar.dart';
import 'package:threads/features/home/views/widgets/post_replies_avatar.dart';

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
        _decideAvatarCount(replies),
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

  Widget _decideAvatarCount(int replies) {
    switch (replies) {
      case 0:
        return const CircleAvatar(
          backgroundColor: Colors.white,
        );
      case 1:
        return const Avatar();
      case 2:
        return const Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
            ),
            PostRepliesAvatar(
              left: 4,
              top: 10,
              size: 18,
            ),
            PostRepliesAvatar(
              right: 4,
              top: 10,
              size: 18,
            ),
          ],
        );
      default:
        return const Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
            ),
            PostRepliesAvatar(
              left: 2,
              top: 10,
              size: 18,
            ),
            PostRepliesAvatar(
              top: 2,
              right: 2,
              size: 20,
            ),
            PostRepliesAvatar(
              left: 16,
              bottom: 2,
              size: 14,
            ),
          ],
        );
    }
  }
}
