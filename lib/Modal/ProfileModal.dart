// To parse this JSON data, do
//
//     final profileModal = profileModalFromJson(jsonString);

import 'dart:convert';

ProfileModal profileModalFromJson(String str) => ProfileModal.fromJson(json.decode(str));

String profileModalToJson(ProfileModal data) => json.encode(data.toJson());

class ProfileModal {
  ProfileModal({
    this.id,
    this.name,
    this.mobileNo,
    this.stateId,
    this.state,
    this.districtId,
    this.district,
    this.talukaId,
    this.taluka,
    this.villageId,
    this.village,
    this.emailId,
    this.userTypeId,
    this.userType,
    this.subUserTypeId,
    this.subUserType,
    this.userName,
    this.password,
    this.deptId,
    this.departmentName,
    this.officeId,
    this.officeName,
    this.isBlock,
    this.blockDate,
    this.blockBy,
    this.keyExpireDate,
    this.deviceTypeId,
    this.fcmId,
    this.profilePhoto,
    this.msg,
  });

  int? id;
  String? name;
  String? mobileNo;
  int? stateId;
  String? state;
  int? districtId;
  String? district;
  int? talukaId;
  String? taluka;
  int? villageId;
  String? village;
  String? emailId;
  int? userTypeId;
  String? userType;
  int? subUserTypeId;
  String? subUserType;
  String? userName;
  String? password;
  int? deptId;
  dynamic departmentName;
  int? officeId;
  String? officeName;
  String? isBlock;
  DateTime? blockDate;
  String? blockBy;
  DateTime? keyExpireDate;
  int? deviceTypeId;
  String? fcmId;
  dynamic profilePhoto;
  dynamic msg;

  factory ProfileModal.fromJson(Map<String, dynamic> json) => ProfileModal(
    id: json["id"],
    name: json["name"],
    mobileNo: json["mobileNo"],
    stateId: json["stateId"],
    state: json["state"],
    districtId: json["districtId"],
    district: json["district"],
    talukaId: json["talukaId"],
    taluka: json["taluka"],
    villageId: json["villageId"],
    village: json["village"],
    emailId: json["emailId"],
    userTypeId: json["userTypeId"],
    userType: json["userType"],
    subUserTypeId: json["subUserTypeId"],
    subUserType: json["subUserType"],
    userName: json["userName"],
    password: json["password"],
    deptId: json["deptId"],
    departmentName: json["departmentName"],
    officeId: json["officeId"],
    officeName: json["officeName"],
    isBlock: json["isBlock"],
    blockDate: DateTime.parse(json["blockDate"]),
    blockBy: json["blockBy"],
    keyExpireDate: DateTime.parse(json["keyExpireDate"]),
    deviceTypeId: json["deviceTypeId"],
    fcmId: json["fcmId"],
    profilePhoto: json["profilePhoto"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobileNo": mobileNo,
    "stateId": stateId,
    "state": state,
    "districtId": districtId,
    "district": district,
    "talukaId": talukaId,
    "taluka": taluka,
    "villageId": villageId,
    "village": village,
    "emailId": emailId,
    "userTypeId": userTypeId,
    "userType": userType,
    "subUserTypeId": subUserTypeId,
    "subUserType": subUserType,
    "userName": userName,
    "password": password,
    "deptId": deptId,
    "departmentName": departmentName,
    "officeId": officeId,
    "officeName": officeName,
    "isBlock": isBlock,
    "blockDate": blockDate!.toIso8601String(),
    "blockBy": blockBy,
    "keyExpireDate": keyExpireDate!.toIso8601String(),
    "deviceTypeId": deviceTypeId,
    "fcmId": fcmId,
    "profilePhoto": profilePhoto,
    "msg": msg,
  };
}
