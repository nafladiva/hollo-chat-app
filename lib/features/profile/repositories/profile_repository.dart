import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hollo/services/firebase_storage_service.dart';
import 'package:hollo/services/flutter_secure_storage_service.dart';
import 'package:hollo/shared/consts/storage_key.dart';

abstract class ProfileRepository {
  Future<void> updateProfilePic({required File picture});
}

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<void> updateProfilePic({
    required File picture,
  }) async {
    final userId =
        await FlutterSecureStorageService.get(key: StorageKey.uid) ?? '';

    /// upload image to firebase storage
    final profilePicUrl = await FirebaseStorageService.uploadFile(
      file: picture,
      folder: StorageKey.profilePicFolder,
      userId: userId,
    );

    /// update profilePic user in firestore
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'profilePic': profilePicUrl,
    });

    //TODO: there might be another way to reload the local user data

    /// save to cache
    final result =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    final data = result.data() as Map<String, dynamic>;
    await FlutterSecureStorageService.set(
      key: StorageKey.userData,
      value: json.encode(data),
    );
  }
}
