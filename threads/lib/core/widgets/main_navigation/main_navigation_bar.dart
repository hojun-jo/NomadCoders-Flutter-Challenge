import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/core/widgets/main_navigation/navigation_tab.dart';
import 'package:threads/features/write/views/write_screen.dart';

class MainNavigationBar extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigationBar({
    super.key,
    required this.navigationShell,
  });

  @override
  ConsumerState<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends ConsumerState<MainNavigationBar> {
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _setSelectedTab(widget.navigationShell.currentIndex);
  }

  void _setSelectedTab(int index) {
    _selectedTab = index;
    setState(() {});
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
          children: [
            ...[
              (index: 0, icon: FontAwesomeIcons.house),
              (index: 1, icon: FontAwesomeIcons.magnifyingGlass),
              (index: -1, icon: FontAwesomeIcons.penToSquare),
              (index: 2, icon: FontAwesomeIcons.heart),
              (index: 3, icon: FontAwesomeIcons.user),
            ].map(
              (tab) => NavigationTab(
                isSelected: _selectedTab == tab.index,
                icon: tab.icon,
                onTap: () => _onNavigationTabTap(tab.index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onNavigationTabTap(int index) {
    if (index == -1) {
      _showWriteScreen();
      return;
    }
    _setSelectedTab(index);
    widget.navigationShell.goBranch(index);
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
