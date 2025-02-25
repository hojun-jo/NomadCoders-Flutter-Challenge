import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/core/models/thread/thread_model.dart';
import 'package:threads/features/write/repos/write_repository.dart';

class WriteViewModel extends AsyncNotifier<ThreadModel> {
  late final WriteRepository _repo;

  bool _isPostable = false;

  bool get isPostable => _isPostable;

  @override
  FutureOr<ThreadModel> build() {
    _repo = ref.read(writeRepo);
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
    _updateState();
  }

  void addImages(List<String>? imagePaths) {
    if (imagePaths == null) return;

    state.value!.images.addAll(imagePaths);
    _updateState();
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

  void _updateState() {
    state = AsyncValue.data(state.value!);
  }
}

final writeProvider = AsyncNotifierProvider<WriteViewModel, ThreadModel>(
  () => WriteViewModel(),
);
