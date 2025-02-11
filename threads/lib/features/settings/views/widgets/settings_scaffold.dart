import 'package:flutter/material.dart';
import 'package:threads/core/constants/thread_divider.dart';

class SettingsScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const SettingsScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  children: [
                    Icon(
                      Icons.chevron_left,
                      size: 30,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
            : null,
        leadingWidth: 80,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          threadDivider,
          child,
        ],
      ),
    );
  }
}
