import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum MainNavigationTab {
  home,
  search,
  write,
  activity,
  profile;

  IconData toIcon() {
    switch (this) {
      case MainNavigationTab.home:
        return FontAwesomeIcons.house;
      case MainNavigationTab.search:
        return FontAwesomeIcons.magnifyingGlass;
      case MainNavigationTab.write:
        return FontAwesomeIcons.penToSquare;
      case MainNavigationTab.activity:
        return FontAwesomeIcons.heart;
      case MainNavigationTab.profile:
        return FontAwesomeIcons.user;
    }
  }

  int toIndex() {
    switch (this) {
      case MainNavigationTab.home:
        return 0;
      case MainNavigationTab.search:
        return 1;
      case MainNavigationTab.write:
        return -1;
      case MainNavigationTab.activity:
        return 2;
      case MainNavigationTab.profile:
        return 3;
    }
  }
}
