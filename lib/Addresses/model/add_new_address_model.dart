// To parse this JSON data, do
//
//     final addNewAddressModel = addNewAddressModelFromJson(jsonString);

import 'dart:convert';

AddNewAddressModel addNewAddressModelFromJson(String str) =>
    AddNewAddressModel.fromJson(json.decode(str));

String addNewAddressModelToJson(AddNewAddressModel data) =>
    json.encode(data.toJson());

class AddNewAddressModel {
  AddNewAddressModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory AddNewAddressModel.fromJson(Map<String, dynamic> json) =>
      AddNewAddressModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.city,
    this.area,
    this.street,
    this.buildingNumber,
    this.floorNumber,
    this.apartmentNumber,
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
  String? isDefault;
  String? latitude;
  String? longitude;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        city: json["city"],
        area: json["area"],
        street: json["street"],
        buildingNumber: json["building_number"],
        floorNumber: json["floor_number"],
        apartmentNumber: json["apartment_number"],
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
        "is_default": isDefault,
        "latitude": latitude,
        "longitude": longitude,
      };
}
