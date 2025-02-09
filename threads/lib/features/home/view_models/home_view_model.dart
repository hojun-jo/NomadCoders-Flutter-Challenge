import 'package:flutter/material.dart';
import 'package:threads/core/constants/dummy.dart';
import 'package:threads/core/utils/date_formatter.dart';
import 'package:threads/features/home/models/post_model.dart';

class HomeViewModel {
  final List<PostModel> items = dummyPosts;

  int get itemCount => items.length;

  String getUserName(int index) {
    return items[index].user.name;
  }

  String? getUserAvatarUrl(int index) {
    return items[index].user.avatarUrl;
  }

  IconData? getAvatarDecoration(int index) {
    return items[index].avatarDecoration?.toIcon();
  }

  bool getUserIsVerified(int index) {
    return items[index].user.isVerified;
  }

  String getDescription(int index) {
    return items[index].description;
  }

  List<String>? getImages(int index) {
    return items[index].images;
  }

  String getPostTime(int index) {
    return DateFormatter.postDifference(items[index].postTime);
  }

  int getReplies(int index) {
    return items[index].replies;
  }

  int getLikes(int index) {
    return items[index].likes;
  }
}
