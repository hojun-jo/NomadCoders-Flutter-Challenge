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
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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
                  child: Column(
                    children: [
                      const SignUpFormField(
                        hintText: "Name",
                        labelText: "Name",
                        isDate: false,
                      ),
                      const SignUpFormField(
                        hintText: "Phone number or email address",
                        labelText: "Email",
                        isDate: false,
                      ),
                      SignUpFormField(
                        hintText: "Date of birth",
                        labelText: "Date of birth",
                        isDate: true,
                        controller: _controller,
                      ),
                    ],
                  ),
                ),
                if (_controller.text.isNotEmpty)
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CustomizeExperienceScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.grey.shade400,
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
