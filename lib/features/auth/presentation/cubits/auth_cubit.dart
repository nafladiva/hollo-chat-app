import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/auth/data/models/index.dart';
import 'package:hollo/features/auth/data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  // final AuthRepository authRepository;

  AuthCubit() : super(const AuthState());

  void initial() async {
    await Future.delayed(const Duration(seconds: 3));
    _checkSession();
  }

  void _checkSession() {
    emit(state.copyWith(isCheckSession: true));
  }

  void onChangeName(String name) {
    emit(state.copyWith(
      userRequestModel: state.userRequestModel.copyWith(name: name),
    ));
  }

  void onChangeEmail(String email) {
    emit(state.copyWith(
      userRequestModel: state.userRequestModel.copyWith(email: email),
    ));
  }

  void onChangeUsername(String username) {
    emit(state.copyWith(
      userRequestModel: state.userRequestModel.copyWith(username: username),
    ));
  }

  void onChangePassword(String password) {
    emit(state.copyWith(
      userRequestModel: state.userRequestModel.copyWith(password: password),
    ));
  }

  void register() {
    print(
        'UserRequestModel: ${state.userRequestModel.name} | ${state.userRequestModel.email}');
  }

  void login() {}

  void resetState() {}
}
