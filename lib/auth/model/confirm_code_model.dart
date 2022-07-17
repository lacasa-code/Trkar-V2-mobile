// To parse this JSON data, do
//
//     final confirmCodeModel = confirmCodeModelFromJson(jsonString);

import 'dart:convert';

ConfirmCodeModel confirmCodeModelFromJson(String str) => ConfirmCodeModel.fromJson(json.decode(str));

String confirmCodeModelToJson(ConfirmCodeModel data) => json.encode(data.toJson());

class ConfirmCodeModel {
    ConfirmCodeModel({
        this.status,
        this.message,
        this.code,
    });

    bool? status;
    String? message;
    int? code;

    factory ConfirmCodeModel.fromJson(Map<String, dynamic> json) => ConfirmCodeModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
    };
}
