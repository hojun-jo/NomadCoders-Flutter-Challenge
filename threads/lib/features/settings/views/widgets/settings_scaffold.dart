import 'package:flutter/material.dart';
import 'package:threads/core/constants/thread_divider.dart';

class SettingsScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback onBackTap;

  const SettingsScaffold({
    super.key,
    required this.title,
    required this.child,
    required this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: onBackTap,
          child: Row(
            children: [
              const Icon(
                Icons.chevron_left,
                size: 30,
              ),
              Text(
                "Back",
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 80,
        title: Text(
          title,
          style: TextStyle(
            color: theme.primaryColor,
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
