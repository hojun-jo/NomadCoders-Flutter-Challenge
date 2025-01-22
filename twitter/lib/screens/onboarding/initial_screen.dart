import 'package:flutter/material.dart';
import 'package:twitter/constants/textstyle.dart';
import 'package:twitter/models/oauth.dart';
import 'package:twitter/screens/onboarding/create_account_screen.dart';
import 'package:twitter/screens/onboarding/widgets/bold_title.dart';
import 'package:twitter/screens/onboarding/widgets/or_divider.dart';
import 'package:twitter/screens/onboarding/widgets/policy_text.dart';
import 'package:twitter/screens/onboarding/widgets/sign_up_button.dart';
import 'package:twitter/screens/onboarding/widgets/text_link.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const Expanded(
            child: Center(
              child: BoldTitle(
                  text: "See what's happening in the world right now."),
            ),
          ),
          SignUpButton(
            oauth: OAuth.google,
            onTap: () {},
          ),
          SignUpButton(
            oauth: OAuth.apple,
            onTap: () {},
          ),
          const OrDivider(),
          SignUpButton(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CreateAccountScreen(),
                ),
              );
            },
          ),
          Row(
            children: [
              const PolicyText(
                text: "By signing up, you agree to our ",
                size: 16,
              ),
              TextLink(
                text: "Terms",
                size: 16,
                onTap: () {},
              ),
              const PolicyText(
                text: ",",
                size: 16,
              ),
            ],
          ),
          Row(
            children: [
              TextLink(
                text: "Privacy Policy",
                size: 16,
                onTap: () {},
              ),
              const PolicyText(
                text: ", and ",
                size: 16,
              ),
              TextLink(
                text: "Cookie use",
                size: 16,
                onTap: () {},
              ),
              const PolicyText(
                text: ".",
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              const PolicyText(
                text: "Have you already account? ",
              ),
              TextLink(
                text: "Log in",
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
