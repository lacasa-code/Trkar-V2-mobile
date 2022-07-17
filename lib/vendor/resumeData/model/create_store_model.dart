// To parse this JSON data, do
//
//     final createStoreModel = createStoreModelFromJson(jsonString);

import 'dart:convert';

CreateStoreModel createStoreModelFromJson(String str) =>
    CreateStoreModel.fromJson(json.decode(str));

String createStoreModelToJson(CreateStoreModel data) =>
    json.encode(data.toJson());

class CreateStoreModel {
  CreateStoreModel({
    this.status,
    this.message,
    this.code,
    this.data,
    this.errorMessages,
  });

  bool? status;
  String? message;
  int? code;
  List<StoreData>? data;
  Map<String, List<String>>? errorMessages;

  factory CreateStoreModel.fromJson(Map<String, dynamic> json) =>
      CreateStoreModel(
        status: json["status"],
        message: json["message"].runtimeType == String ? json["message"] : null,
        errorMessages:
            json["message"] == null || json["message"].runtimeType == String
                ? null
                : Map.from(json["message"]).map((k, v) =>
                    MapEntry<String, List<String>>(
                        k, List<String>.from(v.map((x) => x)))),
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<StoreData>.from(
                json["data"].map((x) => StoreData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StoreData {
  StoreData({
    this.nameAr,
    this.nameEn,
    this.uuid,
    this.vendorId,
    this.storeTypeId,
    this.descriptionAr,
    this.descriptionEn,
    this.phone,
    this.email,
    this.status,
    this.address,
    this.longitude,
    this.latitude,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.name,
    this.slug,
    this.storeId,
  });

  String? nameAr;
  String? nameEn;
  String? uuid;
  int? vendorId;
  String? storeTypeId;
  String? descriptionAr;
  String? descriptionEn;
  String? phone;
  String? email;
  int? status;
  String? address;
  String? longitude;
  String? latitude;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? name;
  String? slug;
  int? storeId;

  factory StoreData.fromJson(Map<String, dynamic> json) => StoreData(
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        uuid: json["uuid"],
        vendorId: json["vendor_id"],
        storeTypeId: json["store_type_id"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        phone: json["phone"],
        email: json["email"],
        status: json["status"],
        address: json["address"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        storeId: json["store_id"],
      );

  Map<String, dynamic> toJson() => {
        "name_ar": nameAr,
        "name_en": nameEn,
        "uuid": uuid,
        "vendor_id": vendorId,
        "store_type_id": storeTypeId,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "phone": phone,
        "email": email,
        "status": status,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "name": name,
        "slug": slug,
        "store_id": storeId,
      };
}
