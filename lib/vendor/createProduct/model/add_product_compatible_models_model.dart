// To parse this JSON data, do
//
//     final addProductCompatibleModelsModel = addProductCompatibleModelsModelFromJson(jsonString);

import 'dart:convert';

AddProductCompatibleModelsModel addProductCompatibleModelsModelFromJson(
        String str) =>
    AddProductCompatibleModelsModel.fromJson(json.decode(str));

String addProductCompatibleModelsModelToJson(
        AddProductCompatibleModelsModel data) =>
    json.encode(data.toJson());

class AddProductCompatibleModelsModel {
  AddProductCompatibleModelsModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  CompatibleModelData? data;

  factory AddProductCompatibleModelsModel.fromJson(Map<String, dynamic> json) =>
      AddProductCompatibleModelsModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : CompatibleModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class CompatibleModelData {
  CompatibleModelData({
    this.carModelId,
    this.productId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? carModelId;
  String? productId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory CompatibleModelData.fromJson(Map<String, dynamic> json) =>
      CompatibleModelData(
        carModelId: json["car_model_id"],
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
        "car_model_id": carModelId,
        "product_id": productId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
