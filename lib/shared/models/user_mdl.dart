import 'package:equatable/equatable.dart';

class UserMdl extends Equatable {
  final String uid;
  final String email;
  final String name;

  const UserMdl({
    required this.uid,
    required this.email,
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'name': name,
    };
  }

  factory UserMdl.fromMap(Map<String, dynamic> map) {
    return UserMdl(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
    );
  }

  @override
  List<Object?> get props => [uid, email, name];
}
