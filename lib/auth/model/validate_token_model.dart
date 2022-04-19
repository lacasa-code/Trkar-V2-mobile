// To parse this JSON data, do
//
//     final validateTokenModel = validateTokenModelFromJson(jsonString);

import 'dart:convert';

ValidateTokenModel validateTokenModelFromJson(String str) => ValidateTokenModel.fromJson(json.decode(str));

String validateTokenModelToJson(ValidateTokenModel data) => json.encode(data.toJson());

class ValidateTokenModel {
    ValidateTokenModel({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    bool? status;
    String? message;
    int? code;
    bool? data;

    factory ValidateTokenModel.fromJson(Map<String, dynamic> json) => ValidateTokenModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data,
    };
}
