// To parse this JSON data, do
//
//     final storeBranchesModel = storeBranchesModelFromJson(jsonString);

import 'dart:convert';

StoreBranchesModel storeBranchesModelFromJson(String str) =>
    StoreBranchesModel.fromJson(json.decode(str));

String storeBranchesModelToJson(StoreBranchesModel data) =>
    json.encode(data.toJson());

class StoreBranchesModel {
  StoreBranchesModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Branch>? data;

  factory StoreBranchesModel.fromJson(Map<String, dynamic> json) =>
      StoreBranchesModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Branch>.from(json["data"].map((x) => Branch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Branch {
  Branch({
    this.id,
    this.slug,
    this.name,
    this.status,
    this.storeId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? slug;
  String? name;
  String? status;
  String? storeId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        status: json["status"],
        storeId: json["store_id"],
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
        "slug": slug,
        "name": name,
        "status": status,
        "store_id": storeId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
