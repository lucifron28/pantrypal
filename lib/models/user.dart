import 'package:uuid/uuid.dart';

class User {
  final String id;
  final String email;
  final String? name;
  final String? avatarUrl;

  User({
    required this.id,
    required this.email,
    this.name,
    this.avatarUrl,
  });

  // New User Constructor
  factory User.newUser({
    required String email,
    String? name,
    String? avatarUrl,
  }) {
    final uuid = Uuid();
    return User(
      id: uuid.v4(),
      email: email,
      name: name,
      avatarUrl: avatarUrl,
    );
  }

  // JSON Serializer
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'avatarUrl': avatarUrl,
      };

  // JSON Deserializer
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      avatarUrl: json['avatarUrl'],
    );
  }
}