import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/core/models/settings/settings_model.dart';

class SettingsNotifier extends Notifier<SettingsModel> {
  @override
  SettingsModel build() {
    return SettingsModel();
  }

  void toggleThemeMode() {
    if (state.isDarkMode) {
      state = SettingsModel(isDarkMode: false);
    } else {
      state = SettingsModel(isDarkMode: true);
    }
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsModel>(
  () => SettingsNotifier(),
);
