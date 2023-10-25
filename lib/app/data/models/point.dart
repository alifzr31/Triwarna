// To parse this JSON data, do
//
//     final point = pointFromJson(jsonString);

import 'dart:convert';

Point pointFromJson(String str) => Point.fromJson(json.decode(str));

String pointToJson(Point data) => json.encode(data.toJson());

List<Point> listPointFromJson(String str) =>
    List<Point>.from(json.decode(str).map((x) => Point.fromJson(x)));

String listPointToJson(List<Point> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Point {
  String? no;
  String? code;
  String? name;
  DateTime? transactionDate;
  String? pointBefore;
  String? addSubAmount;
  String? remainingPoint;
  String? info;
  String? pointUsedGained;

  Point({
    this.no,
    this.code,
    this.name,
    this.transactionDate,
    this.pointBefore,
    this.addSubAmount,
    this.remainingPoint,
    this.info,
    this.pointUsedGained,
  });

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        no: json["No"],
        code: json["code"],
        name: json["name"],
        transactionDate: json["transaction_date"] == null
            ? null
            : DateTime.parse(json["transaction_date"]),
        pointBefore: json["point_before"],
        addSubAmount: json["add/sub_amount"],
        remainingPoint: json["remaining_point"],
        info: json["info"],
        pointUsedGained: json["point_used/gained"],
      );

  Map<String, dynamic> toJson() => {
        "No": no,
        "code": code,
        "name": name,
        "transaction_date": transactionDate?.toIso8601String(),
        "point_before": pointBefore,
        "add/sub_amount": addSubAmount,
        "remaining_point": remainingPoint,
        "info": info,
        "point_used/gained": pointUsedGained,
      };
}
