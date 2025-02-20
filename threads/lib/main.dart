import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:threads/app.dart';
import 'package:threads/features/settings/view_models/settings_view_model.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SettingsViewModel(),
          ),
        ],
        child: const ThreadsApp(),
      ),
    ),
  );
}
