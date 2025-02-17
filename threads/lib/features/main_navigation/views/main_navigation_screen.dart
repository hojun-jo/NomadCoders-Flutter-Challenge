import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/features/main_navigation/models/main_navigation_tab.dart';
import 'package:threads/features/main_navigation/views/widgets/navigation_tab.dart';
import 'package:threads/features/write/views/write_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigationScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  MainNavigationTab _selectedTab = MainNavigationTab.home;

  @override
  void initState() {
    super.initState();
    _setSelectedTab(widget.navigationShell.currentIndex);
  }

  void _setSelectedTab(int index) {
    if (index == 0) {
      _selectedTab = MainNavigationTab.home;
    }
    if (index == 1) {
      _selectedTab = MainNavigationTab.search;
    }
    if (index == 2) {
      _selectedTab = MainNavigationTab.activity;
    }
    if (index == 3) {
      _selectedTab = MainNavigationTab.profile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.navigationShell,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 40,
          right: 40,
          bottom: 48,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: MainNavigationTab.values
              .map(
                (tab) => NavigationTab(
                  isSelected: _selectedTab == tab,
                  icon: tab.toIcon(),
                  onTap: () => _onNavigationTabTap(tab),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void _onNavigationTabTap(MainNavigationTab tab) {
    if (tab == MainNavigationTab.write) {
      _showWriteScreen();
      return;
    }
    _selectedTab = tab;
    setState(() {});
    widget.navigationShell.goBranch(tab.toIndex());
  }

  void _showWriteScreen() {
    showModalBottomSheet(
      isScrollControlled: true,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.93),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) {
        return const WriteScreen();
      },
    );
  }
}
