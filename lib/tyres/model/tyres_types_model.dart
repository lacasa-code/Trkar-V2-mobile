// To parse this JSON data, do
//
//     final tyresTypesModel = tyresTypesModelFromJson(jsonString);

import 'dart:convert';

TyresTypesModel tyresTypesModelFromJson(String str) =>
    TyresTypesModel.fromJson(json.decode(str));

String tyresTypesModelToJson(TyresTypesModel data) =>
    json.encode(data.toJson());

class TyresTypesModel {
  TyresTypesModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Type>? data;

  factory TyresTypesModel.fromJson(Map<String, dynamic> json) =>
      TyresTypesModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Type>.from(json["data"].map((x) => Type.fromJson(x))),
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

class Type {
  Type({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
        image: json["image"],
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
