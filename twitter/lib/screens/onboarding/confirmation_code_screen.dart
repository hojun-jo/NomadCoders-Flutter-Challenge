import 'package:flutter/material.dart';
import 'package:twitter/screens/onboarding/widgets/bold_title.dart';
import 'package:twitter/screens/onboarding/widgets/policy_text.dart';
import 'package:twitter/screens/onboarding/widgets/round_button.dart';
import 'package:twitter/screens/onboarding/widgets/text_link.dart';
import 'package:twitter/screens/onboarding/widgets/twitter_scaffold.dart';
import 'package:twitter/screens/onboarding/widgets/validation_code_form.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final bool _isComplete = false;

  @override
  Widget build(BuildContext context) {
    return TwitterScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldTitle(text: "We sent you a code"),
                  SizedBox(
                    height: 20,
                  ),
                  PolicyText(
                    text: "Enter it below to verify",
                    size: 16,
                  ),
                  PolicyText(
                    text: "jhon.mobbin@gmail.com.",
                    size: 16,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ValidationCodeForm(),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!_isComplete)
                  TextLink(
                    text: "Didn't receive email?",
                    onTap: () {},
                  ),
                const SizedBox(
                  height: 15,
                ),
                RoundButton(
                  text: "Next",
                  backgroundColor: _isComplete ? Colors.black : Colors.grey,
                  isEnabled: _isComplete,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
