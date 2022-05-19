// To parse this JSON data, do
//
//     final attributesModel = attributesModelFromJson(jsonString);

import 'dart:convert';

AttributesModel attributesModelFromJson(String str) =>
    AttributesModel.fromJson(json.decode(str));

String attributesModelToJson(AttributesModel data) =>
    json.encode(data.toJson());

class AttributesModel {
  AttributesModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Attribute>? data;

  factory AttributesModel.fromJson(Map<String, dynamic> json) =>
      AttributesModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Attribute>.from(
                json["data"].map((x) => Attribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from((data ?? []).map((x) => x.toJson())),
      };
}

class Attribute {
  Attribute({
    this.id,
    this.seasonId,
    this.parentId,
    this.value,
    this.attributeId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? seasonId;
  String? parentId;
  String? value;
  String? attributeId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        seasonId: json["season_id"],
        parentId: json["parent_id"],
        value: json["value"],
        attributeId: json["attribute_id"],
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
        "season_id": seasonId,
        "parent_id": parentId,
        "value": value,
        "attribute_id": attributeId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
