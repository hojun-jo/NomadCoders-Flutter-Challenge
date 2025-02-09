import 'package:flutter/material.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/widgets/follow_button.dart';
import 'package:threads/core/widgets/profile/avatar.dart';
import 'package:threads/core/widgets/profile/user_name_check_icon_row.dart';

class ListItem extends StatelessWidget {
  final String? avatarUrl;
  final String userName;
  final bool userIsVerified;
  final String? notifiedTime;
  final String subtitle;
  final bool isShowFollowButton;
  final IconData? avatarDecoration;
  final Color? avatarDecorationColor;
  final String? description;
  final bool isShowStar;

  const ListItem({
    super.key,
    this.avatarUrl,
    required this.userName,
    required this.userIsVerified,
    this.notifiedTime,
    required this.subtitle,
    required this.isShowFollowButton,
    this.avatarDecoration,
    this.avatarDecorationColor,
    this.description,
    this.isShowStar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Avatar(
            imageUrl: avatarUrl,
            decoration: avatarDecoration,
            decorationColor: avatarDecorationColor,
          ),
          title: UserNameCheckIconRow(
            userName: userName,
            isVerified: userIsVerified,
            notifiedTime: notifiedTime,
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: isShowFollowButton ? const FollowButton() : null,
        ),
        if (description != null)
          Row(
            children: [
              Gaps.h72,
              if (isShowStar)
                const Icon(
                  Icons.star_rounded,
                  size: 20,
                ),
              Flexible(
                child: Text(
                  description!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
