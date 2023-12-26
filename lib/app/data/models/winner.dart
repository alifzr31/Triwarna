// To parse this JSON data, do
//
//     final winner = winnerFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Winner winnerFromJson(String str) => Winner.fromJson(json.decode(str));

String winnerToJson(Winner data) => json.encode(data.toJson());

List<Winner> listWinnerFromJson(String str) =>
    List<Winner>.from(json.decode(str).map((x) => Winner.fromJson(x)));

String listWinnerToJson(List<Winner> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Winner extends Equatable {
  final String? prizeName;
  final String? prizeImage;
  final List<MemberWinner>? memberWinner;

  const Winner({
    this.prizeName,
    this.prizeImage,
    this.memberWinner,
  });

  @override
  List<Object?> get props => [
        prizeName,
        prizeImage,
        memberWinner,
      ];

  factory Winner.fromJson(Map<String, dynamic> json) => Winner(
        prizeName: json["prize_name"],
        prizeImage: json["prize_image"],
        memberWinner: json["member_winner"] == null
            ? []
            : List<MemberWinner>.from(
                json["member_winner"]!.map((x) => MemberWinner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "prize_name": prizeName,
        "prize_image": prizeImage,
        "member_winner": memberWinner == null
            ? []
            : List<dynamic>.from(memberWinner!.map((x) => x.toJson())),
      };
}

class MemberWinner extends Equatable {
  final String? couponNumber;
  final String? memberNo;
  final String? memberName;
  final String? branch;

  const MemberWinner({
    this.couponNumber,
    this.memberNo,
    this.memberName,
    this.branch,
  });

  @override
  List<Object?> get props => [
        couponNumber,
        memberNo,
        memberName,
        branch,
      ];

  factory MemberWinner.fromJson(Map<String, dynamic> json) => MemberWinner(
        couponNumber: json["coupon_number"],
        memberNo: json["member_no"],
        memberName: json["member_name"],
        branch: json["branch"],
      );

  Map<String, dynamic> toJson() => {
        "coupon_number": couponNumber,
        "member_no": memberNo,
        "member_name": memberName,
        "branch": branch,
      };
}
