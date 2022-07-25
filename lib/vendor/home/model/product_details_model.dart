// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  ProductData? data;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? null : ProductData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class ProductData {
  ProductData({
    this.product,
    this.productAttributes,
    this.productImages,
    this.productTags,
    this.productWholesale,
    this.productCompatibleModels,
    this.productQuantity,
    this.productReviews,
    this.productQuestion,
    this.productViews,
  });

  List<Product>? product;
  List<dynamic>? productAttributes;
  List<ProductImageElement>? productImages;
  List<ProductImageElement>? productTags;
  List<dynamic>? productWholesale;
  List<ProductComptailbleModel>? productCompatibleModels;
  List<ProductQuantity>? productQuantity;
  List<dynamic>? productReviews;
  List<dynamic>? productQuestion;
  List<dynamic>? productViews;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        product: json["product"] == null
            ? null
            : List<Product>.from(
                json["product"].map((x) => Product.fromJson(x))),
        productAttributes: json["product attributes"] == null
            ? null
            : List<dynamic>.from(json["product attributes"].map((x) => x)),
        productImages: json["product images"] == null
            ? null
            : List<ProductImageElement>.from(json["product images"]
                .map((x) => ProductImageElement.fromJson(x))),
        productTags: json["product tags"] == null
            ? null
            : List<ProductImageElement>.from(json["product tags"]
                .map((x) => ProductImageElement.fromJson(x))),
        productWholesale: json["product wholesale"] == null
            ? null
            : List<dynamic>.from(json["product wholesale"].map((x) => x)),
        productCompatibleModels: json["product comptailble models"] == null
            ? null
            : List<ProductComptailbleModel>.from(
                json["product comptailble models"]
                    .map((x) => ProductComptailbleModel.fromJson(x))),
        productQuantity: json["product quantity"] == null
            ? null
            : List<ProductQuantity>.from(json["product quantity"]
                .map((x) => ProductQuantity.fromJson(x))),
        productReviews: json["product reviews"] == null
            ? null
            : List<dynamic>.from(json["product reviews"].map((x) => x)),
        productQuestion: json["product question"] == null
            ? null
            : List<dynamic>.from(json["product question"].map((x) => x)),
        productViews: json["product views"] == null
            ? null
            : List<dynamic>.from(json["product views"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product": product == null
            ? null
            : List<dynamic>.from(product!.map((x) => x.toJson())),
        "product attributes": productAttributes == null
            ? null
            : List<dynamic>.from(productAttributes!.map((x) => x)),
        "product images": productImages == null
            ? null
            : List<dynamic>.from(productImages!.map((x) => x.toJson())),
        "product tags": productTags == null
            ? null
            : List<dynamic>.from(productTags!.map((x) => x.toJson())),
        "product wholesale": productWholesale == null
            ? null
            : List<dynamic>.from(productWholesale!.map((x) => x)),
        "product comptailble models": productCompatibleModels == null
            ? null
            : List<dynamic>.from(
                productCompatibleModels!.map((x) => x.toJson())),
        "product quantity": productQuantity == null
            ? null
            : List<dynamic>.from(productQuantity!.map((x) => x.toJson())),
        "product reviews": productReviews == null
            ? null
            : List<dynamic>.from(productReviews!.map((x) => x)),
        "product question": productQuestion == null
            ? null
            : List<dynamic>.from(productQuestion!.map((x) => x)),
        "product views": productViews == null
            ? null
            : List<dynamic>.from(productViews!.map((x) => x)),
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
  dynamic carMadeId;
  String? yearId;
  String? manufacturerId;
  String? originalCountryId;
  String? storeId;
  String? approved;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic carModelId;
  dynamic carEngineId;
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

class ProductComptailbleModel {
  ProductComptailbleModel({
    this.id,
    this.productId,
    this.carModelId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.nameAr,
    this.nameEn,
    this.status,
    this.carMadeId,
  });

  int? id;
  String? productId;
  String? carModelId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? slug;
  String? nameAr;
  String? nameEn;
  String? status;
  String? carMadeId;

  factory ProductComptailbleModel.fromJson(Map<String, dynamic> json) =>
      ProductComptailbleModel(
        id: json["id"],
        productId: json["product_id"],
        carModelId: json["car_model_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        slug: json["slug"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        status: json["status"],
        carMadeId: json["car_made_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "car_model_id": carModelId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "slug": slug,
        "name_ar": nameAr,
        "name_en": nameEn,
        "status": status,
        "car_made_id": carMadeId,
      };
}

class ProductImageElement {
  ProductImageElement({
    this.id,
    this.image,
    this.productId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  int? id;
  String? image;
  String? productId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;

  factory ProductImageElement.fromJson(Map<String, dynamic> json) =>
      ProductImageElement(
        id: json["id"],
        image: json["image"],
        productId: json["product_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "product_id": productId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "name": name,
      };
}

class ProductQuantity {
  ProductQuantity({
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

  factory ProductQuantity.fromJson(Map<String, dynamic> json) =>
      ProductQuantity(
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
