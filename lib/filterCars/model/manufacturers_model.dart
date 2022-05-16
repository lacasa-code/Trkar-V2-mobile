// To parse this JSON data, do
//
//     final manufacturersModel = manufacturersModelFromJson(jsonString);

import 'dart:convert';

ManufacturersModel manufacturersModelFromJson(String str) =>
    ManufacturersModel.fromJson(json.decode(str));

String manufacturersModelToJson(ManufacturersModel data) =>
    json.encode(data.toJson());

class ManufacturersModel {
  ManufacturersModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Manufacturer>? data;

  factory ManufacturersModel.fromJson(Map<String, dynamic> json) =>
      ManufacturersModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Manufacturer>.from(
                json["data"].map((x) => Manufacturer.fromJson(x))),
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

class Manufacturer {
  Manufacturer({
    this.id,
    this.name,
    this.status,
    this.website,
    this.categoryId,
    this.categoryName,
    this.image,
    this.address,
    this.companyName,
  });

  int? id;
  String? name;
  String? status;
  String? image;
  String? companyName;
  String? address;
  String? website;
  String? categoryId;
  String? categoryName;

  factory Manufacturer.fromJson(Map<String, dynamic> json) => Manufacturer(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        website: json["website"],
        image: json["image"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        address: json["address"],
        companyName: json["company_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "image": image,
        "category_id": categoryId,
        "category_name": categoryName,
        "address": address,
        "company_name": companyName,
        "website": website,
      };
}
