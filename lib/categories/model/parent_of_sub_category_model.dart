// To parse this JSON data, do
//
//     final parentsOfSubCategoryModel = parentsOfSubCategoryModelFromJson(jsonString);

import 'dart:convert';

ParentsOfSubCategoryModel parentsOfSubCategoryModelFromJson(String str) =>
    ParentsOfSubCategoryModel.fromJson(json.decode(str));

String parentsOfSubCategoryModelToJson(ParentsOfSubCategoryModel data) =>
    json.encode(data.toJson());

class ParentsOfSubCategoryModel {
  ParentsOfSubCategoryModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<int>? data;

  factory ParentsOfSubCategoryModel.fromJson(Map<String, dynamic> json) =>
      ParentsOfSubCategoryModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: List<int>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x)),
      };
}
