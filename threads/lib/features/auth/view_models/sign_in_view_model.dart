import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInViewModel extends AsyncNotifier {
  @override
  FutureOr build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  void signIn(
    String email,
    String password,
    BuildContext context,
  ) {}

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Please type a valid email.";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "8 Characters or longer.";
    }
    return null;
  }
}

final signInProvider = AsyncNotifierProvider<SignInViewModel, void>(
  () => SignInViewModel(),
);
