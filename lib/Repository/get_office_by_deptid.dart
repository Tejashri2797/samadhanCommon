
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:samadhan/Modal/get_office_modalclass.dart';

import '../View/PostGrievance.dart';

class GetOfficeByDeptIdRepo {
  static List<GetOfficeByDeptId> officeList = [];

  static var queryParameter;

  static getOfficeById(String id) async {
    queryParameter = {"DeptId": id, "flag_lang": "1"};

    Uri uri = Uri.http(
        "samadhan-api.mahamining.com",
        "samadhan/commondropdown_App/GetOfficeByDeptId",
        GetOfficeByDeptIdRepo.queryParameter);
    try {
      print(uri);
      http.Response response = await (http.get(uri));



      if (response.statusCode == 200) {
        Map temp = json.decode(response.body);
        temp['responseData'].forEach((v) {
          officeList.add(GetOfficeByDeptId(
              id: v['id'], deptId: v['deptId'], name: v['name']));
        });
        return officeList;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception in Data $e');
      }
    }
  }
}
