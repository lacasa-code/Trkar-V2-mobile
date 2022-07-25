// To parse this JSON data, do
//
//     final getProductCompatibleModelsModel = getProductCompatibleModelsModelFromJson(jsonString);

import 'dart:convert';

GetProductCompatibleModelsModel getProductCompatibleModelsModelFromJson(
        String str) =>
    GetProductCompatibleModelsModel.fromJson(json.decode(str));

String getProductCompatibleModelsModelToJson(
        GetProductCompatibleModelsModel data) =>
    json.encode(data.toJson());

class GetProductCompatibleModelsModel {
  GetProductCompatibleModelsModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<CompatibleModel>? data;

  factory GetProductCompatibleModelsModel.fromJson(Map<String, dynamic> json) =>
      GetProductCompatibleModelsModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<CompatibleModel>.from(
                json["data"].map((x) => CompatibleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CompatibleModel {
  CompatibleModel({
    this.id,
    this.productId,
    this.carModelId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.nameAr,
    this.nameEn,
    this.status,
    this.carMadeId,
  });

  int? id;
  String? productId;
  String? carModelId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? slug;
  String? nameAr;
  String? nameEn;
  String? status;
  String? carMadeId;

  factory CompatibleModel.fromJson(Map<String, dynamic> json) =>
      CompatibleModel(
        id: json["id"],
        productId: json["product_id"],
        carModelId: json["car_model_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        slug: json["slug"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        status: json["status"],
        carMadeId: json["car_made_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "car_model_id": carModelId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "slug": slug,
        "name_ar": nameAr,
        "name_en": nameEn,
        "status": status,
        "car_made_id": carMadeId,
      };
}
