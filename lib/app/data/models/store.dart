// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

Store storeFromJson(String str) => Store.fromJson(json.decode(str));

String storeToJson(Store data) => json.encode(data.toJson());

List<Store> listStoreFromJson(String str) =>
    List<Store>.from(json.decode(str).map((x) => Store.fromJson(x)));

String listStoreToJson(List<Store> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Store {
  int? id;
  String? storeName;
  String? address;
  String? phone;
  String? lat;
  String? long;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? storeCode;
  String? distance;

  Store({
    this.id,
    this.storeName,
    this.address,
    this.phone,
    this.lat,
    this.long,
    this.createdAt,
    this.updatedAt,
    this.storeCode,
    this.distance,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        storeName: json["store_name"],
        address: json["address"],
        phone: json["phone"],
        lat: json["lat"],
        long: json["long"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        storeCode: json["store_code"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_name": storeName,
        "address": address,
        "phone": phone,
        "lat": lat,
        "long": long,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "store_code": storeCode,
        "distance": distance,
      };
}
