import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/core/constants/namespace/app_routes.dart';
import 'package:threads/core/utils/firebase_error_snack.dart';
import 'package:threads/core/utils/validator.dart';
import 'package:threads/features/auth/repos/authentication_repository.dart';

class SignUpViewModel extends AsyncNotifier {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        await _authRepo.emailSignUp(email, password);
      });

      context.go(AppRoutes.home);
    } catch (e) {
      FirebaseErrorSnack.show(context, e);
    }
  }

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
