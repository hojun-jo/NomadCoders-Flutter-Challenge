import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:threads/core/models/thread/thread_model.dart';
import 'package:threads/core/repos/thread_repository.dart';
import 'package:threads/core/utils/date_formatter.dart';

class SearchViewModel extends AsyncNotifier<List<ThreadModel>> {
  late final ThreadRepository _repo;
  late final List<ThreadModel> _cache;

  int get itemCount => state.value?.length ?? 0;
  bool get isSearching => itemCount < _cache.length && itemCount > 0;

  @override
  FutureOr<List<ThreadModel>> build() async {
    _repo = ref.read(threadRepo);
    final threads = await _repo.fetchThreads();
    _cache = threads;

    return threads;
  }

  Future<void> search(String text) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return _cache.where((thread) {
        return thread.description.contains(text);
      }).toList();
    });
  }

  String formmatPostTime(DateTime time) {
    return DateFormatter.difference(time);
  }

  String formmatFollowers(int followers) {
    return NumberFormat.compact().format(followers);
  }
}

final searchProvider =
    AsyncNotifierProvider<SearchViewModel, List<ThreadModel>>(
  () => SearchViewModel(),
);
