// To parse this JSON data, do
//
//     final shoppingDetail = shoppingDetailFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ShoppingDetail shoppingDetailFromJson(String str) =>
    ShoppingDetail.fromJson(json.decode(str));

String shoppingDetailToJson(ShoppingDetail data) => json.encode(data.toJson());

List<ShoppingDetail> listShoppingDetailFromJson(String str) =>
    List<ShoppingDetail>.from(
        json.decode(str).map((x) => ShoppingDetail.fromJson(x)));

String listShoppingDetailToJson(List<ShoppingDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShoppingDetail extends Equatable {
  final String? itemCode;
  final String? dscription;
  final String? qty;
  final String? harga;
  final String? subTotal;

  const ShoppingDetail({
    this.itemCode,
    this.dscription,
    this.qty,
    this.harga,
    this.subTotal,
  });

  @override
  List<Object?> get props => [
        itemCode,
        dscription,
        qty,
        harga,
        subTotal,
      ];

  factory ShoppingDetail.fromJson(Map<String, dynamic> json) => ShoppingDetail(
        itemCode: json["ItemCode"],
        dscription: json["Dscription"],
        qty: json["Qty"],
        harga: json["Harga"],
        subTotal: json["SubTotal"],
      );

  Map<String, dynamic> toJson() => {
        "ItemCode": itemCode,
        "Dscription": dscription,
        "Qty": qty,
        "Harga": harga,
        "SubTotal": subTotal,
      };
}
