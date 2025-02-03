import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            Offstage(
              offstage: _selectedTab != MainNavigationTab.home,
              child: const HomeScreen(),
            ),
            Offstage(
              offstage: _selectedTab != MainNavigationTab.search,
              child: const SearchScreen(),
            ),
            Offstage(
              offstage: _selectedTab != MainNavigationTab.post,
              child: const PostScreen(),
            ),
            Offstage(
              offstage: _selectedTab != MainNavigationTab.likes,
              child: const LikesScreen(),
            ),
            Offstage(
              offstage: _selectedTab != MainNavigationTab.profile,
              child: const ProfileScreen(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Container _bottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 40,
        right: 40,
        bottom: 48,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavigationTab(
            isSelected: _selectedTab == MainNavigationTab.home,
            icon: FontAwesomeIcons.house,
            onTap: () => _onNavigationTabTap(MainNavigationTab.home),
          ),
          NavigationTab(
            isSelected: _selectedTab == MainNavigationTab.search,
            icon: FontAwesomeIcons.magnifyingGlass,
            onTap: () => _onNavigationTabTap(MainNavigationTab.search),
          ),
          NavigationTab(
            isSelected: _selectedTab == MainNavigationTab.post,
            icon: FontAwesomeIcons.penToSquare,
            onTap: () => _onNavigationTabTap(MainNavigationTab.post),
          ),
          NavigationTab(
            isSelected: _selectedTab == MainNavigationTab.likes,
            icon: FontAwesomeIcons.heart,
            onTap: () => _onNavigationTabTap(MainNavigationTab.likes),
          ),
          NavigationTab(
            isSelected: _selectedTab == MainNavigationTab.profile,
            icon: FontAwesomeIcons.user,
            onTap: () => _onNavigationTabTap(MainNavigationTab.profile),
          ),
        ],
      ),
    );
  }

  void _onNavigationTabTap(MainNavigationTab tab) {
    _selectedTab = tab;
    setState(() {});
  }
}
