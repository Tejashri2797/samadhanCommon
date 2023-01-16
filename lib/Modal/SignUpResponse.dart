
import 'dart:core';

class SignupResponseModal {

  String? otp;
  String? mobileNo;
  String? id;


  SignupResponseModal({this.otp,this.mobileNo,this.id});


  ///convert from json to object
  factory SignupResponseModal.fromJson(Map<String, dynamic> json)=>
      SignupResponseModal(
        otp: json["otp"],
        mobileNo: json["mobileNo"],
        id: json["id"],

      );

  /// convert object to json
  Map<String, dynamic> toJson() =>
      {
        "otp": otp,
        "mobileNo": mobileNo,
        "id": id,
      };


}

