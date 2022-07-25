// To parse this JSON data, do
//
//     final getProductBranchesQuantityModel = getProductBranchesQuantityModelFromJson(jsonString);

import 'dart:convert';

GetProductBranchesQuantityModel getProductBranchesQuantityModelFromJson(
        String str) =>
    GetProductBranchesQuantityModel.fromJson(json.decode(str));

String getProductBranchesQuantityModelToJson(
        GetProductBranchesQuantityModel data) =>
    json.encode(data.toJson());

class GetProductBranchesQuantityModel {
  GetProductBranchesQuantityModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Quantity>? data;

  factory GetProductBranchesQuantityModel.fromJson(Map<String, dynamic> json) =>
      GetProductBranchesQuantityModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Quantity>.from(
                json["data"].map((x) => Quantity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Quantity {
  Quantity({
    this.id,
    this.quantity,
    this.quantityReminder,
    this.productId,
    this.branchId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? quantity;
  String? quantityReminder;
  String? productId;
  String? branchId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        id: json["id"],
        quantity: json["quantity"],
        quantityReminder: json["quantity_reminder"],
        productId: json["product_id"],
        branchId: json["branch_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "quantity_reminder": quantityReminder,
        "product_id": productId,
        "branch_id": branchId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
