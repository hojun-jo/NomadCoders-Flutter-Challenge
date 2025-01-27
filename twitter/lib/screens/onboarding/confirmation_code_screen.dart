import 'package:flutter/material.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/screens/onboarding/password_screen.dart';
import 'package:twitter/screens/onboarding/widgets/check_icon.dart';
import 'package:twitter/screens/onboarding/widgets/round_button.dart';
import 'package:twitter/screens/onboarding/widgets/text_link.dart';
import 'package:twitter/screens/onboarding/widgets/title_description.dart';
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
                const TitleDescription(
                  title: "We sent you a code",
                  description:
                      "Enter it below to verify\njhon.mobbin@gmail.com.",
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
