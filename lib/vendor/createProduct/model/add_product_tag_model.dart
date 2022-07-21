// To parse this JSON data, do
//
//     final addProductTagModel = addProductTagModelFromJson(jsonString);

import 'dart:convert';

AddProductTagModel addProductTagModelFromJson(String str) =>
    AddProductTagModel.fromJson(json.decode(str));

String addProductTagModelToJson(AddProductTagModel data) =>
    json.encode(data.toJson());

class AddProductTagModel {
  AddProductTagModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  TagData? data;

  factory AddProductTagModel.fromJson(Map<String, dynamic> json) =>
      AddProductTagModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? null : TagData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class TagData {
  TagData({
    this.name,
    this.productId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? name;
  String? productId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory TagData.fromJson(Map<String, dynamic> json) => TagData(
        name: json["name"],
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
        "name": name,
        "product_id": productId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
