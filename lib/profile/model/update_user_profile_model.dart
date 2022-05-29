// To parse this JSON data, do
//
//     final updateUserProfileModel = updateUserProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateUserProfileModel updateUserProfileModelFromJson(String str) =>
    UpdateUserProfileModel.fromJson(json.decode(str));

String updateUserProfileModelToJson(UpdateUserProfileModel data) =>
    json.encode(data.toJson());

class UpdateUserProfileModel {
  UpdateUserProfileModel({
    this.status,
    this.message,
    this.code,
    this.erroressages,
  });

  bool? status;
  String? message;
  Map<String, List<String>>? erroressages;

  int? code;

  factory UpdateUserProfileModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserProfileModel(
        status: json["status"],
        message: json["message"].runtimeType == String ? json["message"] : null,
        code: json["code"],
        erroressages: json["message"].runtimeType == String
            ? null
            : Map.from(json["message"]).map((k, v) =>
                MapEntry<String, List<String>>(
                    k, List<String>.from(v.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
      };
}
