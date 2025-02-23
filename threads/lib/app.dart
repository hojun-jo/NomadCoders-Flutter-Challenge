import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/core/providers/app_settings_provider.dart';

import 'package:threads/router.dart';

class ThreadsApp extends ConsumerWidget {
  const ThreadsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(appSettingsProvider).when(
          error: (error, stackTrace) => Center(
            child: Text(
              "Could not load videos: $error",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          data: (model) => MaterialApp.router(
            routerConfig: ref.watch(routerProvider),
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            title: 'Threads',
            themeMode: model.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.black,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.black,
              primaryColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
                surfaceTintColor: Colors.black,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
            ),
          ),
        );
  }
}
