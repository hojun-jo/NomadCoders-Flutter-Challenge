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
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BoldTitle(text: "We sent you a code"),
                  const SizedBox(
                    height: 20,
                  ),
                  const PolicyText(
                    text: "Enter it below to verify",
                    size: 16,
                  ),
                  const PolicyText(
                    text: "jhon.mobbin@gmail.com.",
                    size: 16,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const ValidationCodeForm(),
                  if (_isComplete)
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    )
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
                  backgroundColor: Colors.black,
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
