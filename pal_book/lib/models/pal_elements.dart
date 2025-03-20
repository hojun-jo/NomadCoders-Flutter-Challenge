import 'package:flutter/material.dart';

enum PalElements {
  none("none"),
  grass("grass"),
  fire("fire");

  final String text;

  const PalElements(this.text);

  factory PalElements.fromString(String value) {
    return values.firstWhere((e) => e.text == value);
  }

  IconData get icon => switch (this) {
    PalElements.none => Icons.square_rounded,
    PalElements.grass => Icons.grass,
    PalElements.fire => Icons.fireplace,
  };

  Color get color => switch (this) {
    PalElements.none => Color(0xffA2877E),
    PalElements.grass => Color(0xff66A800),
    PalElements.fire => Color(0xffD65632),
  };
}
