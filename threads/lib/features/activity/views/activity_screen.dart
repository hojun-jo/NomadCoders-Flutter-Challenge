import 'package:flutter/material.dart';
import 'package:threads/features/activity/models/activity_tab.dart';
import 'package:threads/features/activity/views/widgets/activity_tab_item.dart';
import 'package:threads/shared/widget/screen_title.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int _selectedIndex = 0;

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
            labelPadding: const EdgeInsets.symmetric(horizontal: 4),
            tabs: ActivityTab.values.map((tab) {
              return ActivityTabItem(
                text: tab.toString(),
                isSelected: _selectedIndex == tab.toIndex(),
              );
            }).toList(),
            onTap: (index) {
              _selectedIndex = index;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
