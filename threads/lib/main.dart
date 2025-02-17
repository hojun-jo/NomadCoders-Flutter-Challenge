import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/app.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ThreadsApp(),
    ),
  );
}
