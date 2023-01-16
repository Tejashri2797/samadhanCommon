
import 'dart:core';

class OTPPostModal {

  String? mobileno;
   int? userId;
  String? key;
  String? version;
  int? loginDeviceTypeId;
  int? subUserTypeId;
  String? fcmId;
  int? createdBy;
  int? userTypeId;

  OTPPostModal({this.mobileno, this.userId, this.key,
    this.version, this.loginDeviceTypeId,this.subUserTypeId,this.fcmId,this.createdBy,this.userTypeId
  });

  factory OTPPostModal.fromJson(Map<String, dynamic> json)=>
      OTPPostModal(
        mobileno: json["mobileno"],
        userId: json["userId"],
        key: json["key"],
        version: json["version"],
        loginDeviceTypeId: json["loginDeviceTypeId"],
        subUserTypeId: json["subUserTypeId"],
        fcmId: json["fcmId"],
        createdBy: json["createdBy"],
        userTypeId: json["userTypeId"],

      );


  Map<String, dynamic> toJson() =>
      {
        "mobileno": mobileno,
        "userId": userId,
        "key": key,
        "version": version,
        "loginDeviceTypeId": loginDeviceTypeId,
        "subUserTypeId": subUserTypeId,
        "fcmId": fcmId,
        "userTypeId": userTypeId,
        "createdBy": createdBy,
        "userTypeId": userTypeId,

      };


}

