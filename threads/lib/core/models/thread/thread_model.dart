import 'package:threads/core/models/profile/user.dart';

class ThreadModel {
  final User user;
  final String description;
  final List<String>? images;
  final DateTime postTime;
  final int replies;
  final int likes;

  ThreadModel({
    required this.user,
    required this.description,
    this.images,
    required this.postTime,
    required this.replies,
    required this.likes,
  });
}
