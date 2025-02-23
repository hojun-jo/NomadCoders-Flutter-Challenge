import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/core/constants/namespace/app_routes.dart';
import 'package:threads/features/activity/views/activity_screen.dart';
import 'package:threads/features/auth/views/sign_in_screen.dart';
import 'package:threads/features/auth/views/sign_up_screen.dart';
import 'package:threads/features/home/view_models/home_view_model.dart';
import 'package:threads/features/home/views/home_screen.dart';
import 'package:threads/core/widgets/main_navigation/main_navigation_bar.dart';
import 'package:threads/features/profile/views/profile_screen.dart';
import 'package:threads/features/search/views/search_screen.dart';
import 'package:threads/features/settings/views/privacy_screen.dart';
import 'package:threads/features/settings/views/settings_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _profileNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'profile');

final routerProvider = Provider((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.signIn,
    // TODO: redirect
    // redirect: (context, state) {
    //   final isLoggedIn = ref.read(authRepo).isLoggedIn;

    //   if (!isLoggedIn) {
    //     print(state.fullPath); // state가 가지고 있는 것들 다 null나오는 중
    //     if (state.path != AppRoutes.signIn && state.path != AppRoutes.signUp) {
    //       return AppRoutes.signIn;
    //     }
    //   }

    //   return null;
    // },
    routes: [
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainNavigationBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => HomeScreen(
                  viewModel: HomeViewModel(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.search,
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.activity,
                builder: (context, state) => const ActivityScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
              GoRoute(
                path: AppRoutes.settings,
                builder: (context, state) => const SettingsScreen(),
              ),
              GoRoute(
                path: AppRoutes.privacy,
                builder: (context, state) => const PrivacyScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
