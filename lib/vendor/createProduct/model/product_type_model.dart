// To parse this JSON data, do
//
//     final productTypeModel = productTypeModelFromJson(jsonString);

import 'dart:convert';

ProductTypeModel productTypeModelFromJson(String str) =>
    ProductTypeModel.fromJson(json.decode(str));

String productTypeModelToJson(ProductTypeModel data) =>
    json.encode(data.toJson());

class ProductTypeModel {
  ProductTypeModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<ProductType>? data;

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) =>
      ProductTypeModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<ProductType>.from(
                json["data"].map((x) => ProductType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductType {
  ProductType({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
      };
}
