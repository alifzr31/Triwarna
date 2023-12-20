// To parse this JSON data, do
//
//     final shoppingHistory = shoppingHistoryFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ShoppingHistory shoppingHistoryFromJson(String str) =>
    ShoppingHistory.fromJson(json.decode(str));

String shoppingHistoryToJson(ShoppingHistory data) =>
    json.encode(data.toJson());

List<ShoppingHistory> listShoppingHistoryFromJson(String str) =>
    List<ShoppingHistory>.from(
        json.decode(str).map((x) => ShoppingHistory.fromJson(x)));

String listShoppingHistoryToJson(List<ShoppingHistory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShoppingHistory extends Equatable {
  final String? docnum;
  final String? noStruk;
  final DateTime? date;
  final String? total;
  final String? noMember;
  final String? transactionHour;
  final String? totalItem;

  const ShoppingHistory({
    this.docnum,
    this.noStruk,
    this.date,
    this.total,
    this.noMember,
    this.transactionHour,
    this.totalItem,
  });

  @override
  List<Object?> get props => [
        docnum,
        noStruk,
        date,
        total,
        noMember,
        transactionHour,
        totalItem,
      ];

  factory ShoppingHistory.fromJson(Map<String, dynamic> json) =>
      ShoppingHistory(
        docnum: json["docnum"],
        noStruk: json["no_struk"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        total: json["total"],
        noMember: json["no_member"],
        transactionHour: json["transaction_hour"],
        totalItem: json["total_item"],
      );

  Map<String, dynamic> toJson() => {
        "docnum": docnum,
        "no_struk": noStruk,
        "date": date?.toIso8601String(),
        "total": total,
        "no_member": noMember,
        "transaction_hour": transactionHour,
        "total_item": totalItem,
      };
}
