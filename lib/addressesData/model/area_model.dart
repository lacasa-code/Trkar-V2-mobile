// To parse this JSON data, do
//
//     final areaModel = areaModelFromJson(jsonString);

import 'dart:convert';

AreaModel areaModelFromJson(String str) => AreaModel.fromJson(json.decode(str));

String areaModelToJson(AreaModel data) => json.encode(data.toJson());

class AreaModel {
  AreaModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Area>? data;

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Area>.from(json["data"].map((x) => Area.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Area {
  Area({
    this.id,
    this.name,
    this.cityId,
    this.status,
  });

  int? id;
  String? name;
  String? cityId;
  String? status;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
        cityId: json["city_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city_id": cityId,
        "status": status,
      };
}
