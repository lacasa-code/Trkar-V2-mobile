// To parse this JSON data, do
//
//     final deleteModel = deleteModelFromJson(jsonString);

import 'dart:convert';

DeleteModel deleteModelFromJson(String str) =>
    DeleteModel.fromJson(json.decode(str));

String deleteModelToJson(DeleteModel data) => json.encode(data.toJson());

class DeleteModel {
  DeleteModel({
    this.status,
    this.message,
    this.code,
  });

  bool? status;
  String? message;
  int? code;

  factory DeleteModel.fromJson(Map<String, dynamic> json) => DeleteModel(
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
