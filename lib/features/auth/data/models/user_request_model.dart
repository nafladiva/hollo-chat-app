class UserRequestModel {
  final String name;
  final String email;
  final String username;
  final String password;

  const UserRequestModel({
    this.name = '',
    this.email = '',
    this.username = '',
    this.password = '',
  });

  UserRequestModel copyWith({
    String? name,
    String? email,
    String? username,
    String? password,
  }) {
    return UserRequestModel(
      name: name ?? this.name,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullname': name,
      'email': email,
      'username': username,
      'password': password,
    };
  }
}
