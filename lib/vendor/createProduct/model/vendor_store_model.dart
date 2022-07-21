// To parse this JSON data, do
//
//     final vendorModel = vendorModelFromJson(jsonString);

import 'dart:convert';

VendorStoreModel vendorModelFromJson(String str) =>
    VendorStoreModel.fromJson(json.decode(str));

String vendorModelToJson(VendorStoreModel data) => json.encode(data.toJson());

class VendorStoreModel {
  VendorStoreModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  StoreData? data;

  factory VendorStoreModel.fromJson(Map<String, dynamic> json) => VendorStoreModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? null : StoreData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class StoreData {
  StoreData({
    this.id,
    this.uuid,
    this.vendorId,
    this.storeTypeId,
    this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.image,
    this.banner,
    this.phone,
    this.phoneVerifiedAt,
    this.email,
    this.emailVerifiedAt,
    this.address,
    this.longitude,
    this.latitude,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? uuid;
  String? vendorId;
  String? storeTypeId;
  String? nameAr;
  String? nameEn;
  String? descriptionAr;
  String? descriptionEn;
  String? image;
  dynamic banner;
  String? phone;
  dynamic phoneVerifiedAt;
  String? email;
  dynamic emailVerifiedAt;
  String? address;
  dynamic longitude;
  dynamic latitude;
  String? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory StoreData.fromJson(Map<String, dynamic> json) => StoreData(
        id: json["id"],
        uuid: json["uuid"],
        vendorId: json["vendor_id"],
        storeTypeId: json["store_type_id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        image: json["image"],
        banner: json["banner"],
        phone: json["phone"],
        phoneVerifiedAt: json["phone_verified_at"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        address: json["address"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "vendor_id": vendorId,
        "store_type_id": storeTypeId,
        "name_ar": nameAr,
        "name_en": nameEn,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "image": image,
        "banner": banner,
        "phone": phone,
        "phone_verified_at": phoneVerifiedAt,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
