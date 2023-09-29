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
  String? couponNumber;
  DateTime? createDate;
  DateTime? validationDate;
  DateTime? date;
  String? status;
  String? process;

  Tracking({
    this.couponNumber,
    this.createDate,
    this.validationDate,
    this.date,
    this.status,
    this.process,
  });

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
        couponNumber: json["coupon_number"],
        createDate: json["create_date"] == null
            ? null
            : DateTime.parse(json["create_date"]),
        validationDate: json["validation_date"] == null
            ? null
            : DateTime.parse(json["validation_date"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
        process: json["process"],
      );

  Map<String, dynamic> toJson() => {
        "coupon_number": couponNumber,
        "create_date": createDate?.toIso8601String(),
        "validation_date": validationDate?.toIso8601String(),
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "status": status,
        "process": process,
      };
}
