import 'package:faker/faker.dart';
import 'package:threads/features/home/models/post_model.dart';

const String dummyAvatarUrl = "https://picsum.photos/20/20";
// TODO: faker.image로 수정
const String dummyImageUrl = "https://picsum.photos/300/160";

final List<PostModel> dummyPosts = [
  for (int i = 0; i < 10; i++)
    PostModel(
      userName: faker.internet.userName(),
      userAvatarUrl: dummyAvatarUrl,
      description: faker.lorem.sentence(),
      images: _generateImages(),
      postTime: faker.date.dateTimeBetween(
        DateTime(2025, 2, 1),
        DateTime.now(),
      ),
      replies: faker.randomGenerator.integer(10),
      likes: faker.randomGenerator.integer(100),
    ),
];

List<String> _generateImages() {
  List<String> images = [];
  for (int i = 0; i < faker.randomGenerator.integer(5); i++) {
    images.add(dummyImageUrl);
  }
  return images;
}

final dummyReportTitles = [
  "I just don't like it",
  "It's unlawful content under NetzDG",
  "It's spam",
  "Hate speech or symbols",
  "Nudity or sexual activity",
  "asdfasdf asdf",
];
