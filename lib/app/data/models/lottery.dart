// To parse this JSON data, do
//
//     final lottery = lotteryFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Lottery lotteryFromJson(String str) => Lottery.fromJson(json.decode(str));

String lotteryToJson(Lottery data) => json.encode(data.toJson());

List<Lottery> listLotteryFromJson(String str) =>
    List<Lottery>.from(json.decode(str).map((x) => Lottery.fromJson(x)));

String listLotteryToJson(List<Lottery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lottery extends Equatable {
  final String? docNum;
  final String? noStruk;
  final DateTime? tanggal;
  final String? total;
  final List<KuponDetail>? kuponDetail;

  const Lottery({
    this.docNum,
    this.noStruk,
    this.tanggal,
    this.total,
    this.kuponDetail,
  });

  @override
  List<Object?> get props => [
        docNum,
        noStruk,
        tanggal,
        total,
        kuponDetail,
      ];

  factory Lottery.fromJson(Map<String, dynamic> json) => Lottery(
        docNum: json["DocNum"],
        noStruk: json["no_struk"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        total: json["total"],
        kuponDetail: json["kupon_detail"] == null
            ? []
            : List<KuponDetail>.from(
                json["kupon_detail"]!.map((x) => KuponDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DocNum": docNum,
        "no_struk": noStruk,
        "tanggal": tanggal?.toIso8601String(),
        "total": total,
        "kupon_detail": kuponDetail == null
            ? []
            : List<dynamic>.from(kuponDetail!.map((x) => x.toJson())),
      };
}

class KuponDetail extends Equatable {
  final String? noTransaksi;
  final String? preFix;
  final String? noUndian;

  const KuponDetail({
    this.noTransaksi,
    this.preFix,
    this.noUndian,
  });

  @override
  List<Object?> get props => [
        noTransaksi,
        preFix,
        noUndian,
      ];

  factory KuponDetail.fromJson(Map<String, dynamic> json) => KuponDetail(
        noTransaksi: json["no_transaksi"],
        preFix: json["String"],
        noUndian: json["no_undian"],
      );

  Map<String, dynamic> toJson() => {
        "no_transaksi": noTransaksi,
        "PreFix": preFix,
        "no_undian": noUndian,
      };
}
