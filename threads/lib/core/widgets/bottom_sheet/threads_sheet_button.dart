import 'package:flutter/material.dart';

class ThreadsSheetButton extends StatelessWidget {
  final String text;
  final bool isDestructive;
  final VoidCallback onTap;

  const ThreadsSheetButton({
    super.key,
    required this.text,
    this.isDestructive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isDestructive ? Colors.red : theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
