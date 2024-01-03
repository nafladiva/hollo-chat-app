part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final ViewState authStatus;
  final bool isAuthenticated;
  final UserMdl? user;
  final String email;
  final String username;
  final String password;
  final String? name;

  const AuthState({
    required this.authStatus,
    this.isAuthenticated = false,
    this.user,
    this.email = '',
    this.username = '',
    this.password = '',
    this.name,
  });

  bool get isValid =>
      email.isNotEmpty && username.isNotEmpty && password.isNotEmpty;

  AuthState copyWith({
    ViewState? authStatus,
    bool? isAuthenticated,
    UserMdl? user,
    String? email,
    String? username,
    String? password,
    String? name,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [
        authStatus,
        isAuthenticated,
        user,
        email,
        username,
        password,
        name,
      ];
}
