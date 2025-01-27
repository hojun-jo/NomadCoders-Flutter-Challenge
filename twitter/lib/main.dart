import 'package:flutter/material.dart';
import 'package:twitter/features/onboarding/confirmation_code_screen.dart';
import 'package:twitter/features/onboarding/create_account_screen.dart';
import 'package:twitter/features/onboarding/customize_experience_screen.dart';
import 'package:twitter/features/onboarding/initial_screen.dart';
import 'package:twitter/features/onboarding/interests_screen.dart';
import 'package:twitter/features/onboarding/interests_two_screen.dart';
import 'package:twitter/features/onboarding/password_screen.dart';
import 'package:twitter/common/widgets/twitter_scaffold.dart';

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
