import 'package:uuid/uuid.dart';

class ThreadModel {
  final String id;
  final String userId;
  final String description;
  final List<String> images;
  final DateTime postTime;
  final int replies;
  final int likes;

  ThreadModel({
    required this.id,
    required this.userId,
    required this.description,
    required this.images,
    required this.postTime,
    required this.replies,
    required this.likes,
  });

  ThreadModel.empty()
      : id = const Uuid().v4(),
        userId = "1234",
        description = "",
        images = [],
        postTime = DateTime.now(),
        replies = 0,
        likes = 0;

  ThreadModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        description = json["description"],
        images = [],
        postTime = json["postTime"],
        replies = json["replies"],
        likes = json["likes"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "description": description,
      "postTime": postTime,
      "replies": replies,
      "likes": likes,
    };
  }

  ThreadModel copyWith({
    String? id,
    String? userId,
    String? description,
    List<String>? images,
    DateTime? postTime,
    int? replies,
    int? likes,
  }) {
    return ThreadModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      description: description ?? this.description,
      images: images ?? this.images,
      postTime: postTime ?? this.postTime,
      replies: replies ?? this.replies,
      likes: likes ?? this.likes,
    );
  }
}
