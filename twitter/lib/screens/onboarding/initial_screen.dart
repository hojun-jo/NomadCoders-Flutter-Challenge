import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/textstyle.dart';
import 'package:twitter/models/oauth.dart';
import 'package:twitter/screens/onboarding/widgets/or_divider.dart';
import 'package:twitter/screens/onboarding/widgets/sign_up_button.dart';
import 'package:twitter/screens/onboarding/widgets/text_link.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const FaIcon(
          FontAwesomeIcons.twitter,
          size: 40,
          color: Colors.blue,
        ),
        const Text(
          "See what's happening\nin the world right now.",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
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
                onTap: () {},
              ),
              Row(
                children: [
                  Text(
                    "By signing up, you agree to our ",
                    style: policyBig,
                  ),
                  TextLink(
                    text: "Terms",
                    size: 16,
                    onTap: () {},
                  ),
                  Text(
                    ",",
                    style: policyBig,
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
                  Text(
                    ", and ",
                    style: policyBig,
                  ),
                  TextLink(
                    text: "Cookie use",
                    size: 16,
                    onTap: () {},
                  ),
                  Text(
                    ".",
                    style: policyBig,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    "Have you already account? ",
                    style: policySmall,
                  ),
                  TextLink(
                    text: "Log in",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
