part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final ViewState authStatus;
  final bool isAuthenticated;
  final bool isCheckSession;

  const AuthState({
    this.authStatus = const ViewState.initial(),
    this.isAuthenticated = false,
    this.isCheckSession = false,
  });

  AuthState copyWith({
    ViewState? authStatus,
    bool? isAuthenticated,
    bool? isCheckSession,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isCheckSession: isCheckSession ?? this.isCheckSession,
    );
  }

  @override
  List<Object?> get props => [authStatus, isAuthenticated, isCheckSession];
}
