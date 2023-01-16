// To parse this JSON data, do
//
//     final postOtpResponseModal = postOtpResponseModalFromJson(jsonString);

import 'dart:convert';

PostOtpResponseModal postOtpResponseModalFromJson(String str) => PostOtpResponseModal.fromJson(json.decode(str));

String postOtpResponseModalToJson(PostOtpResponseModal data) => json.encode(data.toJson());

class PostOtpResponseModal {
  PostOtpResponseModal({
    this.userId,
    this.fullName,
    this.mobileNo,
    this.address,
    this.emailId,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.isDeleted,
    this.userTypeId,
    this.subUserTypeId,
    this.stateId,
    this.state,
    this.districtId,
    this.district,
    this.talukaId,
    this.taluka,
    this.villageId,
    this.village,
    this.isBlock,
    this.profilePhoto,
    this.blockBy,
  });

  int? userId;
  String? fullName;
  String? mobileNo;
 String? address;
  String? emailId;
  String? createdBy;
  DateTime? createdDate;
  int? modifiedBy;
  DateTime? modifiedDate;
  bool? isDeleted;
  int? userTypeId;
  int? subUserTypeId;
  int? stateId;
  String? state;
  int? districtId;
  String? district;
  int? talukaId;
  String? taluka;
  int? villageId;
  String? village;
  bool? isBlock;
  String? profilePhoto;
  int? blockBy;

  factory PostOtpResponseModal.fromJson(Map<String, dynamic> json) => PostOtpResponseModal(
    userId: json["userId"],
    fullName: json["fullName"],
    mobileNo: json["mobileNo"],
    address: json["address"],
    emailId: json["emailId"],
    createdBy: json["createdBy"],
    createdDate: DateTime.parse(json["createdDate"]),
    modifiedBy: json["modifiedBy"],
    modifiedDate: DateTime.parse(json["modifiedDate"]),
    isDeleted: json["isDeleted"],
    userTypeId: json["userTypeId"],
    subUserTypeId: json["subUserTypeId"],
    stateId: json["stateId"],
    state: json["state"],
    districtId: json["districtId"],
    district: json["district"],
    talukaId: json["talukaId"],
    taluka: json["taluka"],
    villageId: json["villageId"],
    village: json["village"],
    isBlock: json["isBlock"],
    profilePhoto: json["profilePhoto"],
    blockBy: json["blockBy"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "fullName": fullName,
    "mobileNo": mobileNo,
    "address": address,
    "emailId": emailId,
    "createdBy": createdBy,
    "createdDate": createdDate!.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedDate": modifiedDate!.toIso8601String(),
    "isDeleted": isDeleted,
    "userTypeId": userTypeId,
    "subUserTypeId": subUserTypeId,
    "stateId": stateId,
    "state": state,
    "districtId": districtId,
    "district": district,
    "talukaId": talukaId,
    "taluka": taluka,
    "villageId": villageId,
    "village": village,
    "isBlock": isBlock,
    "profilePhoto": profilePhoto,
    "blockBy": blockBy,
  };
}
