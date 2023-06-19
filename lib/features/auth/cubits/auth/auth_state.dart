part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final ViewState authStatus;
  final String email;
  final String password;

  const AuthState({
    required this.authStatus,
    this.email = '',
    this.password = '',
  });

  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  AuthState copyWith({
    ViewState? authStatus,
    String? email,
    String? password,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [authStatus, email, password];
}
