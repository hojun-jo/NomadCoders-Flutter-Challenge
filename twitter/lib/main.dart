import 'package:flutter/material.dart';
import 'package:twitter/screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const TwitterChallenge());
}

class TwitterChallenge extends StatelessWidget {
  const TwitterChallenge({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Twitter Challenge',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: OnboardingScreen(),
        ),
      ),
    );
  }
}
