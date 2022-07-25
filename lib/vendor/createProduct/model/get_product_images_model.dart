// To parse this JSON data, do
//
//     final getProductImagesModel = getProductImagesModelFromJson(jsonString);

import 'dart:convert';

GetProductImagesModel getProductImagesModelFromJson(String str) =>
    GetProductImagesModel.fromJson(json.decode(str));

String getProductImagesModelToJson(GetProductImagesModel data) =>
    json.encode(data.toJson());

class GetProductImagesModel {
  GetProductImagesModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Images>? data;

  factory GetProductImagesModel.fromJson(Map<String, dynamic> json) =>
      GetProductImagesModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Images>.from(json["data"].map((x) => Images.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Images {
  Images({
    this.id,
    this.image,
    this.productId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? image;
  String? productId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"],
        image: json["image"],
        productId: json["product_id"],
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
        "image": image,
        "product_id": productId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
