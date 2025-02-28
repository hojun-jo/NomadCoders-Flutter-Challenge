import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/core/models/thread/thread_model.dart';
import 'package:threads/core/repos/thread_repository.dart';
import 'package:threads/core/utils/date_formatter.dart';

class HomeViewModel extends AsyncNotifier<List<ThreadModel>> {
  late final ThreadRepository _repo;

  @override
  FutureOr<List<ThreadModel>> build() async {
    _repo = ref.read(threadRepo);

    return await _repo.fetchThreads();
  }

  Future<void> refreshThreads() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await _repo.fetchThreads();
    });
  }

  String formmatPostTime(DateTime time) {
    return DateFormatter.difference(time);
  }
}

final homeProvider = AsyncNotifierProvider<HomeViewModel, List<ThreadModel>>(
  () => HomeViewModel(),
);
