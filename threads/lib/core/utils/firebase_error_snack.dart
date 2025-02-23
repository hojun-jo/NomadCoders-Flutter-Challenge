import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

abstract class FirebaseErrorSnack {
  FirebaseErrorSnack._();

  static void show(BuildContext context, Object? error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        content: Text(
          (error as FirebaseException).message ?? "Someting wen't wrong.",
        ),
      ),
    );
  }
}
