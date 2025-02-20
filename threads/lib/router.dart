import 'package:go_router/go_router.dart';
import 'package:threads/core/constants/namespace/app_routes.dart';
import 'package:threads/features/main_navigation/views/main_navigation_screen.dart';
import 'package:threads/features/settings/views/privacy_screen.dart';
import 'package:threads/features/settings/views/settings_screen.dart';

final router = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        return const MainNavigationScreen(tab: AppRoutes.home);
      },
    ),
    GoRoute(
      path: AppRoutes.search,
      builder: (context, state) {
        return const MainNavigationScreen(tab: AppRoutes.search);
      },
    ),
    GoRoute(
      path: AppRoutes.activity,
      builder: (context, state) {
        return const MainNavigationScreen(tab: AppRoutes.activity);
      },
    ),
    GoRoute(
      path: AppRoutes.profile,
      builder: (context, state) {
        return const MainNavigationScreen(tab: AppRoutes.profile);
      },
    ),
    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) {
        return const SettingsScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.privacy,
      builder: (context, state) {
        return const PrivacyScreen();
      },
    ),
  ],
);
