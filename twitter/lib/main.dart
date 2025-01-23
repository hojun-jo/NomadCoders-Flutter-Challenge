import 'package:flutter/material.dart';
import 'package:twitter/screens/onboarding/confirmation_code_screen.dart';
import 'package:twitter/screens/onboarding/initial_screen.dart';
import 'package:twitter/screens/onboarding/widgets/twitter_scaffold.dart';

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
      home: ConfirmationCodeScreen(),
    );
  }
}
