import 'package:flutter/material.dart';
import 'package:threads/core/widgets/thread/thread_content.dart';
import 'package:threads/core/widgets/thread/thread_replies_row.dart';

class ThreadItem extends StatelessWidget {
  final String userName;
  final String? avatarUrl;
  final IconData? avatarDecoration;
  final bool userIsVerified;
  final String description;
  final List<String>? images;
  final String postTime;
  final int replies;
  final int likes;

  const ThreadItem({
    super.key,
    required this.userName,
    this.avatarUrl,
    this.avatarDecoration,
    required this.userIsVerified,
    required this.description,
    this.images,
    required this.postTime,
    required this.replies,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ThreadContent(
            userName: userName,
            avatarUrl: avatarUrl,
            avatarDecoration: avatarDecoration,
            userIsVerified: userIsVerified,
            description: description,
            images: images,
            postTime: postTime,
          ),
          ThreadRepliesRow(
            replies: replies,
            likes: likes,
          ),
        ],
      ),
    );
  }
}
