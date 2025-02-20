import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/features/settings/view_models/settings_view_model.dart';

class ThemeModeSwitch extends StatelessWidget {
  const ThemeModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewModel = context.watch<SettingsViewModel>();
    return SwitchListTile.adaptive(
      activeColor: theme.primaryColor,
      title: Row(
        children: [
          Icon(
            viewModel.isDarkMode ? FontAwesomeIcons.moon : FontAwesomeIcons.sun,
          ),
          Gaps.h16,
          Text(
            viewModel.isDarkMode ? "Dark Mode" : "Light Mode",
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 17,
            ),
          ),
        ],
      ),
      value: viewModel.isDarkMode,
      onChanged: (value) {
        viewModel.toggleThemeMode();
      },
    );
  }
}
