import 'package:flutter/material.dart';

class ThreadsSheetButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isDestructive;

  const ThreadsSheetButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isDestructive ? Colors.red : Colors.black,
          ),
        ),
      ),
    );
  }
}
