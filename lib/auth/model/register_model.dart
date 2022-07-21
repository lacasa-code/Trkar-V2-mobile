// To parse this JSON data, do
//
//     final userRegisterModel = userRegisterModelFromJson(jsonString);

import 'dart:convert';

UserAuthModel userRegisterModelFromJson(String str) =>
    UserAuthModel.fromJson(json.decode(str));

String userRegisterModelToJson(UserAuthModel data) =>
    json.encode(data.toJson());

class UserAuthModel {
  UserAuthModel({
    this.status,
    this.message,
    this.code,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.data,
    this.erroressages,
  });

  bool? status;
  String? message;
  int? code;
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  UserData? data;
  Map<String, List<String>>? erroressages;

  factory UserAuthModel.fromJson(Map<String, dynamic> json) => UserAuthModel(
        status: json["status"],
        message: json["message"].runtimeType == String ? json["message"] : null,
        code: json["code"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
        erroressages: json["message"].runtimeType == String
            ? null
            : Map.from(json["message"]).map((k, v) =>
                MapEntry<String, List<String>>(
                    k, List<String>.from(v.map((x) => x)))),
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
    this.activationCode,
  });

  int? id;
  String? uuid;
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
  String? activationCode;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        uuid: json["uuid"],
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        activationCode: json["activation_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
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
        "activation_code": activationCode,
      };
}
