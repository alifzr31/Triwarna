// To parse this JSON data, do
//
//     final detailShoppingHistory = detailShoppingHistoryFromJson(jsonString);

import 'dart:convert';

DetailShoppingHistory detailShoppingHistoryFromJson(String str) =>
    DetailShoppingHistory.fromJson(json.decode(str));

String detailShoppingHistoryToJson(DetailShoppingHistory data) =>
    json.encode(data.toJson());

List<DetailShoppingHistory> listDetailShoppingHistoryFromJson(String str) =>
    List<DetailShoppingHistory>.from(
        json.decode(str).map((x) => DetailShoppingHistory.fromJson(x)));

String listDetailShoppingHistoryToJson(List<DetailShoppingHistory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailShoppingHistory {
  String? itemCode;
  String? dscription;
  String? qty;
  String? harga;
  String? subTotal;

  DetailShoppingHistory({
    this.itemCode,
    this.dscription,
    this.qty,
    this.harga,
    this.subTotal,
  });

  factory DetailShoppingHistory.fromJson(Map<String, dynamic> json) =>
      DetailShoppingHistory(
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
