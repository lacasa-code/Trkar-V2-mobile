// To parse this JSON data, do
//
//     final createProductModel = createProductModelFromJson(jsonString);

import 'dart:convert';

CreateProductModel createProductModelFromJson(String str) =>
    CreateProductModel.fromJson(json.decode(str));

String createProductModelToJson(CreateProductModel data) =>
    json.encode(data.toJson());

class CreateProductModel {
  CreateProductModel({
    this.status,
    this.message,
    this.code,
    this.data,
    this.errorMessages,
  });

  bool? status;
  String? message;
  Map<String, List<String>>? errorMessages;
  int? code;
  Data? data;

  factory CreateProductModel.fromJson(Map<String, dynamic> json) =>
      CreateProductModel(
        status: json["status"],
        message: json["message"].runtimeType == String ? json["message"] : null,
        code: json["code"],
        errorMessages:
            json["message"].runtimeType != String && json["message"] != null
                ? Map.from(json["message"]).map((k, v) =>
                    MapEntry<String, List<String>>(
                        k, List<String>.from(v.map((x) => x))))
                : null,
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.productTypeId,
    this.nameEn,
    this.nameAr,
    this.slug,
    this.detailsAr,
    this.detailsEn,
    this.price,
    this.actualPrice,
    this.discount,
    this.serialNumber,
    this.uuid,
    this.image,
    this.categoryId,
    this.subcategoryId,
    this.carMadeId,
    this.carModelId,
    this.carEngineId,
    this.yearId,
    this.manufacturerId,
    this.originalCountryId,
    this.storeId,
    this.approved,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? productTypeId;
  String? nameEn;
  String? nameAr;
  String? slug;
  String? detailsAr;
  String? detailsEn;
  String? price;
  String? actualPrice;
  String? discount;
  String? serialNumber;
  String? uuid;
  String? image;
  String? categoryId;
  String? subcategoryId;
  String? carMadeId;
  String? carModelId;
  String? carEngineId;
  String? yearId;
  String? manufacturerId;
  String? originalCountryId;
  String? storeId;
  String? approved;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        productTypeId: json["product_type_id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        slug: json["slug"],
        detailsAr: json["details_ar"],
        detailsEn: json["details_en"],
        price: json["price"].toString(),
        actualPrice: json["actual_price"],
        discount: json["discount"],
        serialNumber: json["serial_number"],
        uuid: json["uuid"],
        image: json["image"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        carMadeId: json["car_made_id"],
        carModelId: json["car_model_id"],
        carEngineId: json["car_engine_id"],
        yearId: json["year_id"],
        manufacturerId: json["manufacturer_id"],
        originalCountryId: json["original_country_id"],
        storeId: json["store_id"],
        approved: json["approved"].toString(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "product_type_id": productTypeId,
        "name_en": nameEn,
        "name_ar": nameAr,
        "slug": slug,
        "details_ar": detailsAr,
        "details_en": detailsEn,
        "price": price,
        "actual_price": actualPrice,
        "discount": discount,
        "serial_number": serialNumber,
        "uuid": uuid,
        "image": image,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "car_made_id": carMadeId,
        "car_model_id": carModelId,
        "car_engine_id": carEngineId,
        "year_id": yearId,
        "manufacturer_id": manufacturerId,
        "original_country_id": originalCountryId,
        "store_id": storeId,
        "approved": approved,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
