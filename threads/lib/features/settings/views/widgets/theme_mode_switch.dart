import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/providers/app_settings_provider.dart';

class ThemeModeSwitch extends ConsumerWidget {
  const ThemeModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDarkMode = ref.read(appSettingsProvider).value?.isDarkMode ?? false;
    return SwitchListTile.adaptive(
      activeColor: theme.primaryColor,
      title: Row(
        children: [
          Icon(
            isDarkMode ? FontAwesomeIcons.moon : FontAwesomeIcons.sun,
          ),
          Gaps.h16,
          Text(
            isDarkMode ? "Dark Mode" : "Light Mode",
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 17,
            ),
          ),
        ],
      ),
      value: isDarkMode,
      onChanged: (value) {
        final provider = ref.read(appSettingsProvider.notifier);
        provider.toggleThemeMode();
      },
    );
  }
}
