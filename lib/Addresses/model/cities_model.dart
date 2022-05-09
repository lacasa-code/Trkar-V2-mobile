// To parse this JSON data, do
//
//     final citiesModel = citiesModelFromJson(jsonString);

import 'dart:convert';

CitiesModel citiesModelFromJson(String str) =>
    CitiesModel.fromJson(json.decode(str));

String citiesModelToJson(CitiesModel data) => json.encode(data.toJson());

class CitiesModel {
  CitiesModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<City>? data;

  factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<City>.from(json["data"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class City {
  City({
    this.id,
    this.name,
    this.areas,
  });

  int? id;
  String? name;
  List<Area>? areas;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        areas: json["areas"] == null
            ? null
            : List<Area>.from(json["areas"].map((x) => Area.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "areas": areas == null
            ? []
            : List<dynamic>.from(areas!.map((x) => x.toJson())),
      };
}

class Area {
  Area({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
