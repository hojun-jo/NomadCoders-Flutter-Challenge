import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/core/models/thread/thread_model.dart';
import 'package:threads/core/repos/thread_repository.dart';

class WriteViewModel extends AsyncNotifier<ThreadModel> {
  late final ThreadRepository _repo;

  bool _isPostable = false;

  bool get isPostable => _isPostable;

  @override
  FutureOr<ThreadModel> build() {
    _repo = ref.read(threadRepo);
    return ThreadModel.empty();
  }

  void updateDescription(String text) {
    if (text.isNotEmpty) {
      _isPostable = true;
    } else {
      _isPostable = false;
    }

    state = AsyncValue.data(state.value!.copyWith(description: text));
  }

  void deleteImage(int index) {
    state.value!.images.removeAt(index);

    if (state.value!.images.isEmpty) {
      _updateHasImage(false);
    } else {
      _updateState();
    }
  }

  void addImages(List<String>? imagePaths) {
    if (imagePaths == null) return;

    state.value!.images.addAll(imagePaths);
    _updateHasImage(true);
  }

  Future<void> uploadThread() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final thread = state.value!;
      final images = thread.images;

      await _repo.uploadThread(thread);

      if (images.isNotEmpty) {
        for (final image in images) {
          await _repo.uploadThreadImageFiles(File(image), thread.id);
        }
      }

      return ThreadModel.empty();
    });
  }

  void _updateHasImage(bool value) {
    state = AsyncValue.data(state.value!.copyWith(hasImage: value));
  }

  void _updateState() {
    state = AsyncValue.data(state.value!);
  }
}

final writeProvider = AsyncNotifierProvider<WriteViewModel, ThreadModel>(
  () => WriteViewModel(),
);
