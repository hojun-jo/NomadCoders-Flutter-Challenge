import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/core/models/thread/thread_model.dart';

class WriteRepository {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<void> uploadThread(ThreadModel thread) async {
    await _db.collection("thread").add(thread.toJson());
  }

  Future<void> uploadThreadImageFiles(File image, String threadId) async {
    final fileRef = _storage.ref().child("thread/$threadId/${image.hashCode}");

    await fileRef.putFile(image);
  }
}

final writeRepo = Provider((ref) => WriteRepository());
