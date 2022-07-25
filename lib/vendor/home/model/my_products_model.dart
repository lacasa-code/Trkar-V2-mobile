// To parse this JSON data, do
//
//     final myProductsModel = myProductsModelFromJson(jsonString);

import 'dart:convert';

MyProductsModel myProductsModelFromJson(String str) =>
    MyProductsModel.fromJson(json.decode(str));

String myProductsModelToJson(MyProductsModel data) =>
    json.encode(data.toJson());

class MyProductsModel {
  MyProductsModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  List<Product>? data;

  factory MyProductsModel.fromJson(Map<String, dynamic> json) =>
      MyProductsModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.uuid,
    this.slug,
    this.productTypeId,
    this.serialNumber,
    this.nameEn,
    this.nameAr,
    this.detailsEn,
    this.detailsAr,
    this.price,
    this.actualPrice,
    this.image,
    this.categoryId,
    this.carMadeId,
    this.yearId,
    this.manufacturerId,
    this.originalCountryId,
    this.storeId,
    this.approved,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.carModelId,
    this.carEngineId,
    this.subcategoryId,
    this.status,
    this.discount,
  });

  int? id;
  String? uuid;
  String? slug;
  String? productTypeId;
  String? serialNumber;
  String? nameEn;
  String? nameAr;
  String? detailsEn;
  String? detailsAr;
  String? price;
  String? actualPrice;
  String? image;
  String? categoryId;
  String? carMadeId;
  String? yearId;
  String? manufacturerId;
  String? originalCountryId;
  String? storeId;
  String? approved;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? carModelId;
  String? carEngineId;
  String? subcategoryId;
  String? status;
  String? discount;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        uuid: json["uuid"],
        slug: json["slug"],
        productTypeId: json["product_type_id"],
        serialNumber: json["serial_number"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        detailsEn: json["details_en"],
        detailsAr: json["details_ar"],
        price: json["price"],
        actualPrice: json["actual_price"],
        image: json["image"],
        categoryId: json["category_id"],
        carMadeId: json["car_made_id"],
        yearId: json["year_id"],
        manufacturerId: json["manufacturer_id"],
        originalCountryId: json["original_country_id"],
        storeId: json["store_id"],
        approved: json["approved"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        carModelId: json["car_model_id"],
        carEngineId: json["car_engine_id"],
        subcategoryId: json["subcategory_id"],
        status: json["status"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "slug": slug,
        "product_type_id": productTypeId,
        "serial_number": serialNumber,
        "name_en": nameEn,
        "name_ar": nameAr,
        "details_en": detailsEn,
        "details_ar": detailsAr,
        "price": price,
        "actual_price": actualPrice,
        "image": image,
        "category_id": categoryId,
        "car_made_id": carMadeId,
        "year_id": yearId,
        "manufacturer_id": manufacturerId,
        "original_country_id": originalCountryId,
        "store_id": storeId,
        "approved": approved,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "car_model_id": carModelId,
        "car_engine_id": carEngineId,
        "subcategory_id": subcategoryId,
        "status": status,
        "discount": discount,
      };
}
