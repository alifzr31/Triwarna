// To parse this JSON data, do
//
//     final tracking = trackingFromJson(jsonString);

import 'dart:convert';

Tracking trackingFromJson(String str) => Tracking.fromJson(json.decode(str));

String trackingToJson(Tracking data) => json.encode(data.toJson());

List<Tracking> listTrackingFromJson(String str) =>
    List<Tracking>.from(json.decode(str).map((x) => Tracking.fromJson(x)));

String listTrackingToJson(List<Tracking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tracking {
  String? code;
  String? serialNumber;
  DateTime? createDate;
  DateTime? validationDate;
  String? length;
  List<StatusHadiahDetail>? statusHadiahDetail;
  Receipt? receipt;
  Hadiah? hadiah;

  Tracking({
    this.code,
    this.serialNumber,
    this.createDate,
    this.validationDate,
    this.length,
    this.statusHadiahDetail,
    this.receipt,
    this.hadiah,
  });

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

class StatusHadiahDetail {
  String? noKupon;
  String? status;
  DateTime? date;
  String? process;

  StatusHadiahDetail({
    this.noKupon,
    this.status,
    this.date,
    this.process,
  });

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

class Receipt {
  String? noKupon;
  String? image;
  String? signature;

  Receipt({
    this.noKupon,
    this.image,
    this.signature,
  });

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

class Hadiah {
  int? kodeBarang;
  String? namaBarang;
  String? deskripsiBarang;
  String? harga;
  String? poin;
  String? gambar;

  Hadiah({
    this.kodeBarang,
    this.namaBarang,
    this.deskripsiBarang,
    this.harga,
    this.poin,
    this.gambar,
  });

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
