import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:threads/core/models/thread/thread_model.dart';
import 'package:threads/core/repos/thread_repository.dart';
import 'package:threads/core/utils/date_formatter.dart';

class SearchViewModel extends StreamNotifier<List<ThreadModel>> {
  late final ThreadRepository _repo;
  final List<ThreadModel> _cache = [];

  int get itemCount => state.value?.length ?? 0;

  @override
  Stream<List<ThreadModel>> build() {
    _repo = ref.read(threadRepo);

    return _repo.fetchThreads();
  }

  Future<void> search(String text) async {
    state = const AsyncValue.loading();

    if (state.hasValue && _cache.isEmpty) {
      _cache.addAll(state.value!);
    }

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
    StreamNotifierProvider<SearchViewModel, List<ThreadModel>>(
  () => SearchViewModel(),
);
