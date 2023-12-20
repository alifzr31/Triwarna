// To parse this JSON data, do
//
//     final kelurahan = kelurahanFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Kelurahan kelurahanFromJson(String str) => Kelurahan.fromJson(json.decode(str));

String kelurahanToJson(Kelurahan data) => json.encode(data.toJson());

List<Kelurahan> listKelurahanFromJson(String str) =>
    List<Kelurahan>.from(json.decode(str).map((x) => Kelurahan.fromJson(x)));

String listKelurahanToJson(List<Kelurahan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kelurahan extends Equatable {
  final String? kdKelurahan;
  final String? namaKelurahan;
  final String? namaKecamatan;

  const Kelurahan({
    this.kdKelurahan,
    this.namaKelurahan,
    this.namaKecamatan,
  });

  @override
  List<Object?> get props => [
        kdKelurahan,
        namaKelurahan,
        namaKecamatan,
      ];

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
