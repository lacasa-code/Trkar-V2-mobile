// To parse this JSON data, do
//
//     final updateUserProfileModel = updateUserProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateUserProfileModel updateUserProfileModelFromJson(String str) => UpdateUserProfileModel.fromJson(json.decode(str));

String updateUserProfileModelToJson(UpdateUserProfileModel data) => json.encode(data.toJson());

class UpdateUserProfileModel {
    UpdateUserProfileModel({
        this.status,
        this.message,
        this.code,
    });

    bool? status;
    String? message;
    int? code;

    factory UpdateUserProfileModel.fromJson(Map<String, dynamic> json) => UpdateUserProfileModel(
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
