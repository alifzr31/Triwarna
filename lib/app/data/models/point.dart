// To parse this JSON data, do
//
//     final point = pointFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Point pointFromJson(String str) => Point.fromJson(json.decode(str));

String pointToJson(Point data) => json.encode(data.toJson());

List<Point> listPointFromJson(String str) =>
    List<Point>.from(json.decode(str).map((x) => Point.fromJson(x)));

String listPointToJson(List<Point> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Point extends Equatable {
  final String? no;
  final String? code;
  final String? name;
  final DateTime? transactionDate;
  final String? pointBefore;
  final String? addSubAmount;
  final String? remainingPoint;
  final String? info;
  final String? pointUsedGained;

  const Point({
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

  @override
  List<Object?> get props => [
        no,
        code,
        name,
        transactionDate,
        pointBefore,
        addSubAmount,
        remainingPoint,
        info,
        pointUsedGained,
      ];

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
