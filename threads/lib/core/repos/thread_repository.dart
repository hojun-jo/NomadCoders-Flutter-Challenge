import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/core/models/thread/thread_model.dart';

class ThreadRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> uploadThread(ThreadModel thread) async {
    await _db.collection("thread").add(thread.toJson());
  }

  Future<void> uploadThreadImageFiles(File image, String threadId) async {
    final fileRef = _storage.ref().child("thread/$threadId/${image.hashCode}");

    await fileRef.putFile(image);
  }

  Stream<List<ThreadModel>> fetchThreads() {
    return _db
        .collection("thread")
        .orderBy("postTime", descending: true)
        .snapshots()
        .map((snapshot) {
      List<ThreadModel> threads = [];

      for (final json in snapshot.docs) {
        final thread = json.data();
        final threadModel = ThreadModel.fromJson(thread);

        threads.add(threadModel);
      }

      return threads;
    });
  }

  Future<List<String>> fetchThreadImages(String threadId) async {
    final storageRef = _storage.ref().child("thread/$threadId");
    final listResult = await storageRef.listAll();
    List<String> imageUrls = [];

    for (final item in listResult.items) {
      final url = await item.getDownloadURL();

      imageUrls.add(url);
    }

    return imageUrls;
  }
}

final threadRepo = Provider((ref) => ThreadRepository());
