import 'package:flutter/material.dart';
import 'package:threads/features/activity/models/activity_tab.dart';
import 'package:threads/features/activity/views/widgets/activity_tab_item.dart';
import 'package:threads/shared/widget/screen_title.dart';

// TODO: dummy activity data
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
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Text(tab.toString());
            },
          );
        }).toList(),
      ),
    );
  }
}
