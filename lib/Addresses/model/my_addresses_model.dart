// To parse this JSON data, do
//
//     final myAddressesModel = myAddressesModelFromJson(jsonString);

import 'dart:convert';

MyAddressesModel myAddressesModelFromJson(String str) =>
    MyAddressesModel.fromJson(json.decode(str));

String myAddressesModelToJson(MyAddressesModel data) =>
    json.encode(data.toJson());

class MyAddressesModel {
  MyAddressesModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Address>? data;

  factory MyAddressesModel.fromJson(Map<String, dynamic> json) =>
      MyAddressesModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Address>.from(json["data"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    this.id,
    this.city,
    this.area,
    this.street,
    this.buildingNumber,
    this.floorNumber,
    this.apartmentNumber,
    this.avenue,
    this.isDefault,
    this.latitude,
    this.longitude,
  });

  int? id;
  String? city;
  String? area;
  String? street;
  String? buildingNumber;
  String? floorNumber;
  String? apartmentNumber;
  String? avenue;
  String? isDefault;
  String? latitude;
  String? longitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        city: json["city"],
        area: json["area"],
        street: json["street"],
        buildingNumber: json["building_number"],
        floorNumber: json["floor_number"],
        apartmentNumber: json["apartment_number"],
        avenue: json["avenue"],
        isDefault: json["is_default"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "area": area,
        "street": street,
        "building_number": buildingNumber,
        "floor_number": floorNumber,
        "apartment_number": apartmentNumber,
        "avenue": avenue,
        "is_default": isDefault,
        "latitude": latitude,
        "longitude": longitude,
      };
}
