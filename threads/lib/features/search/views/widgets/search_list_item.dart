import 'package:flutter/material.dart';
import 'package:threads/core/constants/dummy.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/shared/widget/follow_button.dart';
import 'package:threads/shared/widget/profile/avatar.dart';
import 'package:threads/shared/widget/profile/user_name_check_icon_row.dart';

class SearchListItem extends StatelessWidget {
  // TODO: user model 받아야함
  final bool isShowIcon;

  const SearchListItem({
    super.key,
    required this.isShowIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          leading: Avatar(imageUrl: dummyAvatarUrl),
          title: UserNameCheckIconRow(
            userName: "userName",
            isVerified: true,
          ),
          subtitle: Text(
            "one line introduce?",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          trailing: FollowButton(),
        ),
        Row(
          children: [
            Gaps.h72,
            if (isShowIcon)
              const Icon(
                Icons.star_rounded,
                size: 20,
              ),
            const Text(
              "301K followers",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
