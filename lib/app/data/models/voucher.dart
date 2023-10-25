// To parse this JSON data, do
//
//     final voucher = voucherFromJson(jsonString);

import 'dart:convert';

Voucher voucherFromJson(String str) => Voucher.fromJson(json.decode(str));

String voucherToJson(Voucher data) => json.encode(data.toJson());

List<Voucher> listVoucherFromJson(String str) =>
    List<Voucher>.from(json.decode(str).map((x) => Voucher.fromJson(x)));

String listVoucherToJson(List<Voucher> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Voucher {
  String? code;
  String? uKodeHadiah;
  String? serialNumber;
  String? qrcode;
  StatusHadiah? statusHadiah;
  Hadiah? hadiah;

  Voucher({
    this.code,
    this.uKodeHadiah,
    this.serialNumber,
    this.qrcode,
    this.statusHadiah,
    this.hadiah,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        code: json["Code"],
        uKodeHadiah: json["U_kode_hadiah"],
        serialNumber: json["serial_number"],
        qrcode: json["qrcode"],
        statusHadiah: json["status_hadiah"] == null
            ? null
            : StatusHadiah.fromJson(json["status_hadiah"]),
        hadiah: json["hadiah"] == null ? null : Hadiah.fromJson(json["hadiah"]),
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "U_kode_hadiah": uKodeHadiah,
        "serial_number": serialNumber,
        "qrcode": qrcode,
        "status_hadiah": statusHadiah?.toJson(),
        "hadiah": hadiah?.toJson(),
      };
}

class Hadiah {
  int? kodeBarang;
  String? namaBarang;
  String? deskripsiBarang;

  Hadiah({
    this.kodeBarang,
    this.namaBarang,
    this.deskripsiBarang,
  });

  factory Hadiah.fromJson(Map<String, dynamic> json) => Hadiah(
        kodeBarang: json["kode_barang"],
        namaBarang: json["nama_barang"],
        deskripsiBarang: json["deskripsi_barang"],
      );

  Map<String, dynamic> toJson() => {
        "kode_barang": kodeBarang,
        "nama_barang": namaBarang,
        "deskripsi_barang": deskripsiBarang,
      };
}

class StatusHadiah {
  String? noKupon;
  String? status;

  StatusHadiah({
    this.noKupon,
    this.status,
  });

  factory StatusHadiah.fromJson(Map<String, dynamic> json) => StatusHadiah(
        noKupon: json["no_kupon"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "no_kupon": noKupon,
        "status": status,
      };
}
