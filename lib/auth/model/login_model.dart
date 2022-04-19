// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.code,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.data,
    this.errorMessage,
  });

  bool? status;
  String? message;
  int? code;
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  UserData? data;
  Message? errorMessage;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"].runtimeType == String ? json["message"] : null,
        code: json["code"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
        errorMessage:
            json["message"].runtimeType != String && json["message"] != null
                ? Message.fromJson(json["message"])
                : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "data": data?.toJson(),
      };
}

class UserData {
  UserData({
    this.id,
    this.uuid,
    this.name,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.phoneVerifiedAt,
    this.image,
    this.countryId,
    this.cityId,
    this.areaId,
    this.address,
    this.longitude,
    this.latitude,
    this.lastLogin,
    this.inBlock,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? uuid;
  String? name;
  String? username;
  String? email;
  dynamic emailVerifiedAt;
  String? phone;
  dynamic phoneVerifiedAt;
  String? image;
  String? countryId;
  String? cityId;
  String? areaId;
  String? address;
  String? longitude;
  String? latitude;
  dynamic lastLogin;
  dynamic inBlock;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        phoneVerifiedAt: json["phone_verified_at"],
        image: json["image"],
        countryId: json["country_id"],
        cityId: json["city_id"],
        areaId: json["area_id"],
        address: json["address"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        lastLogin: json["last_login"],
        inBlock: json["in_block"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "username": username,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "phone_verified_at": phoneVerifiedAt,
        "image": image,
        "country_id": countryId,
        "city_id": cityId,
        "area_id": areaId,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "last_login": lastLogin,
        "in_block": inBlock,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Message {
  Message({
    this.email,
    this.password,
  });

  List<String>? email;
  List<String>? password;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        email: json["email"] == null
            ? null
            : List<String>.from(json["email"].map((x) => x)),
        password: json["password"] == null
            ? null
            : List<String>.from(json["password"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? [] : List<dynamic>.from(email!.map((x) => x)),
        "password":
            password == null ? [] : List<dynamic>.from(password!.map((x) => x)),
      };
}
