import 'package:faker/faker.dart';
import 'package:threads/core/models/profile/avatar_decoration.dart';
import 'package:threads/core/models/profile/user_model.dart';
import 'package:threads/features/activity/models/activity_model.dart';
import 'package:threads/core/models/thread/thread_model.dart';
import 'package:uuid/uuid.dart';

const String dummyAvatarUrl = "https://picsum.photos/20/20";
// TODO: faker.image로 수정
const String dummyImageUrl = "https://picsum.photos/300/160";

final List<UserModel> dummyUsers = [
  for (int i = 0; i < 10; i++)
    UserModel(
      id: const Uuid().v4(),
      avatarUrl: dummyAvatarUrl,
      avatarDecoration: AvatarDecoration.add,
      name: faker.internet.userName(),
      isVerified: faker.randomGenerator.boolean(),
      bio: faker.lorem.sentence(),
      followers: faker.randomGenerator.integer(10000),
    ),
];

final List<ThreadModel> dummyThreads = [
  for (int i = 0; i < 10; i++)
    ThreadModel(
      id: const Uuid().v4(),
      userId: dummyUsers[i].id,
      description: faker.lorem.sentence(),
      images: _generateImages(),
      hasImage: true,
      postTime: faker.date.dateTimeBetween(
        DateTime(2025, 2, 1),
        DateTime.now(),
      ),
      replies: faker.randomGenerator.integer(10),
      likes: faker.randomGenerator.integer(100),
    ),
];

final List<AvatarDecoration> dummyAvatarDecorations = [
  AvatarDecoration.mentions,
  AvatarDecoration.mentions,
  AvatarDecoration.likes,
  AvatarDecoration.likes,
  AvatarDecoration.following,
  AvatarDecoration.likes,
  AvatarDecoration.likes,
  AvatarDecoration.replies,
  AvatarDecoration.replies,
  AvatarDecoration.replies,
];

final List<ActivityModel> dummyActivityModels = [
  for (int i = 0; i < 10; i++)
    ActivityModel(
      user: dummyUsers[i],
      avatarDecoration: dummyAvatarDecorations[i],
      notifiedTime: faker.date.dateTimeBetween(
        DateTime(2025, 2, 1),
        DateTime.now(),
      ),
      description: i % 3 == 0 ? faker.lorem.sentence() : null,
    )
];

final List<String> dummyReportTitles = [
  "I just don't like it",
  "It's unlawful content under NetzDG",
  "It's spam",
  "Hate speech or symbols",
  "Nudity or sexual activity",
  "asdfasdf asdf",
];

List<String> _generateImages() {
  List<String> images = [];
  for (int i = 0; i < faker.randomGenerator.integer(5); i++) {
    images.add(dummyImageUrl);
  }
  return images;
}
