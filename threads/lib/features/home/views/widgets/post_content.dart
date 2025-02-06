import 'package:flutter/material.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/shared/widget/profile/avatar.dart';
import 'package:threads/features/home/views/widgets/post_content_button_row.dart';
import 'package:threads/features/home/views/widgets/post_content_user_row.dart';

class PostContent extends StatelessWidget {
  final String userName;
  final String? userAvatarUrl;
  final String description;
  final List<String>? images;
  final String postTime;

  const PostContent({
    super.key,
    required this.userName,
    this.userAvatarUrl,
    required this.description,
    this.images,
    required this.postTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Avatar(
              imageUrl: userAvatarUrl,
              isShowAdd: true,
            ),
            // Expanded(
            //   child: Container(
            //     color: Colors.grey,
            //     width: 1,
            //   ),
            // ),
          ],
        ),
        Gaps.h10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostContentUserRow(
                userName: userName,
                postTime: postTime,
              ),
              Text(description),
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
              const PostContentButtonRow(),
            ],
          ),
        ),
      ],
    );
  }
}
