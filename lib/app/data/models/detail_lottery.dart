// To parse this JSON data, do
//
//     final detailLottery = detailLotteryFromJson(jsonString);

import 'dart:convert';

DetailLottery detailLotteryFromJson(String str) =>
    DetailLottery.fromJson(json.decode(str));

String detailLotteryToJson(DetailLottery data) => json.encode(data.toJson());

List<DetailLottery> listDetailLotteryFromJson(String str) =>
    List<DetailLottery>.from(json.decode(str).map((x) => DetailLottery.fromJson(x)));

String listDetailLotteryToJson(List<DetailLottery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailLottery {
  String? docnum;
  String? prefix;
  String? couponNumber;

  DetailLottery({
    this.docnum,
    this.prefix,
    this.couponNumber,
  });

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
