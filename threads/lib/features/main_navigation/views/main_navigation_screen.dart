import 'package:flutter/material.dart';
import 'package:threads/features/home/view_models/home_view_model.dart';
import 'package:threads/features/home/views/home_screen.dart';
import 'package:threads/features/activity/views/activity_screen.dart';
import 'package:threads/features/main_navigation/models/main_navigation_tab.dart';
import 'package:threads/features/main_navigation/views/widgets/navigation_tab.dart';
import 'package:threads/features/write/views/write_screen.dart';
import 'package:threads/features/profile/views/profile_screen.dart';
import 'package:threads/features/search/views/search_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  MainNavigationTab _selectedTab = MainNavigationTab.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ...[
              (
                tab: MainNavigationTab.home,
                screen: HomeScreen(viewModel: HomeViewModel()),
              ),
              (tab: MainNavigationTab.search, screen: const SearchScreen()),
              (tab: MainNavigationTab.likes, screen: const ActivityScreen()),
              (tab: MainNavigationTab.profile, screen: const ProfileScreen()),
            ].map(
              (e) => Offstage(
                offstage: _selectedTab != e.tab,
                child: e.screen,
              ),
            ),
          ],
        ),
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
