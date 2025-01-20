import 'package:flutter/material.dart';
import 'package:twitter/constants/icons.dart';
import 'package:twitter/screens/onboarding/initial_screen.dart';

void main() {
  runApp(const TwitterChallenge());
}

class TwitterChallenge extends StatelessWidget {
  const TwitterChallenge({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Challenge',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: twitterIcon,
        ),
        backgroundColor: Colors.white,
        body: const SafeArea(
          child: InitialScreen(),
        ),
      ),
    );
  }
}
