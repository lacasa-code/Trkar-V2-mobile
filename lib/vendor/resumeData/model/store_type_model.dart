// To parse this JSON data, do
//
//     final storesTypeModel = storesTypeModelFromJson(jsonString);

import 'dart:convert';

StoresTypeModel storesTypeModelFromJson(String str) =>
    StoresTypeModel.fromJson(json.decode(str));

String storesTypeModelToJson(StoresTypeModel data) =>
    json.encode(data.toJson());

class StoresTypeModel {
  StoresTypeModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<StoreType>? data;

  factory StoresTypeModel.fromJson(Map<String, dynamic> json) =>
      StoresTypeModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<StoreType>.from(
                json["data"].map((x) => StoreType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StoreType {
  StoreType({
    this.id,
    this.name,
    this.status,
  });

  int? id;
  String? name;
  String? status;

  factory StoreType.fromJson(Map<String, dynamic> json) => StoreType(
        id: json["id"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
      };
}
