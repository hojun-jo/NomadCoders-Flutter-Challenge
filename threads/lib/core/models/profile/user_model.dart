import 'package:threads/core/models/profile/avatar_decoration.dart';

class UserModel {
  final String id;
  final String? avatarUrl;
  final AvatarDecoration? avatarDecoration;
  final String name;
  final bool isVerified;
  final String bio;
  final int followers;

  UserModel({
    required this.id,
    this.avatarUrl,
    this.avatarDecoration,
    required this.name,
    required this.isVerified,
    required this.bio,
    required this.followers,
  });
}
