// To parse this JSON data, do
//
//     final tracking = trackingFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Tracking trackingFromJson(String str) => Tracking.fromJson(json.decode(str));

String trackingToJson(Tracking data) => json.encode(data.toJson());

List<Tracking> listTrackingFromJson(String str) =>
    List<Tracking>.from(json.decode(str).map((x) => Tracking.fromJson(x)));

String listTrackingToJson(List<Tracking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tracking extends Equatable {
  final String? code;
  final String? serialNumber;
  final DateTime? createDate;
  final DateTime? validationDate;
  final String? length;
  final List<StatusHadiahDetail>? statusHadiahDetail;
  final Receipt? receipt;
  final Hadiah? hadiah;

  const Tracking({
    this.code,
    this.serialNumber,
    this.createDate,
    this.validationDate,
    this.length,
    this.statusHadiahDetail,
    this.receipt,
    this.hadiah,
  });

  @override
  List<Object?> get props => [
        code,
        serialNumber,
        createDate,
        validationDate,
        length,
        statusHadiahDetail,
        receipt,
        hadiah,
      ];

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
        code: json["Code"],
        serialNumber: json["serial_number"],
        createDate: json["create_date"] == null
            ? null
            : DateTime.parse(json["create_date"]),
        validationDate: json["validation_date"] == null
            ? null
            : DateTime.parse(json["validation_date"]),
        length: json["length"],
        statusHadiahDetail: json["status_hadiah_detail"] == null
            ? []
            : List<StatusHadiahDetail>.from(json["status_hadiah_detail"]!
                .map((x) => StatusHadiahDetail.fromJson(x))),
        receipt:
            json["receipt"] == null ? null : Receipt.fromJson(json["receipt"]),
        hadiah: json["hadiah"] == null ? null : Hadiah.fromJson(json["hadiah"]),
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "serial_number": serialNumber,
        "create_date": createDate?.toIso8601String(),
        "validation_date": validationDate?.toIso8601String(),
        "length": length,
        "status_hadiah_detail": statusHadiahDetail == null
            ? []
            : List<dynamic>.from(statusHadiahDetail!.map((x) => x.toJson())),
        "receipt": receipt?.toJson(),
        "hadiah": hadiah?.toJson(),
      };
}

class StatusHadiahDetail extends Equatable {
  final String? noKupon;
  final String? status;
  final DateTime? date;
  final String? process;

  const StatusHadiahDetail({
    this.noKupon,
    this.status,
    this.date,
    this.process,
  });

  @override
  List<Object?> get props => [
        noKupon,
        status,
        date,
        process,
      ];

  factory StatusHadiahDetail.fromJson(Map<String, dynamic> json) =>
      StatusHadiahDetail(
        noKupon: json["no_kupon"],
        status: json["status"],
        date: json["DATE"] == null ? null : DateTime.parse(json["DATE"]),
        process: json["process"],
      );

  Map<String, dynamic> toJson() => {
        "no_kupon": noKupon,
        "status": status,
        "DATE":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "process": process,
      };
}

class Receipt extends Equatable {
  final String? noKupon;
  final String? image;
  final String? signature;

  const Receipt({
    this.noKupon,
    this.image,
    this.signature,
  });

  @override
  List<Object?> get props => [
        noKupon,
        image,
        signature,
      ];

  factory Receipt.fromJson(Map<String, dynamic> json) => Receipt(
        noKupon: json["no_kupon"],
        image: json["image"],
        signature: json["signature"],
      );

  Map<String, dynamic> toJson() => {
        "no_kupon": noKupon,
        "image": image,
        "signature": signature,
      };
}

class Hadiah extends Equatable {
  final int? kodeBarang;
  final String? namaBarang;
  final String? deskripsiBarang;
  final String? harga;
  final String? poin;
  final String? gambar;

  const Hadiah({
    this.kodeBarang,
    this.namaBarang,
    this.deskripsiBarang,
    this.harga,
    this.poin,
    this.gambar,
  });

  @override
  List<Object?> get props => [
        kodeBarang,
        namaBarang,
        deskripsiBarang,
        harga,
        poin,
        gambar,
      ];

  factory Hadiah.fromJson(Map<String, dynamic> json) => Hadiah(
        kodeBarang: json["kode_barang"],
        namaBarang: json["nama_barang"],
        deskripsiBarang: json["deskripsi_barang"],
        harga: json["harga"],
        poin: json["poin"],
        gambar: json["gambar"],
      );

  Map<String, dynamic> toJson() => {
        "kode_barang": kodeBarang,
        "nama_barang": namaBarang,
        "deskripsi_barang": deskripsiBarang,
        "harga": harga,
        "poin": poin,
        "gambar": gambar,
      };
}
