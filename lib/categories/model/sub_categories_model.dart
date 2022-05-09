// To parse this JSON data, do
//
//     final subCategoriesModel = subCategoriesModelFromJson(jsonString);

import 'dart:convert';

SubCategoriesModel subCategoriesModelFromJson(String str) =>
    SubCategoriesModel.fromJson(json.decode(str));

String subCategoriesModelToJson(SubCategoriesModel data) =>
    json.encode(data.toJson());

class SubCategoriesModel {
  SubCategoriesModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<SubCategory>? data;

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) =>
      SubCategoriesModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<SubCategory>.from(
                json["data"].map((x) => SubCategory.fromJson(x))),
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

class SubCategory {
  SubCategory({
    this.id,
    this.slug,
    this.nameAr,
    this.nameEn,
    this.image,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.parentId,
    this.status,
  });

  int? id;
  String? slug;
  String? nameAr;
  String? nameEn;
  String? image;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? parentId;
  String? status;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        slug: json["slug"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        image: json["image"],
        deletedAt: json["deleted_at"],
        createdAt:
            DateTime.parse(json["created_at"] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
        parentId: json["parent_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name_ar": nameAr,
        "name_en": nameEn,
        "image": image,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "parent_id": parentId,
        "status": status,
      };
}
