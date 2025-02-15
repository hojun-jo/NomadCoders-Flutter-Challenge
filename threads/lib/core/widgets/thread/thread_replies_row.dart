import 'package:flutter/material.dart';
import 'package:threads/core/constants/dummy.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/widgets/profile/avatar.dart';
import 'package:threads/core/widgets/thread/thread_replies_avatar.dart';

class ThreadRepliesRow extends StatelessWidget {
  final int replies;
  final int likes;

  const ThreadRepliesRow({
    super.key,
    required this.replies,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _decideAvatarCount(
          context,
          replies,
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

  Widget _decideAvatarCount(BuildContext context, int replies) {
    switch (replies) {
      case 0:
        return CircleAvatar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        );
      case 1:
        return const Avatar(
          imageUrl: dummyAvatarUrl,
        );
      case 2:
        return Stack(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            const ThreadRepliesAvatar(
              left: 4,
              top: 10,
              size: 18,
              imageUrl: dummyAvatarUrl,
            ),
            const ThreadRepliesAvatar(
              right: 4,
              top: 10,
              size: 18,
              imageUrl: dummyAvatarUrl,
            ),
          ],
        );
      default:
        return Stack(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            const ThreadRepliesAvatar(
              left: 2,
              top: 10,
              size: 18,
              imageUrl: dummyAvatarUrl,
            ),
            const ThreadRepliesAvatar(
              top: 2,
              right: 2,
              size: 20,
              imageUrl: dummyAvatarUrl,
            ),
            const ThreadRepliesAvatar(
              left: 16,
              bottom: 2,
              size: 14,
              imageUrl: dummyAvatarUrl,
            ),
          ],
        );
    }
  }
}
