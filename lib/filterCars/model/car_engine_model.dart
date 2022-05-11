// To parse this JSON data, do
//
//     final carEngineModel = carEngineModelFromJson(jsonString);

import 'dart:convert';

CarEngineModel carEngineModelFromJson(String str) => CarEngineModel.fromJson(json.decode(str));

String carEngineModelToJson(CarEngineModel data) => json.encode(data.toJson());

class CarEngineModel {
    CarEngineModel({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    bool? status;
    String? message;
    int? code;
    List<CarEngine>? data;

    factory CarEngineModel.fromJson(Map<String, dynamic> json) => CarEngineModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data:json["data"]==null?null: List<CarEngine>.from(json["data"].map((x) => CarEngine.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data":data==null?[]: List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CarEngine {
    CarEngine({
        this.id,
        this.name,
        this.carModelId,
        this.carModelName,
        this.status,
    });

    int? id;
    String? name;
    String? carModelId;
    String? carModelName;
    String? status;

    factory CarEngine.fromJson(Map<String, dynamic> json) => CarEngine(
        id: json["id"],
        name: json["name"],
        carModelId: json["car_model_id"],
        carModelName: json["car_model_name"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "car_model_id": carModelId,
        "car_model_name": carModelName,
        "status": status,
    };
}
