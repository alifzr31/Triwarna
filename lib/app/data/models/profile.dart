// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  String? noMember;
  String? codeName;
  String? loyalty;
  String? username;
  String? email;
  String? idType;
  String? idNumber;
  String? name;
  String? group;
  String? pin;
  String? gender;
  DateTime? birthDate;
  String? birthPlace;
  String? image;
  String? contact;
  String? religion;
  String? maritalStatus;
  String? job;
  dynamic villageId;
  String? address;
  dynamic village;
  String? district;
  String? city;
  String? province;
  String? postalCode;
  String? fullAddress;
  String? education;
  String? loyaltyPoint;
  DateTime? joinedDate;
  String? spendingTotal;
  String? statusActive;
  String? verifyStatus;
  DateTime? lastActivity;
  bool? complete;
  String? voucherTotal;

  Profile({
    this.noMember,
    this.codeName,
    this.loyalty,
    this.username,
    this.email,
    this.idType,
    this.idNumber,
    this.name,
    this.group,
    this.pin,
    this.gender,
    this.birthDate,
    this.birthPlace,
    this.image,
    this.contact,
    this.religion,
    this.maritalStatus,
    this.job,
    this.villageId,
    this.address,
    this.village,
    this.district,
    this.city,
    this.province,
    this.postalCode,
    this.fullAddress,
    this.education,
    this.loyaltyPoint,
    this.joinedDate,
    this.spendingTotal,
    this.statusActive,
    this.verifyStatus,
    this.lastActivity,
    this.complete,
    this.voucherTotal,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        noMember: json["no_member"],
        codeName: json["code_name"],
        loyalty: json["loyalty"],
        username: json["username"],
        email: json["email"],
        idType: json["id_type"],
        idNumber: json["id_number"],
        name: json["name"],
        group: json["group"],
        pin: json["pin"],
        gender: json["gender"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        birthPlace: json["birth_place"],
        image: json["image"],
        contact: json["contact"],
        religion: json["religion"],
        maritalStatus: json["marital_status"],
        job: json["job"],
        villageId: json["village_id"],
        address: json["address"],
        village: json["village"],
        district: json["district"],
        city: json["city"],
        province: json["province"],
        postalCode: json["postal_code"],
        fullAddress: json["full_address"],
        education: json["education"],
        loyaltyPoint: json["loyalty_point"],
        joinedDate: json["joined_date"] == null
            ? null
            : DateTime.parse(json["joined_date"]),
        spendingTotal: json["spending_total"],
        statusActive: json["status_active"],
        verifyStatus: json["verify_status"],
        lastActivity: json["last_activity"] == null
            ? null
            : DateTime.parse(json["last_activity"]),
        complete: json["complete"],
        voucherTotal: json["voucher_total"],
      );

  Map<String, dynamic> toJson() => {
        "no_member": noMember,
        "code_name": codeName,
        "loyalty": loyalty,
        "username": username,
        "email": email,
        "id_type": idType,
        "id_number": idNumber,
        "name": name,
        "group": group,
        "pin": pin,
        "gender": gender,
        "birth_date": birthDate?.toIso8601String(),
        "birth_place": birthPlace,
        "image": image,
        "contact": contact,
        "religion": religion,
        "marital_status": maritalStatus,
        "job": job,
        "village_id": villageId,
        "address": address,
        "village": village,
        "district": district,
        "city": city,
        "province": province,
        "postal_code": postalCode,
        "full_address": fullAddress,
        "education": education,
        "loyalty_point": loyaltyPoint,
        "joined_date": joinedDate?.toIso8601String(),
        "spending_total": spendingTotal,
        "status_active": statusActive,
        "verify_status": verifyStatus,
        "last_activity": lastActivity?.toIso8601String(),
        "complete": complete,
        "voucher_total": voucherTotal,
      };
}
