import 'package:flutter/material.dart';

abstract class Snack {
  Snack._();

  static void show(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        content: Text(
          text,
        ),
      ),
    );
  }
}
