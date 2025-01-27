import 'package:flutter/material.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/screens/onboarding/password_screen.dart';
import 'package:twitter/screens/onboarding/widgets/bold_title.dart';
import 'package:twitter/screens/onboarding/widgets/check_icon.dart';
import 'package:twitter/screens/onboarding/widgets/policy_text.dart';
import 'package:twitter/screens/onboarding/widgets/round_button.dart';
import 'package:twitter/screens/onboarding/widgets/text_link.dart';
import 'package:twitter/screens/onboarding/widgets/twitter_scaffold.dart';
import 'package:twitter/screens/onboarding/widgets/confirmation_code_form.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  bool _isComplete = false;

  @override
  Widget build(BuildContext context) {
    return TwitterScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BoldTitle(text: "We sent you a code"),
                Gaps.v20,
                const PolicyText(
                  text: "Enter it below to verify",
                  size: 16,
                ),
                const PolicyText(
                  text: "jhon.mobbin@gmail.com.",
                  size: 16,
                ),
                Gaps.v28,
                ConfirmationCodeForm(
                  onComplete: (value) {
                    _isComplete = value;
                    setState(() {});
                  },
                ),
                Gaps.v20,
                if (_isComplete)
                  const Align(
                    alignment: Alignment.center,
                    child: CheckIcon(
                      size: 30,
                    ),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextLink(
                text: "Didn't receive email?",
                onTap: () {},
              ),
              Gaps.v16,
              RoundButton(
                text: "Next",
                backgroundColor: Colors.black,
                isEnabled: _isComplete,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const PasswordScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
