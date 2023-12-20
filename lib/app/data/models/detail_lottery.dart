// To parse this JSON data, do
//
//     final detailLottery = detailLotteryFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

DetailLottery detailLotteryFromJson(String str) =>
    DetailLottery.fromJson(json.decode(str));

String detailLotteryToJson(DetailLottery data) => json.encode(data.toJson());

List<DetailLottery> listDetailLotteryFromJson(String str) =>
    List<DetailLottery>.from(
        json.decode(str).map((x) => DetailLottery.fromJson(x)));

String listDetailLotteryToJson(List<DetailLottery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailLottery extends Equatable {
  final String? docnum;
  final String? prefix;
  final String? couponNumber;

  const DetailLottery({
    this.docnum,
    this.prefix,
    this.couponNumber,
  });

  @override
  List<Object?> get props => [
        docnum,
        prefix,
        couponNumber,
      ];

  factory DetailLottery.fromJson(Map<String, dynamic> json) => DetailLottery(
        docnum: json["docnum"],
        prefix: json["Prefix"],
        couponNumber: json["coupon_number"],
      );

  Map<String, dynamic> toJson() => {
        "docnum": docnum,
        "Prefix": prefix,
        "coupon_number": couponNumber,
      };
}
