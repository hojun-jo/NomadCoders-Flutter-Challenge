import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:threads/core/models/settings/app_settings_model.dart';
import 'package:threads/core/repos/app_settings_repository.dart';

class AppSettingsNotifier extends AsyncNotifier<AppSettingsModel> {
  late final AppSettingsRepository _repository;

  AppSettingsNotifier(this._repository);

  @override
  FutureOr<AppSettingsModel> build() async {
    final isDarkMode = await _repository.isDarkMode;
    return AppSettingsModel(isDarkMode: isDarkMode);
  }

  Future<void> toggleThemeMode() async {
    final settingsModel = state.value;

    if (settingsModel != null) {
      if (settingsModel.isDarkMode) {
        state = AsyncValue.data(state.value!.copyWith(isDarkMode: false));
        await _repository.setDarkMode(false);
      } else {
        state = AsyncValue.data(state.value!.copyWith(isDarkMode: true));
        await _repository.setDarkMode(true);
      }
    }
  }
}

final appSettingsProvider =
    AsyncNotifierProvider<AppSettingsNotifier, AppSettingsModel>(
  () => AppSettingsNotifier(
    AppSettingsRepository(
      SharedPreferencesAsync(),
    ),
  ),
);
