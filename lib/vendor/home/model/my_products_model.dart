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
  Data? data;

  factory MyProductsModel.fromJson(Map<String, dynamic> json) =>
      MyProductsModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : Data.fromJson(
                json["data"],
              ),
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
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Product>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? null
            : List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
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

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
