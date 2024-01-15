import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/services/flutter_secure_storage_service.dart';
import 'package:hollo/services/stream_chat_service.dart';
import 'package:hollo/shared/consts/assets_path.dart';
import 'package:hollo/shared/consts/storage_key.dart';
import 'package:hollo/shared/models/user_mdl.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as sc;

import '../repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;
  final _firebaseAuth = FirebaseAuth.instance;

  AuthCubit({required this.repository})
      : super(
          const AuthState(authStatus: ViewState.initial()),
        );

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  void onBuild() async {
    emit(state.copyWith(authStatus: const ViewState.loading()));

    // add times for splash screen
    await Future.delayed(const Duration(seconds: 1));

    final uid = await FlutterSecureStorageService.get(key: StorageKey.uid);

    if (uid != null) {
      await getUserData();

      if (state.user != null) {
        await connectUserToStream(
          id: state.user!.uid,
          name: state.user!.name,
          image: state.user!.profilePic,
          username: state.user!.username,
        );
      }

      emit(state.copyWith(
        isAuthenticated: true,
        authStatus: const ViewState.success(),
      ));
    } else {
      emit(state.copyWith(
        isAuthenticated: false,
        authStatus: const ViewState.success(),
      ));
    }
  }

  void onChangeEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void onChangeUsername(String username) {
    emit(state.copyWith(username: username));
  }

  void onChangeName(String name) {
    emit(state.copyWith(name: name));
  }

  void onChangePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void resetState() {
    emit(state.copyWith(
      authStatus: const ViewState.initial(),
      email: '',
      password: '',
    ));
  }

  Future<void> login() async {
    emit(state.copyWith(authStatus: const ViewState.loading()));

    try {
      final credential = await repository.login(
        email: state.email,
        password: state.password,
      );

      final uid = credential.user?.uid ?? '';
      final userData = await repository.getUserData(uid);

      await connectUserToStream(
        id: uid,
        name: userData.name,
        image: userData.profilePic,
        username: userData.username,
      );

      await FlutterSecureStorageService.set(key: StorageKey.uid, value: uid);
      await FlutterSecureStorageService.set(
        key: StorageKey.userData,
        value: json.encode(userData.toMap()),
      );

      emit(state.copyWith(
        authStatus: const ViewState.success(),
        isAuthenticated: true,
        user: userData,
      ));
    } catch (_) {
      emit(state.copyWith(authStatus: const ViewState.failed()));
    }
  }

  Future<void> connectUserToStream({
    required String id,
    required String name,
    required String username,
    required String image,
  }) async {
    try {
      await StreamChatService.connectUser(
        user: sc.User(
          id: id,
          name: name,
          image: image,
          extraData: <String, dynamic>{
            'username': username,
          },
        ),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> disconnectUserFromStream() async {
    await StreamChatService.disconnectUser();
  }

  Future<void> register() async {
    emit(state.copyWith(authStatus: const ViewState.loading()));

    try {
      final isUsernameAvailable = await repository.checkUsernameAvailability(
        state.username,
      );

      if (!isUsernameAvailable) {
        emit(
          state.copyWith(
            authStatus: const ViewState.failed(
              errorMessage: 'Username is already exists',
            ),
          ),
        );
      } else {
        await repository.register(
          email: state.email,
          username: state.username,
          password: state.password,
          name: state.name,
          profilePic: AssetsPath.emptyProfileInFirestore, // default profile pic
        );

        // auto login after register
        await login();
      }
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          authStatus: ViewState.failed(errorMessage: e.message),
        ),
      );
    }
  }

  Future<void> getUserData() async {
    final result =
        await FlutterSecureStorageService.get(key: StorageKey.userData) ?? '';
    final userData = UserMdl.fromMap(json.decode(result));

    emit(state.copyWith(user: userData));
  }

  Future<void> logout() async {
    emit(state.copyWith(authStatus: const ViewState.loading()));

    try {
      await repository.logout();
      await FlutterSecureStorageService.deleteAll();
      await disconnectUserFromStream();

      emit(state.copyWith(
        authStatus: const ViewState.success(),
        isAuthenticated: false,
      ));
    } catch (e) {
      emit(state.copyWith(authStatus: const ViewState.failed()));
    }
  }
}
