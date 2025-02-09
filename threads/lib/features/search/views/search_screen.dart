import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:threads/core/constants/dummy.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/widgets/list_item.dart';
import 'package:threads/core/widgets/list_separator.dart';
import 'package:threads/core/widgets/screen_title.dart';

// TODO: 검색 기능 추가
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Scaffold로 수정(ActivityScreen과 일관성)
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
        // TODO: 데이터 바인딩
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const ListSeparator(),
            itemCount: dummyUsers.length,
            itemBuilder: (context, index) {
              return ListItem(
                avatarUrl: dummyUsers[index].avatarUrl,
                userName: dummyUsers[index].name,
                userIsVerified: dummyUsers[index].isVerified,
                subtitle: dummyUsers[index].bio,
                isShowFollowButton: true,
                description:
                    // TODO: 로직 분리
                    "${NumberFormat.compact().format(dummyUsers[index].followers)} followers",
                isShowStar: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
