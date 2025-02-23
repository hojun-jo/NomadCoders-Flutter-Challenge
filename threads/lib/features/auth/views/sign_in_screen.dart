import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/core/constants/gaps.dart';
import 'package:threads/core/constants/namespace/app_routes.dart';
import 'package:threads/core/widgets/round_button.dart';
import 'package:threads/features/auth/view_models/sign_in_view_model.dart';
import 'package:threads/features/auth/views/widgets/auth_form_field.dart';
import 'package:threads/features/auth/views/widgets/auth_meta_icon.dart';
import 'package:threads/features/auth/views/widgets/auth_threads_icon.dart';
import 'package:threads/features/auth/views/widgets/locale_text.dart';

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
        child: ref.watch(signInProvider).isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LocaleText(),
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
                                    .read(signInProvider.notifier)
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
                                    .read(signInProvider.notifier)
                                    .validatePassword(value),
                                onChanged: (value) {
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
                          onTap: _pushSignUpScreen,
                          text: "Create new account",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.transparent,
                          borderColor: Colors.grey,
                          borderRadius: 5,
                        ),
                        Gaps.v14,
                        const AuthMetaIcon(),
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
      ref.read(signInProvider.notifier).signIn(
            _formData["email"]!,
            _formData["password"]!,
            context,
          );
    }
  }

  void _pushSignUpScreen() {
    context.push(AppRoutes.signUp);
  }
}
