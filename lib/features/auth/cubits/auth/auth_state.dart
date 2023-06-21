part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final ViewState authStatus;
  final bool isAuthenticated;
  final String email;
  final String password;

  const AuthState({
    required this.authStatus,
    this.isAuthenticated = false,
    this.email = '',
    this.password = '',
  });

  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  AuthState copyWith({
    ViewState? authStatus,
    bool? isAuthenticated,
    String? email,
    String? password,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [authStatus, isAuthenticated, email, password];
}
