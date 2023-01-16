import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:samadhan/Modal/PostOTPResponseModal.dart';

import '../Modal/SignUpResponse.dart';


class PostOTP{

  static List<PostOtpResponseModal> otpList2=[];
  static postDataOTP(
      String mobileno,
      int userId,
      String key,
      String version,
      int loginDeviceTypeId,
      int subUserTypeId,
      String fcmId,
      int createdBy,
      int userTypeId,

      ) async {

    final uri = Uri.http('samadhan-api.mahamining.com',
        '/samadhan/app-login/login-mobile');

    Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};

    final msg = jsonEncode(
        {
          'mobileno': mobileno,
          'userId':userId,
          'key': key,
          'version': version,
          'loginDeviceTypeId': loginDeviceTypeId,
          'subUserTypeId': subUserTypeId,
          'fcmId': fcmId,
          'createdBy': createdBy,
          'userTypeId': userTypeId,
        });
    try {
      var request = await http.post(uri, body:msg,headers: headers
      );

      print(msg);
      if (request.statusCode == 200) {
        print("---$uri}");
        print(request.statusCode);
         Map temp= jsonDecode(utf8.decode(request.bodyBytes));
        print(temp);
        temp['responseData']['data'].forEach((v) {
          otpList2.add(PostOtpResponseModal(
            userId: v["userId"],
            fullName: v["fullName"],
            mobileNo: v["mobileNo"],
            address: v["address"],
            emailId: v["emailId"],
            createdBy: v["createdBy"],
            createdDate: DateTime.parse(v["createdDate"]),
            modifiedBy: v["modifiedBy"],
            modifiedDate: DateTime.parse(v["modifiedDate"]),
            isDeleted: v["isDeleted"],
            userTypeId: v["userTypeId"],
            subUserTypeId: v["subUserTypeId"],
            stateId: v["stateId"],
            state: v["state"],
            districtId: v["districtId"],
            district: v["district"],
            talukaId: v["talukaId"],
            taluka: v["taluka"],
            villageId: v["villageId"],
            village: v["village"],
            isBlock: v["isBlock"],
            profilePhoto: v["profilePhoto"],
            blockBy: v["blockBy"],

          ));


        });
        return otpList2;

      }
    } catch (e) {
      if (kDebugMode) {
        print(e);

      }
    }
  }
}
