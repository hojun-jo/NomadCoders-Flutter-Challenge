import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/core/models/thread/thread_model.dart';
import 'package:threads/core/repos/thread_repository.dart';
import 'package:threads/core/utils/date_formatter.dart';

class HomeViewModel extends StreamNotifier<List<ThreadModel>> {
  late final ThreadRepository _repo;

  @override
  Stream<List<ThreadModel>> build() {
    _repo = ref.read(threadRepo);

    return _repo.fetchThreads();
  }

  Future<List<String>> fetchThreadImages(String threadId) async {
    return _repo.fetchThreadImages(threadId);
  }

  String formmatPostTime(DateTime time) {
    return DateFormatter.difference(time);
  }
}

final homeProvider = StreamNotifierProvider<HomeViewModel, List<ThreadModel>>(
  () => HomeViewModel(),
);
