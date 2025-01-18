import 'package:flutter/material.dart';

class RuntimeGenresText extends StatelessWidget {
  final String runtime;
  final String genres;
  final bool isAdult;

  const RuntimeGenresText({
    super.key,
    required this.runtime,
    required this.genres,
    required this.isAdult,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.white,
        ),
        children: [
          TextSpan(text: runtime),
          const TextSpan(text: " ⎮ "),
          TextSpan(
            text: genres,
          ),
          if (isAdult) const TextSpan(text: "🔞"),
        ],
      ),
    );
  }
}
