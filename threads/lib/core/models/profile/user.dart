class User {
  final String? avatarUrl;
  final String name;
  final bool isVerified;
  final String bio;
  final int followers;

  User({
    this.avatarUrl,
    required this.name,
    required this.isVerified,
    required this.bio,
    required this.followers,
  });
}
