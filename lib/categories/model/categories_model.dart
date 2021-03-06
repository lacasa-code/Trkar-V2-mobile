// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Categories>? data;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Categories>.from(
                json["data"].map((x) => Categories.fromJson(x))),
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

class Categories {
  Categories({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.parentId,
    this.status,
  });

  int? id;
  String? name;
  String? slug;
  String? image;
  String? parentId;
  dynamic status;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        parentId: json["parent_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "parent_id": parentId,
        "status": status,
      };
}
