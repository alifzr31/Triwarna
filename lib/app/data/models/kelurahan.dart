// To parse this JSON data, do
//
//     final kelurahan = kelurahanFromJson(jsonString);

import 'dart:convert';

Kelurahan kelurahanFromJson(String str) => Kelurahan.fromJson(json.decode(str));

String kelurahanToJson(Kelurahan data) => json.encode(data.toJson());

List<Kelurahan> listKelurahanFromJson(String str) =>
    List<Kelurahan>.from(json.decode(str).map((x) => Kelurahan.fromJson(x)));

String listKelurahanToJson(List<Kelurahan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kelurahan {
  String? kdKelurahan;
  String? namaKelurahan;
  String? namaKecamatan;

  Kelurahan({
    this.kdKelurahan,
    this.namaKelurahan,
    this.namaKecamatan,
  });

  factory Kelurahan.fromJson(Map<String, dynamic> json) => Kelurahan(
        kdKelurahan: json["KdKelurahan"],
        namaKelurahan: json["NamaKelurahan"],
        namaKecamatan: json["NamaKecamatan"],
      );

  Map<String, dynamic> toJson() => {
        "KdKelurahan": kdKelurahan,
        "NamaKelurahan": namaKelurahan,
        "NamaKecamatan": namaKecamatan,
      };
}
