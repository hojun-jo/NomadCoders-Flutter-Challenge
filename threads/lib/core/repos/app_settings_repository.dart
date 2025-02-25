import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsRepository {
  static const String _isDarkMode = "isDarkMode";

  final SharedPreferencesAsync _asyncPrefs = SharedPreferencesAsync();

  AppSettingsRepository();

  Future<void> setDarkMode(bool isDarkMode) async {
    await _asyncPrefs.setBool(_isDarkMode, isDarkMode);
  }

  Future<bool> get isDarkMode async =>
      await _asyncPrefs.getBool(_isDarkMode) ?? false;
}
