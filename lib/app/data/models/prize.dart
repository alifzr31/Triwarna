// To parse this JSON data, do
//
//     final prize = prizeFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Prize prizeFromJson(String str) => Prize.fromJson(json.decode(str));

String prizeToJson(Prize data) => json.encode(data.toJson());

List<Prize> listPrizeFromJson(String str) =>
    List<Prize>.from(json.decode(str).map((x) => Prize.fromJson(x)));

String listPrizeToJson(List<Prize> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prize extends Equatable {
  final String? prizeCode;
  final String? prizeName;
  final String? prizeDesc;
  final String? point;
  final String? image;

  const Prize({
    this.prizeCode,
    this.prizeName,
    this.prizeDesc,
    this.point,
    this.image,
  });

  @override
  List<Object?> get props => [
        prizeCode,
        prizeName,
        prizeDesc,
        point,
        image,
      ];

  factory Prize.fromJson(Map<String, dynamic> json) => Prize(
        prizeCode: json["prize_code"],
        prizeName: json["prize_name"],
        prizeDesc: json["prize_desc"],
        point: json["point"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "prize_code": prizeCode,
        "prize_name": prizeName,
        "prize_desc": prizeDesc,
        "point": point,
        "image": image,
      };
}
