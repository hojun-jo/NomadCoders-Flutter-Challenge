import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/widgets/round_button.dart';
import 'package:threads/features/auth/view_models/sign_in_view_model.dart';
import 'package:threads/features/auth/views/widgets/auth_form_field.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "English (US)",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  FontAwesomeIcons.threads,
                  size: 60,
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AuthFormField(
                          hintText: "Mobile number or email",
                          validator: (value) => ref
                              .read(signInProvider.notifier)
                              .validateEmail(value),
                          onSaved: (value) {
                            if (value != null) {
                              _formData["email"] = value;
                            }
                          },
                        ),
                        Gaps.v10,
                        AuthFormField(
                          obscureText: true,
                          hintText: "Password",
                          validator: (value) => ref
                              .read(signInProvider.notifier)
                              .validatePassword(value),
                          onSaved: (value) {
                            if (value != null) {
                              _formData["password"] = value;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Gaps.v10,
                  RoundButton(
                    text: "Log in",
                    onTap: _signIn,
                    color: Colors.blue,
                    textColor: theme.scaffoldBackgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    borderRadius: 5,
                    height: 50,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Gaps.v60,
                ],
              ),
              Column(
                children: [
                  RoundButton(
                    onTap: () {},
                    text: "Create new account",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.transparent,
                    borderColor: Colors.grey,
                    borderRadius: 5,
                  ),
                  Gaps.v14,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.meta,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Gaps.h10,
                      Text(
                        "Meta",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() {
    if (_formKey.currentState == null) return;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ref.read(signInProvider.notifier).signIn(
            _formData["email"]!,
            _formData["password"]!,
            context,
          );
    }
  }
}
