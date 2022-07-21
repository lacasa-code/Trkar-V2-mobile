// To parse this JSON data, do
//
//     final addQuantityToBranchModel = addQuantityToBranchModelFromJson(jsonString);

import 'dart:convert';

AddQuantityToBranchModel addQuantityToBranchModelFromJson(String str) =>
    AddQuantityToBranchModel.fromJson(json.decode(str));

String addQuantityToBranchModelToJson(AddQuantityToBranchModel data) =>
    json.encode(data.toJson());

class AddQuantityToBranchModel {
  AddQuantityToBranchModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  QuantityData? data;

  factory AddQuantityToBranchModel.fromJson(Map<String, dynamic> json) =>
      AddQuantityToBranchModel(
        status: json["status"],
        message: json["message"].runtimeType == String ? json["message"] : null,
        code: json["code"],
        data: json["data"] == null ? null : QuantityData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class QuantityData {
  QuantityData({
    this.quantity,
    this.quantityReminder,
    this.branchId,
    this.productId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? quantity;
  String? quantityReminder;
  String? branchId;
  String? productId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory QuantityData.fromJson(Map<String, dynamic> json) => QuantityData(
        quantity: json["quantity"],
        quantityReminder: json["quantity_reminder"],
        branchId: json["branch_id"],
        productId: json["product_id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "quantity_reminder": quantityReminder,
        "branch_id": branchId,
        "product_id": productId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
