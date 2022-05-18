// To parse this JSON data, do
//
//     final carMadesFomVinModel = carMadesFomVinModelFromJson(jsonString);

import 'dart:convert';

CarMadesFromVinModel carMadesFomVinModelFromJson(String str) =>
    CarMadesFromVinModel.fromJson(json.decode(str));

String carMadesFomVinModelToJson(CarMadesFromVinModel data) =>
    json.encode(data.toJson());

class CarMadesFromVinModel {
  CarMadesFromVinModel({
    this.status,
    this.code,
    this.data,
  });

  bool? status;
  int? code;
  String? data;

  factory CarMadesFromVinModel.fromJson(Map<String, dynamic> json) =>
      CarMadesFromVinModel(
        status: json["status"],
        code: json["code"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data,
      };
}
