// To parse this JSON data, do
//
//     final originalCountriesModel = originalCountriesModelFromJson(jsonString);

import 'dart:convert';

OriginalCountriesModel originalCountriesModelFromJson(String str) =>
    OriginalCountriesModel.fromJson(json.decode(str));

String originalCountriesModelToJson(OriginalCountriesModel data) =>
    json.encode(data.toJson());

class OriginalCountriesModel {
  OriginalCountriesModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<OriginalCountry>? data;

  factory OriginalCountriesModel.fromJson(Map<String, dynamic> json) =>
      OriginalCountriesModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? []
            : List<OriginalCountry>.from(
                json["data"].map((x) => OriginalCountry.fromJson(x))),
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

class OriginalCountry {
  OriginalCountry({
    this.id,
    this.name,
    this.status,
  });

  int? id;
  String? name;
  String? status;

  factory OriginalCountry.fromJson(Map<String, dynamic> json) =>
      OriginalCountry(
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
