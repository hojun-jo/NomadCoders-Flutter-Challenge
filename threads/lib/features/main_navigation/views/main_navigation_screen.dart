import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/utils/date_formatter.dart';
import 'package:threads/features/home/view_models/home_view_model.dart';
import 'package:threads/features/home/views/home_screen.dart';
import 'package:threads/features/likes/views/likes_screen.dart';
import 'package:threads/features/main_navigation/models/main_navigation_tab.dart';
import 'package:threads/features/main_navigation/views/widgets/navigation_tab.dart';
import 'package:threads/features/post/views/post_screen.dart';
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
                screen: HomeScreen(
                  viewModel: HomeViewModel(
                    dateFormatter: DateFormatter(),
                  ),
                ),
              ),
              (tab: MainNavigationTab.search, screen: const SearchScreen()),
              (tab: MainNavigationTab.post, screen: const PostScreen()),
              (tab: MainNavigationTab.likes, screen: const LikesScreen()),
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
          children: [
            ...[
              (tab: MainNavigationTab.home, icon: FontAwesomeIcons.house),
              (
                tab: MainNavigationTab.search,
                icon: FontAwesomeIcons.magnifyingGlass
              ),
              (tab: MainNavigationTab.post, icon: FontAwesomeIcons.penToSquare),
              (tab: MainNavigationTab.likes, icon: FontAwesomeIcons.heart),
              (tab: MainNavigationTab.profile, icon: FontAwesomeIcons.user),
            ].map(
              (e) => NavigationTab(
                isSelected: _selectedTab == e.tab,
                icon: e.icon,
                onTap: () => _onNavigationTabTap(e.tab),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onNavigationTabTap(MainNavigationTab tab) {
    _selectedTab = tab;
    setState(() {});
  }
}
