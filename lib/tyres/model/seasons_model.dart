// To parse this JSON data, do
//
//     final seasonsModel = seasonsModelFromJson(jsonString);

import 'dart:convert';

SeasonsModel seasonsModelFromJson(String str) =>
    SeasonsModel.fromJson(json.decode(str));

String seasonsModelToJson(SeasonsModel data) => json.encode(data.toJson());

class SeasonsModel {
  SeasonsModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Season>? data;

  factory SeasonsModel.fromJson(Map<String, dynamic> json) => SeasonsModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Season>.from(json["data"].map((x) => Season.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Season {
  Season({
    this.id,
    this.name,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["id"],
        name: json["name"],
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
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
