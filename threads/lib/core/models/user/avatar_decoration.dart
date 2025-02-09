import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum AvatarDecoration {
  add,
  replies,
  mentions,
  following,
  likes;

  IconData toIcon() {
    switch (this) {
      case AvatarDecoration.add:
        return FontAwesomeIcons.plus;
      case AvatarDecoration.replies:
        return FontAwesomeIcons.reply;
      case AvatarDecoration.mentions:
        return FontAwesomeIcons.threads;
      case AvatarDecoration.following:
        return FontAwesomeIcons.user;
      case AvatarDecoration.likes:
        return FontAwesomeIcons.heart;
    }
  }
}
