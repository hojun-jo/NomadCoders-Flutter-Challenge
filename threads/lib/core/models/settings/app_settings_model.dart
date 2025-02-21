class AppSettingsModel {
  bool isDarkMode;

  AppSettingsModel({
    this.isDarkMode = false,
  });

  AppSettingsModel copyWith({
    bool? isDarkMode,
  }) {
    return AppSettingsModel(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
