import 'package:equatable/equatable.dart';

class UserMdl extends Equatable {
  final String uid;
  final String email;
  final String username;
  final String name;
  final String profilePic;

  const UserMdl({
    required this.uid,
    required this.email,
    required this.username,
    this.name = '',
    this.profilePic = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'username': username,
      'name': name,
      'profilePic': profilePic,
    };
  }

  factory UserMdl.fromMap(Map<String, dynamic> map) {
    return UserMdl(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      name: map['name'],
      profilePic: map['profilePic'],
    );
  }

  @override
  List<Object?> get props => [uid, email, username, name, profilePic];
}
