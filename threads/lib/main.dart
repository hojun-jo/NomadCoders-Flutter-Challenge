import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:threads/app.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const ProviderScope(
        child: ThreadsApp(),
      ),
    ),
  );
}
