// To parse this JSON data, do
//
//     final vendorAuthModel = vendorAuthModelFromJson(jsonString);

import 'dart:convert';

VendorAuthModel vendorAuthModelFromJson(String str) =>
    VendorAuthModel.fromJson(json.decode(str));

String vendorAuthModelToJson(VendorAuthModel data) =>
    json.encode(data.toJson());

class VendorAuthModel {
  VendorAuthModel({
    this.status,
    this.message,
    this.code,
    this.accessToken,
    this.tokenType,
    this.data,
    this.errorMessages,
  });

  bool? status;
  String? message;
  Message? errorMessages;
  int? code;
  String? accessToken;
  String? tokenType;
  Data? data;

  factory VendorAuthModel.fromJson(Map<String, dynamic> json) =>
      VendorAuthModel(
        status: json["status"],
        message:
            json["message"].runtimeType != String || json["message"] == null
                ? null
                : json["message"],
        code: json["code"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        errorMessages:
            json["message"].runtimeType == String || json["message"] == null
                ? null
                : Message.fromJson(json["message"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "access_token": accessToken,
        "token_type": tokenType,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.uuid,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.phoneVerifiedAt,
    this.countryId,
    this.cityId,
    this.areaId,
    this.address,
    this.longitude,
    this.latitude,
    this.bankAccount,
    this.commercialNumber,
    this.taxCardNumber,
    this.notes,
    this.approved,
    this.lastLogin,
    this.inBlock,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.otp,
  });

  int? id;
  dynamic uuid;
  String? username;
  String? email;
  dynamic emailVerifiedAt;
  String? phone;
  dynamic phoneVerifiedAt;
  dynamic countryId;
  dynamic cityId;
  dynamic areaId;
  dynamic address;
  dynamic longitude;
  dynamic latitude;
  dynamic bankAccount;
  dynamic commercialNumber;
  dynamic taxCardNumber;
  dynamic notes;
  String? approved;
  DateTime? lastLogin;
  dynamic inBlock;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic otp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        uuid: json["uuid"],
        username: json["username"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        phoneVerifiedAt: json["phone_verified_at"],
        countryId: json["country_id"],
        cityId: json["city_id"],
        areaId: json["area_id"],
        address: json["address"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        bankAccount: json["bank_account"],
        commercialNumber: json["commercial_number"],
        taxCardNumber: json["tax_card_number"],
        notes: json["notes"],
        approved: json["approved"],
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        inBlock: json["in_block"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "username": username,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "phone_verified_at": phoneVerifiedAt,
        "country_id": countryId,
        "city_id": cityId,
        "area_id": areaId,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "bank_account": bankAccount,
        "commercial_number": commercialNumber,
        "tax_card_number": taxCardNumber,
        "notes": notes,
        "approved": approved,
        "last_login": lastLogin?.toIso8601String(),
        "in_block": inBlock,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "otp": otp,
      };
}

class Message {
  Message({
    this.username,
    this.email,
    this.password,
    this.phone,
  });

  List<String>? username;
  List<String>? email;
  List<String>? password;
  List<String>? phone;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        username: json["username"] == null
            ? null
            : List<String>.from(json["username"].map((x) => x)),
        email: json["email"] == null
            ? null
            : List<String>.from(json["email"].map((x) => x)),
        password: json["password"] == null
            ? null
            : List<String>.from(json["password"].map((x) => x)),
        phone: json["phone"] == null
            ? null
            : List<String>.from(json["phone"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "username": username == null
            ? null
            : List<dynamic>.from(username!.map((x) => x)),
        "email":
            email == null ? null : List<dynamic>.from(email!.map((x) => x)),
        "password": password == null
            ? null
            : List<dynamic>.from(password!.map((x) => x)),
        "phone":
            phone == null ? null : List<dynamic>.from(phone!.map((x) => x)),
      };
}
