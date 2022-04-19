// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  ProfileData? data;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class ProfileData {
  ProfileData({
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

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
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
