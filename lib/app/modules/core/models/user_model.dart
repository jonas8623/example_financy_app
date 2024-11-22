import 'dart:convert';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'] ?? "",
        name: map['name'] ?? "",
        email: map['email'] ?? "",
      );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email}';
  }
}
