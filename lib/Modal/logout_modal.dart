
import 'dart:core';

class LogoutModalClass {
  int?  appId;
  int?  userId;



  LogoutModalClass({this.appId, this.userId});

  ///convert from json to object
  factory LogoutModalClass.fromJson(Map<String, dynamic> json)=>
      LogoutModalClass(
        appId: json["appId"],
        userId: json["userId"],

      );

  /// convert object to json
  Map<String, dynamic> toJson() =>
      {
        "appId": 0,
        "userId": userId,

      };


}

