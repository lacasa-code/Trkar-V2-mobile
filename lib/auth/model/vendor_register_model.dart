// To parse this JSON data, do
//
//     final vendorRegisterModel = vendorRegisterModelFromJson(jsonString);

import 'dart:convert';

VendorRegisterModel vendorRegisterModelFromJson(String str) =>
    VendorRegisterModel.fromJson(json.decode(str));

String vendorRegisterModelToJson(VendorRegisterModel data) =>
    json.encode(data.toJson());

class VendorRegisterModel {
  VendorRegisterModel({
    this.statusCode,
    this.message,
    this.data,
  });

  int? statusCode;
  String? message;
  Data? data;

  factory VendorRegisterModel.fromJson(Map<String, dynamic> json) =>
      VendorRegisterModel(
        statusCode: json["status_code"],
        message: json["message"],
        data: Data.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.lastName,
    this.phoneNo,
    this.birthdate,
    this.gender,
    this.token,
    this.createdAt,
    this.roles,
    this.vendorDetails,
  });

  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic lastName;
  dynamic phoneNo;
  dynamic birthdate;
  dynamic gender;
  String? token;
  DateTime? createdAt;
  List<Role>? roles;
  VendorDetails? vendorDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        lastName: json["last_name"],
        phoneNo: json["phone_no"],
        birthdate: json["birthdate"],
        gender: json["gender"],
        token: json["token"],
        createdAt: DateTime.parse(json["created_at"] ?? ''),
        roles: json["roles"] == null
            ? []
            : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        vendorDetails: VendorDetails.fromJson(json["vendor_details"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "last_name": lastName,
        "phone_no": phoneNo,
        "birthdate": birthdate,
        "gender": gender,
        "token": token,
        "created_at": createdAt?.toIso8601String(),
        "roles": roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
        "vendor_details": vendorDetails?.toJson(),
      };
}

class Role {
  Role({
    this.id,
    this.title,
    this.createdAt,
  });

  int? id;
  String? title;
  DateTime? createdAt;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        title: json["title"],
        createdAt: DateTime.parse(json["created_at"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created_at": createdAt?.toIso8601String(),
      };
}

class VendorDetails {
  VendorDetails({
    this.email,
    this.lang,
    this.commercialNo,
    this.taxCardNo,
    this.commercialDoc,
    this.taxCardDoc,
    this.bankAccount,
    this.vendorName,
    this.useridId,
    this.type,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.images,
    this.commercialDocs,
    this.taxCardDocs,
    this.wholesaleDocs,
    this.bankDocs,
    this.vendorStatus,
    this.media,
  });

  String? email;
  String? lang;
  dynamic commercialNo;
  dynamic taxCardNo;
  dynamic commercialDoc;
  dynamic taxCardDoc;
  dynamic bankAccount;
  String? vendorName;
  int? useridId;
  int? type;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  dynamic images;
  dynamic commercialDocs;
  dynamic taxCardDocs;
  dynamic wholesaleDocs;
  dynamic bankDocs;
  String? vendorStatus;
  List<dynamic>? media;

  factory VendorDetails.fromJson(Map<String, dynamic> json) => VendorDetails(
        email: json["email"],
        lang: json["lang"],
        commercialNo: json["commercial_no"],
        taxCardNo: json["tax_card_no"],
        commercialDoc: json["commercial_doc"],
        taxCardDoc: json["tax_card_doc"],
        bankAccount: json["bank_account"],
        vendorName: json["vendor_name"],
        useridId: json["userid_id"],
        type: json["type"],
        updatedAt: DateTime.parse(json["updated_at"] ?? ''),
        createdAt: DateTime.parse(json["created_at"] ?? ''),
        id: json["id"],
        images: json["images"],
        commercialDocs: json["commercialDocs"],
        taxCardDocs: json["taxCardDocs"],
        wholesaleDocs: json["wholesaleDocs"],
        bankDocs: json["bankDocs"],
        vendorStatus: json["vendorStatus"],
        media: json["media"] == null
            ? []
            : List<dynamic>.from(json["media"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "lang": lang,
        "commercial_no": commercialNo,
        "tax_card_no": taxCardNo,
        "commercial_doc": commercialDoc,
        "tax_card_doc": taxCardDoc,
        "bank_account": bankAccount,
        "vendor_name": vendorName,
        "userid_id": useridId,
        "type": type,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "images": images,
        "commercialDocs": commercialDocs,
        "taxCardDocs": taxCardDocs,
        "wholesaleDocs": wholesaleDocs,
        "bankDocs": bankDocs,
        "vendorStatus": vendorStatus,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
      };
}
