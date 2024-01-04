import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/view_state.dart';

import '../repositories/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit({required this.repository})
      : super(
          const ProfileState(
            loadStatus: ViewState.initial(),
          ),
        );

  Future<void> updateProfilePicture({required File picture}) async {
    emit(state.copyWith(loadStatus: const ViewState.loading()));

    try {
      await repository.updateProfilePic(
        picture: picture,
      );

      emit(state.copyWith(loadStatus: const ViewState.success()));
    } catch (e) {
      emit(state.copyWith(loadStatus: const ViewState.failed()));
    }
  }
}
