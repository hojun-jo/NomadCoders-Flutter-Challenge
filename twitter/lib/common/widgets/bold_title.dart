import 'package:flutter/material.dart';

class BoldTitle extends StatelessWidget {
  final String text;

  const BoldTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
