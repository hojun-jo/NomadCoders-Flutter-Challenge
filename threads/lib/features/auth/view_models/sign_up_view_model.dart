import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/core/utils/validator.dart';

class SignUpViewModel extends AsyncNotifier {
  @override
  FutureOr build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  void signUp(
    String email,
    String password,
    BuildContext context,
  ) {}

  String? validateEmail(String? email) {
    if (email == null || !Validator.validateEmail(email)) {
      return "Please type a valid email.";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || !Validator.validatePassword(password)) {
      return "8 Characters or longer.";
    }
    return null;
  }

  String? validateRepeatPassword(String? repeatPassword, String? password) {
    if (password == null ||
        repeatPassword == null ||
        password != repeatPassword) {
      return "Password is not match.";
    }
    return null;
  }
}

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
