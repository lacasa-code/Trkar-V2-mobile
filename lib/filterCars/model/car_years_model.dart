// To parse this JSON data, do
//
//     final yearsModel = yearsModelFromJson(jsonString);

import 'dart:convert';

CarYearsModel yearsModelFromJson(String str) =>
    CarYearsModel.fromJson(json.decode(str));

String yearsModelToJson(CarYearsModel data) => json.encode(data.toJson());

class CarYearsModel {
  CarYearsModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Year>? data;

  factory CarYearsModel.fromJson(Map<String, dynamic> json) => CarYearsModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Year>.from(json["data"].map((x) => Year.fromJson(x))),
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

class Year {
  Year({
    this.id,
    this.year,
  });

  int? id;
  String? year;

  factory Year.fromJson(Map<String, dynamic> json) => Year(
        id: json["id"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "year": year,
      };
}
