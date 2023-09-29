// To parse this JSON data, do
//
//     final lottery = lotteryFromJson(jsonString);

import 'dart:convert';

Lottery lotteryFromJson(String str) => Lottery.fromJson(json.decode(str));

String lotteryToJson(Lottery data) => json.encode(data.toJson());

List<Lottery> listLotteryFromJson(String str) =>
    List<Lottery>.from(json.decode(str).map((x) => Lottery.fromJson(x)));

String listLotteryToJson(List<Lottery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lottery {
  String? noStruk;
  String? transactionNumber;
  DateTime? date;
  String? couponTotal;

  Lottery({
    this.noStruk,
    this.transactionNumber,
    this.date,
    this.couponTotal,
  });

  factory Lottery.fromJson(Map<String, dynamic> json) => Lottery(
        noStruk: json["no_struk"],
        transactionNumber: json["transaction_number"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        couponTotal: json["coupon_total"],
      );

  Map<String, dynamic> toJson() => {
        "no_struk": noStruk,
        "transaction_number": transactionNumber,
        "date": date?.toIso8601String(),
        "coupon_total": couponTotal,
      };
}
