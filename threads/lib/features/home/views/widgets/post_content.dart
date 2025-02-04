import 'package:flutter/material.dart';
import 'package:threads/constants/gaps.dart';
import 'package:threads/features/home/views/widgets/avatar.dart';
import 'package:threads/features/home/views/widgets/post_content_button_row.dart';
import 'package:threads/features/home/views/widgets/post_content_user_row.dart';

class PostContent extends StatelessWidget {
  const PostContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Avatar(
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
              const PostContentUserRow(
                userName: 'asdf',
                postTime: '2m',
              ),
              const Text("asdlfkj oiasdjf okasdjflkjwel aowejoij sadfl"),
              Gaps.v10,
              Container(
                color: Colors.green,
                width: 200,
                height: 160,
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
