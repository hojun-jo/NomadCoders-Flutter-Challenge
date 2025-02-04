class PostModel {
  final String userName;
  final String? userAvatarUrl;
  final String description;
  final List<String>? images;
  final DateTime postTime;
  final int replies;
  final int likes;

  PostModel({
    required this.userName,
    this.userAvatarUrl,
    required this.description,
    this.images,
    required this.postTime,
    required this.replies,
    required this.likes,
  });
}
