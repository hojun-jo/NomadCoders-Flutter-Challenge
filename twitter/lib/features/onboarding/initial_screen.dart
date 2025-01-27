import 'package:flutter/material.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/features/onboarding/models/oauth.dart';
import 'package:twitter/features/onboarding/create_account_screen.dart';
import 'package:twitter/common/widgets/bold_title.dart';
import 'package:twitter/common/widgets/policy_text.dart';
import 'package:twitter/features/onboarding/widgets/oauth_button.dart';
import 'package:twitter/features/onboarding/widgets/round_button.dart';
import 'package:twitter/common/widgets/text_link.dart';
import 'package:twitter/common/widgets/twitter_scaffold.dart';

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
          Gaps.v10,
          OAuthButton(
            oauth: OAuth.apple,
            onTap: () {},
          ),
          Gaps.v10,
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
          Gaps.v20,
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
          child: Text(
            "or",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
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
                text: "By signing up, you agree to our ", size: 15),
            TextLink(text: "Terms", size: 15, onTap: () {}),
            const PolicyText(text: ", ", size: 15),
            TextLink(text: "Privacy Policy", size: 15, onTap: () {}),
            const PolicyText(text: ", and ", size: 15),
            TextLink(text: "Cookie use", size: 15, onTap: () {}),
            const PolicyText(text: ".", size: 15),
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
