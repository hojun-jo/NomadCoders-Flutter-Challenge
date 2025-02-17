import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/namespace/app_routes.dart';

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

  String toPath() {
    switch (this) {
      case MainNavigationTab.home:
        return AppRoutes.home;
      case MainNavigationTab.search:
        return AppRoutes.search;
      case MainNavigationTab.write:
        return "";
      case MainNavigationTab.activity:
        return AppRoutes.activity;
      case MainNavigationTab.profile:
        return AppRoutes.profile;
    }
  }
}
