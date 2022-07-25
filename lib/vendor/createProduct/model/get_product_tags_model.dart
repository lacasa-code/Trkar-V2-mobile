// To parse this JSON data, do
//
//     final getProductTagsModel = getProductTagsModelFromJson(jsonString);

import 'dart:convert';

GetProductTagsModel getProductTagsModelFromJson(String str) =>
    GetProductTagsModel.fromJson(json.decode(str));

String getProductTagsModelToJson(GetProductTagsModel data) =>
    json.encode(data.toJson());

class GetProductTagsModel {
  GetProductTagsModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Tag>? data;

  factory GetProductTagsModel.fromJson(Map<String, dynamic> json) =>
      GetProductTagsModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Tag>.from(json["data"].map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Tag {
  Tag({
    this.id,
    this.name,
    this.productId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? productId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
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
        "name": name,
        "product_id": productId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
