// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.statusCode,
    this.message,
    this.data,
  });

  int? statusCode;
  String? message;
  UserData? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        statusCode: json["status_code"],
        message: json["message"],
        data: UserData.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}

class UserData {
  UserData({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.emailVerifiedAt,
    this.phoneNo,
    this.birthdate,
    this.gender,
    this.createdAt,
    this.token,
    this.roles,
  });

  int? id;
  String? name;
  String? lastName;
  String? email;
  DateTime? emailVerifiedAt;
  String? phoneNo;
  DateTime? birthdate;
  String? gender;
  DateTime? createdAt;
  String? token;
  List<Role>? roles;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        phoneNo: json["phone_no"],
        birthdate: DateTime.parse(json["birthdate"]),
        gender: json["gender"],
        createdAt: DateTime.parse(json["created_at"]),
        token: json["token"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "phone_no": phoneNo,
        "birthdate":
            "${birthdate?.year.toString().padLeft(4, '0')}-${birthdate?.month.toString().padLeft(2, '0')}-${birthdate?.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "created_at": createdAt?.toIso8601String(),
        "token": token,
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
    this.lang,
    this.nameEn,
  });

  int? id;
  String? title;
  DateTime? createdAt;
  String? lang;
  dynamic nameEn;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        title: json["title"],
        createdAt: DateTime.parse(json["created_at"]),
        lang: json["lang"],
        nameEn: json["name_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created_at": createdAt?.toIso8601String(),
        "lang": lang,
        "name_en": nameEn,
      };
}
