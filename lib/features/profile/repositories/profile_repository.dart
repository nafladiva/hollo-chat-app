import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hollo/services/firebase_storage_service.dart';
import 'package:hollo/services/flutter_secure_storage_service.dart';
import 'package:hollo/services/stream_chat_service.dart';
import 'package:hollo/shared/consts/storage_key.dart';
import 'package:hollo/shared/models/user_mdl.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as sc;

abstract class ProfileRepository {
  Future<void> updateProfilePic({required File picture});
}

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<void> updateProfilePic({
    required File picture,
  }) async {
    final data =
        await FlutterSecureStorageService.get(key: StorageKey.userData);
    final userData = UserMdl.fromMap(json.decode(data ?? ''));

    /// upload image to firebase storage
    final profilePicUrl = await FirebaseStorageService.uploadFile(
      file: picture,
      folder: StorageKey.profilePicFolder,
      userId: userData.uid,
    );

    /// update profilePic user in firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userData.uid)
        .update({
      'profilePic': profilePicUrl,
    });

    /// update user on stream
    await StreamChatService.updateUser(
      user: sc.User(
        id: userData.uid,
        name: userData.name,
        image: profilePicUrl,
      ),
    );

    //TODO: there might be another way to reload the local user data

    /// save to cache
    final result = await FirebaseFirestore.instance
        .collection('users')
        .doc(userData.uid)
        .get();
    final map = result.data() as Map<String, dynamic>;
    await FlutterSecureStorageService.set(
      key: StorageKey.userData,
      value: json.encode(map),
    );
  }
}
