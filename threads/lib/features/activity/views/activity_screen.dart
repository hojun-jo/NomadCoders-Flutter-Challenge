import 'package:flutter/material.dart';
import 'package:threads/core/constants/dummy.dart';
import 'package:threads/core/utils/date_formatter.dart';
import 'package:threads/features/activity/models/activity_model.dart';
import 'package:threads/features/activity/models/activity_tab.dart';
import 'package:threads/features/activity/views/widgets/activity_tab_item.dart';
import 'package:threads/core/widgets/list_item.dart';
import 'package:threads/core/widgets/list_separator.dart';
import 'package:threads/core/models/profile/avatar_decoration.dart';
import 'package:threads/core/widgets/screen_title.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _controller = TabController(
    length: ActivityTab.values.length,
    vsync: this,
  );

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      _selectedIndex = _controller.index;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ScreenTitle(text: "Activity"),
        centerTitle: false,
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          overlayColor: WidgetStateColor.transparent,
          tabAlignment: TabAlignment.start,
          labelPadding: const EdgeInsets.symmetric(horizontal: 4),
          tabs: ActivityTab.values.map((tab) {
            return ActivityTabItem(
              text: tab.toString(),
              isSelected: _selectedIndex == tab.toIndex(),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: ActivityTab.values.map((tab) {
          final items = _filterItems(tab);
          return ListView.separated(
            separatorBuilder: (context, index) => const ListSeparator(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListItem(
                avatarUrl: items[index].user.avatarUrl,
                avatarDecoration: items[index].avatarDecoration.toIcon(),
                avatarDecorationColor: items[index].avatarDecoration.toColor(),
                userName: items[index].user.name,
                userIsVerified: items[index].user.isVerified,
                notifiedTime:
                    DateFormatter.difference(items[index].notifiedTime),
                subtitle: items[index].user.bio,
                isShowFollowButton:
                    items[index].avatarDecoration == AvatarDecoration.following,
                description: items[index].description,
              );
            },
          );
        }).toList(),
      ),
    );
  }

  List<ActivityModel> _filterItems(ActivityTab tab) {
    switch (tab) {
      case ActivityTab.all:
        return dummyActivityModels;
      case ActivityTab.replies:
        return dummyActivityModels
            .where(
              (model) => model.avatarDecoration == AvatarDecoration.replies,
            )
            .toList();
      case ActivityTab.mentions:
        return dummyActivityModels
            .where(
              (model) => model.avatarDecoration == AvatarDecoration.mentions,
            )
            .toList();
      case ActivityTab.verified:
        return dummyActivityModels
            .where(
              (model) => model.user.isVerified,
            )
            .toList();
    }
  }
}
