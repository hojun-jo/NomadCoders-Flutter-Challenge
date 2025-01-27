import 'package:flutter/material.dart';
import 'package:twitter/screens/onboarding/confirmation_code_screen.dart';
import 'package:twitter/screens/onboarding/customize_experience_screen.dart';
import 'package:twitter/screens/onboarding/widgets/bold_title.dart';
import 'package:twitter/screens/onboarding/widgets/round_button.dart';
import 'package:twitter/screens/onboarding/widgets/policy_text.dart';
import 'package:twitter/screens/onboarding/widgets/sign_up_form_field.dart';
import 'package:twitter/screens/onboarding/widgets/text_link.dart';
import 'package:twitter/screens/onboarding/widgets/twitter_scaffold.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();

  final Map<String, String> _formData = {};
  bool _isComplete = false;
  bool _isPoped = false;

  @override
  void initState() {
    super.initState();
    _dateController.addListener(() {
      if (_dateController.text.isNotEmpty) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TwitterScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BoldTitle(text: "Create your account"),
              Form(
                key: _formKey,
                onChanged: () {
                  _formKey.currentState?.save();
                  if (_formData.length == 3) {
                    _isComplete = true;
                    setState(() {});
                  }
                },
                child: Column(
                  children: [
                    SignUpFormField(
                      hintText: "Name",
                      labelText: "Name",
                      isDate: false,
                      onSaved: (value) {
                        if (value != null && value.isNotEmpty) {
                          _formData["name"] = value;
                        }
                      },
                    ),
                    SignUpFormField(
                      // TODO - email validate
                      hintText: "Phone number or email address",
                      labelText: "Email",
                      isDate: false,
                      onSaved: (value) {
                        if (value != null && value.isNotEmpty) {
                          _formData["email"] = value;
                        }
                      },
                    ),
                    SignUpFormField(
                      hintText: "Date of birth",
                      labelText: "Date of birth",
                      isDate: true,
                      controller: _dateController,
                      onSaved: (value) {
                        if (value != null && value.isNotEmpty) {
                          _formData["date"] = value;
                        }
                      },
                    ),
                  ],
                ),
              ),
              if (_dateController.text.isNotEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: PolicyText(
                      text:
                          "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.",
                      size: 15),
                ),
            ],
          ),
          _decideBottomButton(),
        ],
      ),
    );
  }

  Widget _decideBottomButton() {
    if (_isPoped) {
      return _policySignUpButton();
    }
    return _nextButton();
  }

  Column _policySignUpButton() {
    return Column(
      children: [
        Wrap(
          // TODO - 가로로 붙게 정렬 못 하나?
          children: [
            const PolicyText(text: "By signing up, you agree to the "),
            TextLink(text: "Terms of Service", onTap: () {}),
            const PolicyText(text: " and "),
            TextLink(text: "Privacy Policy", onTap: () {}),
            const PolicyText(text: ", including "),
            TextLink(text: "Cookie Use", onTap: () {}),
            const PolicyText(text: ". "),
            const PolicyText(
                text:
                    " Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. "),
            TextLink(text: "Learn more", onTap: () {}),
            const PolicyText(text: ". "),
            const PolicyText(
                text:
                    "Other will be able to find you by email or phone number, when provided, unless you choose otherwise "),
            TextLink(text: "here", onTap: () {}),
            const PolicyText(text: "."),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        RoundButton(
          text: "Sign up",
          backgroundColor: Colors.blue,
          isEnabled: true,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ConfirmationCodeScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  Row _nextButton() {
    return Row(
      children: [
        const Spacer(),
        RoundButton(
          text: "Next",
          backgroundColor: Colors.black,
          isEnabled: _isComplete,
          isSmall: true,
          onTap: () async {
            if (_isComplete) {
              FocusManager.instance.primaryFocus?.unfocus();
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CustomizeExperienceScreen(),
                ),
              );
              if (result == true) {
                _isPoped = true;
                setState(() {});
              }
            }
          },
        ),
      ],
    );
  }
}
