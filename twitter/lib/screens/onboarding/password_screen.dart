import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/screens/onboarding/interests_screen.dart';
import 'package:twitter/screens/onboarding/widgets/check_icon.dart';
import 'package:twitter/screens/onboarding/widgets/round_button.dart';
import 'package:twitter/screens/onboarding/widgets/title_description.dart';
import 'package:twitter/screens/onboarding/widgets/twitter_scaffold.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final FocusNode _focusNode = FocusNode();
  bool _isShowPassword = false;
  bool _isComplete = false;

  @override
  Widget build(BuildContext context) {
    return TwitterScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleDescription(
                title: "You'll need a password",
                description: "Make sure it's 8 characters or more.",
              ),
              Gaps.v20,
              _passwordField(),
            ],
          ),
          RoundButton(
            text: "Next",
            backgroundColor: Colors.black,
            isEnabled: _isComplete,
            onTap: _onNextTap,
          ),
        ],
      ),
    );
  }

  void _onNextTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
      (route) => false,
    );
  }

  TextField _passwordField() {
    return TextField(
      focusNode: _focusNode,
      showCursor: false,
      obscureText: !_isShowPassword,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(
          color: _focusNode.hasFocus ? Colors.black : Colors.grey,
        ),
        enabledBorder: _greyUnderlineBorder(),
        focusedBorder: _greyUnderlineBorder(),
        suffixIcon: _suffixIcons(),
      ),
      onChanged: _validatePassword,
    );
  }

  void _validatePassword(String value) {
    if (value.length >= 8) {
      _isComplete = true;
    } else {
      _isComplete = false;
    }
    setState(() {});
  }

  Row _suffixIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            _isShowPassword = !_isShowPassword;
            setState(() {});
          },
          icon: FaIcon(
            _isShowPassword ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
            color: Colors.grey,
          ),
        ),
        if (_isComplete)
          const CheckIcon(
            size: 28,
          ),
      ],
    );
  }

  UnderlineInputBorder _greyUnderlineBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );
  }
}
