import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  final String text;
  final double? size;
  final VoidCallback onTap;

  const TextLink({
    super.key,
    required this.text,
    required this.onTap,
    this.size,
  });
// TODO - TextButton으로 대체 가능한지
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
          fontSize: size,
        ),
      ),
    );
  }
}
