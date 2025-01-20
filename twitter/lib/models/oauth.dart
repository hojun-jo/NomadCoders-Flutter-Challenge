import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum OAuth {
  google,
  apple;

  IconData toIcon() {
    switch (this) {
      case OAuth.google:
        return FontAwesomeIcons.google;
      case OAuth.apple:
        return FontAwesomeIcons.apple;
    }
  }

  @override
  String toString() {
    switch (this) {
      case OAuth.google:
        return "google";
      case OAuth.apple:
        return "apple";
    }
  }
}
