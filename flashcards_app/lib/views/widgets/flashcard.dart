import 'package:flutter/material.dart';

class Flashcard extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;

  const Flashcard({
    super.key,
    required this.text,
    this.width = 300,
    this.height = 400,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
