import 'package:flutter/material.dart';
import 'package:twitter/models/oauth.dart';
import 'package:twitter/screens/onboarding/create_account_screen.dart';
import 'package:twitter/screens/onboarding/widgets/bold_title.dart';
import 'package:twitter/screens/onboarding/widgets/or_divider.dart';
import 'package:twitter/screens/onboarding/widgets/policy_text.dart';
import 'package:twitter/screens/onboarding/widgets/oauth_button.dart';
import 'package:twitter/screens/onboarding/widgets/round_button.dart';
import 'package:twitter/screens/onboarding/widgets/text_link.dart';
import 'package:twitter/screens/onboarding/widgets/twitter_scaffold.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TwitterScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Center(
              child: BoldTitle(
                  text: "See what's happening in the world right now."),
            ),
          ),
          OAuthButton(
            oauth: OAuth.google,
            onTap: () {},
          ),
          OAuthButton(
            oauth: OAuth.apple,
            onTap: () {},
          ),
          const OrDivider(),
          RoundButton(
            text: "Create account",
            backgroundColor: Colors.black,
            isEnabled: true,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CreateAccountScreen(),
                ),
              );
            },
          ),
          Wrap(
            children: [
              const PolicyText(
                  text: "By signing up, you agree to our ", size: 16),
              TextLink(text: "Terms", size: 16, onTap: () {}),
              const PolicyText(text: ", ", size: 16),
              TextLink(text: "Privacy Policy", size: 16, onTap: () {}),
              const PolicyText(text: ", and ", size: 16),
              TextLink(text: "Cookie use", size: 16, onTap: () {}),
              const PolicyText(text: ".", size: 16),
            ],
          ),
          const SizedBox(height: 40),
          Wrap(
            children: [
              const PolicyText(text: "Have you already account? "),
              TextLink(text: "Log in", onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
