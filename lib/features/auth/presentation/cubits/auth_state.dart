part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final ViewState authStatus;
  final bool isAuthenticated;
  final bool isCheckSession;
  final UserRequestModel userRequestModel;

  const AuthState({
    this.authStatus = const ViewState.initial(),
    this.isAuthenticated = false,
    this.isCheckSession = false,
    this.userRequestModel = const UserRequestModel(),
  });

  AuthState copyWith({
    ViewState? authStatus,
    bool? isAuthenticated,
    bool? isCheckSession,
    UserRequestModel? userRequestModel,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isCheckSession: isCheckSession ?? this.isCheckSession,
      userRequestModel: userRequestModel ?? this.userRequestModel,
    );
  }

  @override
  List<Object?> get props => [
        authStatus,
        isAuthenticated,
        isCheckSession,
        userRequestModel,
      ];
}
