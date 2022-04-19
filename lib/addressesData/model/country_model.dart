// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Country>? data;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Country>.from(json["data"].map((x) => Country.fromJson(x))),
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

class Country {
  Country({
    this.id,
    this.name,
    this.countryCode,
    this.iso3,
    this.numcode,
    this.phonecode,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? countryCode;
  String? iso3;
  String? numcode;
  String? phonecode;
  String? status;
  dynamic createdAt;
  dynamic updatedAt;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        countryCode: json["country_code"],
        iso3: json["iso3"],
        numcode: json["numcode"],
        phonecode: json["phonecode"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_code": countryCode,
        "iso3": iso3,
        "numcode": numcode,
        "phonecode": phonecode,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
