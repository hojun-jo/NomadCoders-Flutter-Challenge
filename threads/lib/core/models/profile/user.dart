import 'package:threads/core/models/profile/avatar_decoration.dart';

class User {
  final String? avatarUrl;
  final AvatarDecoration? decoration;
  final String name;
  final bool isVerified;
  final String bio;
  final int followers;

  User({
    this.avatarUrl,
    this.decoration,
    required this.name,
    required this.isVerified,
    required this.bio,
    required this.followers,
  });
}
