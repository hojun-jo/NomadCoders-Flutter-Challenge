import 'package:flutter/material.dart';

abstract class Tweens {
  Tweens._();

  static final scale = Tween<double>(begin: 1.1, end: 1);

  static final decoration = DecorationTween(
    begin: BoxDecoration(color: Colors.red.withAlpha(20)),
    end: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(3),
    ),
  );
}
