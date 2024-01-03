import 'package:equatable/equatable.dart';

class UserMdl extends Equatable {
  final String uid;
  final String email;
  final String username;
  final String name;

  const UserMdl({
    required this.uid,
    required this.email,
    required this.username,
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'username': username,
      'name': name,
    };
  }

  factory UserMdl.fromMap(Map<String, dynamic> map) {
    return UserMdl(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      name: map['name'],
    );
  }

  @override
  List<Object?> get props => [uid, email, username, name];
}
