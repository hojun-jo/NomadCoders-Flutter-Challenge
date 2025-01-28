import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/common/common.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/features/onboarding/models/oauth.dart';
import 'package:twitter/features/onboarding/create_account_screen.dart';
import 'package:twitter/features/onboarding/widgets/round_button.dart';

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
          _oAuthButton(
            oauth: OAuth.google,
            onTap: () {},
          ),
          Gaps.v10,
          _oAuthButton(
            oauth: OAuth.apple,
            onTap: () {},
          ),
          Gaps.v10,
          _orDivider(),
          RoundButton(
            text: "Create account",
            backgroundColor: Colors.black,
            isEnabled: true,
            onTap: () => _onCreateAccountTap(context),
          ),
          Gaps.v20,
          _bottomDescription(),
        ],
      ),
    );
  }

  GestureDetector _oAuthButton({
    required OAuth oauth,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FaIcon(oauth.toIcon()),
            Text(
              "Continue with ${oauth.toString()}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
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

  void _onCreateAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAccountScreen(),
      ),
    );
  }
}
