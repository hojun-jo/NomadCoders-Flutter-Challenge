import 'package:threads/core/models/profile/avatar_decoration.dart';
import 'package:threads/core/models/profile/user.dart';

class ThreadModel {
  final User user;
  final AvatarDecoration? avatarDecoration;
  final String description;
  final List<String>? images;
  final DateTime postTime;
  final int replies;
  final int likes;

  ThreadModel({
    required this.user,
    this.avatarDecoration,
    required this.description,
    this.images,
    required this.postTime,
    required this.replies,
    required this.likes,
  });
}
