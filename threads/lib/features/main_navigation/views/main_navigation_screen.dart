import 'package:flutter/material.dart';
import 'package:threads/features/home/views/home_screen.dart';
import 'package:threads/features/likes/views/likes_screen.dart';
import 'package:threads/features/main_navigation/models/main_navigation_tab.dart';
import 'package:threads/features/post/views/post_screen.dart';
import 'package:threads/features/profile/views/profile_screen.dart';
import 'package:threads/features/search/views/search_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final MainNavigationTab _selectedTab = MainNavigationTab.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Offstage(
              offstage: _selectedTab == MainNavigationTab.home,
              child: const HomeScreen(),
            ),
            Offstage(
              offstage: _selectedTab == MainNavigationTab.search,
              child: const SearchScreen(),
            ),
            Offstage(
              offstage: _selectedTab == MainNavigationTab.post,
              child: const PostScreen(),
            ),
            Offstage(
              offstage: _selectedTab == MainNavigationTab.likes,
              child: const LikesScreen(),
            ),
            Offstage(
              offstage: _selectedTab == MainNavigationTab.profile,
              child: const ProfileScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
