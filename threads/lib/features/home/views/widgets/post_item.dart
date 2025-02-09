import 'package:flutter/material.dart';
import 'package:threads/features/home/views/widgets/post_content.dart';
import 'package:threads/features/home/views/widgets/post_replies_row.dart';

class PostItem extends StatelessWidget {
  final String userName;
  final String? avatarUrl;
  final IconData? avatarDecoration;
  final bool userIsVerified;
  final String description;
  final List<String>? images;
  final String postTime;
  final int replies;
  final int likes;

  const PostItem({
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
          PostContent(
            userName: userName,
            avatarUrl: avatarUrl,
            avatarDecoration: avatarDecoration,
            userIsVerified: userIsVerified,
            description: description,
            images: images,
            postTime: postTime,
          ),
          PostRepliesRow(
            replies: replies,
            likes: likes,
          ),
        ],
      ),
    );
  }
}
