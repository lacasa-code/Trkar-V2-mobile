// To parse this JSON data, do
//
//     final deleteAddressModel = deleteAddressModelFromJson(jsonString);

import 'dart:convert';

DeleteAddressModel deleteAddressModelFromJson(String str) => DeleteAddressModel.fromJson(json.decode(str));

String deleteAddressModelToJson(DeleteAddressModel data) => json.encode(data.toJson());

class DeleteAddressModel {
    DeleteAddressModel({
        this.success,
        this.message,
    });

    bool? success;
    String? message;

    factory DeleteAddressModel.fromJson(Map<String, dynamic> json) => DeleteAddressModel(
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
    };
}
