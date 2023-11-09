// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final Record? record;
  final String? token;

  UserModel({
    this.record,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        record: Record.fromJson(json["record"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "record": record!.toJson(),
        "token": token,
      };
}

UserModel defaultUser = UserModel();

class Record {
  final String avatar;
  final String collectionId;
  final String collectionName;
  final DateTime created;
  final String email;
  final bool emailVisibility;
  final String id;
  final String name;
  final String role;
  final DateTime updated;
  final String username;
  final bool verified;

  Record({
    required this.avatar,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.email,
    required this.emailVisibility,
    required this.id,
    required this.name,
    required this.role,
    required this.updated,
    required this.username,
    required this.verified,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        avatar: json["avatar"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        email: json["email"],
        emailVisibility: json["emailVisibility"],
        id: json["id"],
        name: json["name"],
        role: json["role"],
        updated: DateTime.parse(json["updated"]),
        username: json["username"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created.toIso8601String(),
        "email": email,
        "emailVisibility": emailVisibility,
        "id": id,
        "name": name,
        "role": role,
        "updated": updated.toIso8601String(),
        "username": username,
        "verified": verified,
      };
}
