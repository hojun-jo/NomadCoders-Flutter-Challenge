import 'package:flutter/material.dart';
import 'package:threads/shared/widget/screen_title.dart';

enum ActivityTab {
  all,
  replies,
  mentions,
  verified;

  @override
  String toString() {
    switch (this) {
      case ActivityTab.all:
        return "All";
      case ActivityTab.replies:
        return "Replies";
      case ActivityTab.mentions:
        return "Mentions";
      case ActivityTab.verified:
        return "Verified";
    }
  }
}

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ActivityTab.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: const ScreenTitle(text: "Activity"),
          centerTitle: false,
          bottom: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            overlayColor: WidgetStateColor.transparent,
            tabAlignment: TabAlignment.start,
            tabs: ActivityTab.values.map(
              (e) {
                return Tab(
                  // text: e.toString(),
                  child: Container(
                    width: 100,
                    height: 36,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        e.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
