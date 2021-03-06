// To parse this JSON data, do
//
//     final carMadesModel = carMadesModelFromJson(jsonString);

import 'dart:convert';

CarMadesModel carMadesModelFromJson(String str) =>
    CarMadesModel.fromJson(json.decode(str));

String carMadesModelToJson(CarMadesModel data) => json.encode(data.toJson());

class CarMadesModel {
  CarMadesModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<CarMades>? data;

  factory CarMadesModel.fromJson(Map<String, dynamic> json) => CarMadesModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<CarMades>.from(
                json["data"].map((x) => CarMades.fromJson(x))),
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

class CarMades {
  CarMades({
    this.id,
    this.name,
    this.slug,
    this.status,
    this.image,
    this.categoryId,
    this.categoryName,
  });

  int? id;
  String? name;
  String? slug;
  String? status;
  String? image;
  String? categoryId;
  String? categoryName;

  factory CarMades.fromJson(Map<String, dynamic> json) => CarMades(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        status: json["status"],
        image: json["image"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "status": status,
        "image": image,
        "category_id": categoryId,
        "category_name": categoryName,
      };
}
