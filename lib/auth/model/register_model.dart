// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

UserRegisterModel registerModelFromJson(String str) =>
    UserRegisterModel.fromJson(json.decode(str));

String registerModelToJson(UserRegisterModel data) => json.encode(data.toJson());

class UserRegisterModel {
  UserRegisterModel({
    this.statusCode,
    this.message,
    this.data,
  });

  int? statusCode;
  String? message;
  Data? data;

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
        statusCode: json["status_code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.token,
    this.serialId,
    this.createdAt,
    this.roles,
  });

  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? token;
  String? serialId;
  DateTime? createdAt;
  List<Role>? roles;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        token: json["token"],
        serialId: json["serial_id"],
        createdAt: DateTime.parse(json["created_at"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "token": token,
        "serial_id": serialId,
        "created_at": createdAt?.toIso8601String(),
        "roles": roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
      };
}

class Role {
  Role({
    this.id,
    this.title,
    this.createdAt,
  });

  int? id;
  String? title;
  DateTime? createdAt;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        title: json["title"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created_at": createdAt?.toIso8601String(),
      };
}
