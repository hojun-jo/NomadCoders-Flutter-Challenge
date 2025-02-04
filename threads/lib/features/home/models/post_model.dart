class PostModel {
  final String userName;
  final String description;
  final DateTime postTime;
  final int replies;
  final int likes;

  PostModel({
    required this.userName,
    required this.description,
    required this.postTime,
    required this.replies,
    required this.likes,
  });
}
