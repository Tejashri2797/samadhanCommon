
import 'dart:core';

class SignUpModalClass {
  int? id;
  String? name;
  String? mobileNo;
  int? districtId;
  int? talukaId;
  int? villageId;
  String? emailId;
  int? userTypeId;
  int? deviceTypeId;

  SignUpModalClass({this.id, this.name, this.mobileNo,
    this.emailId, this.userTypeId, this.deviceTypeId,this.districtId,this.talukaId,this.villageId
    });

  factory SignUpModalClass.fromJson(Map<String, dynamic> json)=>
      SignUpModalClass(
        id: json["id"],
        name: json["name"],
        mobileNo: json["mobileNo"],
        districtId: json["districtId"],
        talukaId: json["talukaId"],
        villageId: json["villageId"],
        emailId: json["emailId"],
        userTypeId: json["userTypeId"],
        deviceTypeId: json["deviceTypeId"],

      );


  Map<String, dynamic> toJson() =>
      {
        "id": 1,
        "name": name,
        "mobileNo": mobileNo,
        "districtId": districtId,
       "talukaId": talukaId,
        "villageId": villageId,
        "emailId": emailId,
        "userTypeId": userTypeId,
        "deviceTypeId": deviceTypeId,

      };


}

