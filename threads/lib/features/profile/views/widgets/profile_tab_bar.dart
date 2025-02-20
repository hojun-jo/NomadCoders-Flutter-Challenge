import 'package:flutter/material.dart';
import 'package:threads/features/profile/models/profile_tab.dart';

class ProfileTabBar extends SliverPersistentHeaderDelegate {
  final TabController controller;

  ProfileTabBar({required this.controller});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: TabBar(
        controller: controller,
        splashFactory: NoSplash.splashFactory,
        indicatorColor: theme.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: theme.primaryColor,
        labelStyle: TextStyle(
          color: theme.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: Colors.grey,
        tabs: ProfileTab.values.map((tab) {
          return Center(
            child: Text(
              tab.toString(),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
