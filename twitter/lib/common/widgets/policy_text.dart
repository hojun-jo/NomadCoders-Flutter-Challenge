import 'package:flutter/material.dart';

class PolicyText extends StatelessWidget {
  final String text;
  final double? size;

  const PolicyText({
    super.key,
    required this.text,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey.shade600,
        fontSize: size,
      ),
    );
  }
}
