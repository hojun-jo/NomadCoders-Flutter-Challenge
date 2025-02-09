import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads/core/constants/dummy.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/widgets/list_item.dart';
import 'package:threads/core/widgets/list_separator.dart';
import 'package:threads/core/widgets/screen_title.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ScreenTitle(text: "Search"),
              Gaps.v10,
              CupertinoSearchTextField(),
            ],
          ),
        ),
        Gaps.v10,
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const ListSeparator(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ListItem(
                avatarUrl: dummyAvatarUrl,
                userName: "userName",
                userIsVerified: true,
                subtitle: "one line introduce?",
                isShowFollowButton: true,
                description: "301K followers",
                isShowStar: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
