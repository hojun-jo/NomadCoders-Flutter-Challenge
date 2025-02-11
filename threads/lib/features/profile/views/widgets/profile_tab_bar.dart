import 'package:flutter/material.dart';
import 'package:threads/features/profile/models/profile_tab.dart';

class ProfileTabBar extends SliverPersistentHeaderDelegate {
  final TabController controller;

  ProfileTabBar({required this.controller});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return TabBar(
      controller: controller,
      splashFactory: NoSplash.splashFactory,
      indicatorColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.black,
      labelStyle: const TextStyle(
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
