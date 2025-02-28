import 'package:flutter/material.dart';

class CenterErrorText extends StatelessWidget {
  final String text;

  const CenterErrorText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
