// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<City>? data;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<City>.from(json["data"].map((x) => City.fromJson(x))),
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

class City {
  City({
    this.id,
    this.name,
    this.countryId,
    this.status,
  });

  int? id;
  String? name;
  String? countryId;
  String? status;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_id": countryId,
        "status": status,
      };
}
