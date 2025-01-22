import 'package:flutter/material.dart';
import 'package:twitter/screens/onboarding/customize_experience_screen.dart';
import 'package:twitter/screens/onboarding/widgets/bold_title.dart';
import 'package:twitter/screens/onboarding/widgets/policy_text.dart';
import 'package:twitter/screens/onboarding/widgets/sign_up_form_field.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
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
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  if (_isComplete) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CustomizeExperienceScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: _isComplete ? Colors.black : Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: _isComplete ? Colors.white : Colors.grey.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
