
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:samadhan/Modal/get_office_modalclass.dart';

import '../View/PostGrievance.dart';

class GetOfficeByDeptIdRepo {
  static List<GetOfficeByDeptId> officeList = [];

  static var queryParameter;

  static getOfficeById(String id) async {
    queryParameter = {"DeptId": id,};

    Uri uri = Uri.http(
        "samadhan-api.mahamining.com",
            "samadhan/commondropdown/GetOfficeByDeptId",
        GetOfficeByDeptIdRepo.queryParameter);
    try {
      print(uri);
      http.Response response = await (http.get(uri));



      if (response.statusCode == 200) {
        Map temp = json.decode(response.body);
        print(temp);
        temp['responseData'].forEach((v) {
          officeList.add(GetOfficeByDeptId(
              id: v['id'],
              deptId: v['deptId'],
              name: v['name'],
              m_OfficeName: v['m_OfficeName']));
        });
        return officeList;

      }
    } catch (e) {
      if (kDebugMode) {

        print('Exception in Data $e');
        e.printError;
      }
    }
  }
}
