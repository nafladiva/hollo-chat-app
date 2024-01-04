import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  static final _storage = FirebaseStorage.instance;

  static Future<String?> uploadFile({
    required File file,
    required String folder,
    required String userId,
  }) async {
    final ext = file.path.split('.').last;
    final folderPath = '$folder/$userId.$ext';

    final reference = _storage.ref().child(folderPath);
    final uploadTask =
        reference.putFile(file).timeout(const Duration(minutes: 1));

    return uploadTask.then((file) => file.ref.getDownloadURL());
  }
}
