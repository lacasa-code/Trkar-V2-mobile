// To parse this JSON data, do
//
//     final addProductImagesModel = addProductImagesModelFromJson(jsonString);

import 'dart:convert';

StoreAdditionalProductImagesModel addProductImagesModelFromJson(String str) =>
    StoreAdditionalProductImagesModel.fromJson(json.decode(str));

String addProductImagesModelToJson(StoreAdditionalProductImagesModel data) =>
    json.encode(data.toJson());

class StoreAdditionalProductImagesModel {
  StoreAdditionalProductImagesModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  Data? data;

  factory StoreAdditionalProductImagesModel.fromJson(Map<String, dynamic> json) =>
      StoreAdditionalProductImagesModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.image,
    this.productId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? image;
  String? productId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        image: json["image"],
        productId: json["product_id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "product_id": productId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
