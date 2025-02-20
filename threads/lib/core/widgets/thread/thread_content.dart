import 'package:flutter/material.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/widgets/profile/avatar.dart';
import 'package:threads/core/widgets/thread/thread_content_button_row.dart';
import 'package:threads/core/widgets/thread/thread_content_user_row.dart';

class ThreadContent extends StatelessWidget {
  final String userName;
  final String? avatarUrl;
  final IconData? avatarDecoration;
  final bool userIsVerified;
  final String description;
  final List<String>? images;
  final String postTime;

  const ThreadContent({
    super.key,
    required this.userName,
    this.avatarUrl,
    this.avatarDecoration,
    required this.userIsVerified,
    required this.description,
    this.images,
    required this.postTime,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Avatar(
              imageUrl: avatarUrl,
              decoration: avatarDecoration,
            ),
            // TODO: 오른쪽 Column 크기에 맞춰 세로선
            // Expanded(
            //   child: Container(
            //     color: Colors.grey.shade200,
            //     width: 2,
            //   ),
            // ),
          ],
        ),
        Gaps.h10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThreadContentUserRow(
                userName: userName,
                userIsVerified: userIsVerified,
                postTime: postTime,
              ),
              Text(
                description,
                style: TextStyle(
                  color: theme.primaryColor,
                ),
              ),
              Gaps.v10,
              if (images != null && images!.isNotEmpty)
                SizedBox(
                  height: 160,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Gaps.h10,
                    scrollDirection: Axis.horizontal,
                    itemCount: images!.length,
                    itemBuilder: (context, index) =>
                        Image.network(images![index]),
                  ),
                ),
              Gaps.v10,
              const ThreadContentButtonRow(),
            ],
          ),
        ),
      ],
    );
  }
}
