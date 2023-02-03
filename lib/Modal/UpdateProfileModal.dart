// To parse this JSON data, do
//
//     final updateProfile = updateProfileFromJson(jsonString);

import 'dart:convert';

UpdateProfileModalClass updateProfileFromJson(String str) => UpdateProfileModalClass.fromJson(json.decode(str));

String updateProfileToJson(UpdateProfileModalClass data) => json.encode(data.toJson());

class UpdateProfileModalClass {
  UpdateProfileModalClass({
    this.id,
    this.name,
    this.mobileNo,
    this.emailId,
    this.talukaId,
    this.villageId,
    this.modifiedBy,
    this.modifiedDate,
  });

  int? id;
  String? name;
  String? mobileNo;
  String? emailId;
  int? talukaId;
  int? villageId;
  int? modifiedBy;
  DateTime? modifiedDate;

  factory UpdateProfileModalClass.fromJson(Map<String, dynamic> json) => UpdateProfileModalClass(
    id: json["id"],
    name: json["name"],
    mobileNo: json["mobileNo"],
    emailId: json["emailId"],
    talukaId: json["talukaId"],
    villageId: json["villageId"],
    modifiedBy: json["modifiedBy"],
    modifiedDate: json["modifiedDate"] == null ? null : DateTime.parse(json["modifiedDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobileNo": mobileNo,
    "emailId": emailId,
    "talukaId": talukaId,
    "villageId": villageId,
    "modifiedBy": modifiedBy,
    "modifiedDate": modifiedDate?.toIso8601String(),
  };
}
