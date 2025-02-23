import 'package:flutter/material.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "English (US)",
      style: TextStyle(
        color: Colors.grey,
      ),
    );
  }
}
