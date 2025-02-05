import 'package:threads/core/constants/dummy.dart';
import 'package:threads/core/utils/date_formatter.dart';
import 'package:threads/features/home/models/post_model.dart';

class HomeViewModel {
  final List<PostModel> items = dummyPosts;
  final DateFormatter dateFormatter;

  HomeViewModel({
    required this.dateFormatter,
  });

  int get itemCount => items.length;

  String getUserName(int index) {
    return items[index].userName;
  }

  String? getUserAvatarUrl(int index) {
    return items[index].userAvatarUrl;
  }

  String getDescription(int index) {
    return items[index].description;
  }

  List<String>? getImages(int index) {
    return items[index].images;
  }

  String getPostTime(int index) {
    return dateFormatter.postDifference(items[index].postTime);
  }

  int getReplies(int index) {
    return items[index].replies;
  }

  int getLikes(int index) {
    return items[index].likes;
  }
}
