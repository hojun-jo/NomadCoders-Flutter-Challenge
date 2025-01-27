import 'package:flutter/material.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/models/oauth.dart';
import 'package:twitter/screens/onboarding/create_account_screen.dart';
import 'package:twitter/screens/onboarding/widgets/bold_title.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Center(
              child: BoldTitle(
                text: "See what's happening in the world right now.",
              ),
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
          _orDivider(),
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
          _bottomDescription(),
        ],
      ),
    );
  }

  Row _orDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("or"),
        ),
        Expanded(
          child: Container(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
      ],
    );
  }

  Column _bottomDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        Gaps.v40,
        Wrap(
          children: [
            const PolicyText(text: "Have you already account? "),
            TextLink(text: "Log in", onTap: () {}),
          ],
        ),
      ],
    );
  }
}
