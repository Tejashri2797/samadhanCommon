
import 'dart:core';

class OTPModalClass {

  String? otp;
  String? mobileNo;
  String? id;
  String? status;


  OTPModalClass({this.otp,this.mobileNo,this.id,this.status});


  ///convert from json to object
  factory OTPModalClass.fromJson(Map<String, dynamic> json)=>
      OTPModalClass(
        otp: json["otp"],
        mobileNo: json["mobileNo"],
        id: json["id"],
        status: json["status"],

      );

  /// convert object to json
  Map<String, dynamic> toJson() =>
      {
        "otp": otp,
        "mobileNo": mobileNo,
        "id": id,
        "status": status,

      };


}

