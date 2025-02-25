import 'package:threads/core/models/profile/avatar_decoration.dart';

class User {
  final String? avatarUrl;
  final AvatarDecoration? avatarDecoration;
  final String name;
  final bool isVerified;
  final String bio;
  final int followers;

  User({
    this.avatarUrl,
    this.avatarDecoration,
    required this.name,
    required this.isVerified,
    required this.bio,
    required this.followers,
  });
}
