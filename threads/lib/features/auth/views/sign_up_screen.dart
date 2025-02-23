import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/widgets/round_button.dart';
import 'package:threads/features/auth/view_models/sign_up_view_model.dart';
import 'package:threads/features/auth/views/widgets/auth_form_field.dart';
import 'package:threads/features/auth/views/widgets/auth_meta_icon.dart';
import 'package:threads/features/auth/views/widgets/auth_threads_icon.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ref.watch(signUpProvider).isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AuthThreadsIcon(),
                    Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              AuthFormField(
                                hintText: "Mobile number or email",
                                validator: (value) => ref
                                    .read(signUpProvider.notifier)
                                    .validateEmail(value),
                                onChanged: (value) {
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
                                    .read(signUpProvider.notifier)
                                    .validatePassword(value),
                                onChanged: (value) {
                                  if (value != null) {
                                    _formData["password"] = value;
                                  }
                                },
                              ),
                              Gaps.v10,
                              AuthFormField(
                                obscureText: true,
                                hintText: "Repeat password",
                                validator: (value) => ref
                                    .read(signUpProvider.notifier)
                                    .validateRepeatPassword(
                                      value,
                                      _formData["password"],
                                    ),
                                onChanged: (value) {
                                  if (value != null) {
                                    _formData["password2"] = value;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Gaps.v10,
                        RoundButton(
                          text: "Create Account",
                          onTap: _signUp,
                          color: Colors.blue,
                          textColor: theme.scaffoldBackgroundColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          borderRadius: 5,
                          height: 50,
                        ),
                        Gaps.v60,
                      ],
                    ),
                    const AuthMetaIcon(),
                  ],
                ),
              ),
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState == null) return;
    if (_formKey.currentState!.validate()) {
      ref.read(signUpProvider.notifier).signUp(
            _formData["email"]!,
            _formData["password"]!,
            context,
          );
    }
  }
}
