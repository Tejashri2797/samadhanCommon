import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Modal/SignUpResponse.dart';





class PostAPI {
  static List<SignupResponseModal> otpList=[];

  static postData(
    int id,
    String name,
    String mobileNo,
     int districtId,
     int talukaId,
    int villageId,
    String emailId,
    int userTypeId,
    int deviceTypeId,
  ) async {


    var data=jsonEncode({
      "id": id,
      "name": name,
      "mobileNo": mobileNo,
      "districtId": districtId,
      "talukaId": talukaId,
      "villageId": villageId,
      "emailId": emailId,
      "userTypeId": userTypeId,
      "deviceTypeId": deviceTypeId,

      //required parameter
    }) ;

    try {


      var request = await http.post(
          Uri.parse(
              'http://samadhan-api.mahamining.com/samadhan/userregistration_appmodel/AddRecord_App'),

          body:data,
          headers: {
            HttpHeaders.contentTypeHeader: 'text/json',
           'Content-Transfer-Encoding': 'base64'

          });
      // print(request.printError);
      //print(request.statusCode);
     // print(jsonDecode(request.body));

      if (request.statusCode == 200) {
        print(request.statusCode);
        print(data);

        Map temp= jsonDecode(utf8.decode(request.bodyBytes));
        print(temp);
        temp['responseData'].forEach((v) {
          otpList.add(SignupResponseModal(
            otp: v['otp'].toString(),
            id: v['id'],
            mobileNo: v['mobileNo'].toString(),
          ));

        });
        return otpList;




      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
