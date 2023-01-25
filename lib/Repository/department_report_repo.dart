import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Modal/department_report.dart';






List<ReportDepartmentModalClass> depDetailsList = [];

class ReportDepartmentRepo{
  static final queryParameters ={
    "flag_lang" : "1",
  };


  static Uri uri = Uri.http("samadhan-api.mahamining.com",
      "/samadhan/commondropdown_App/GetAllDepartment",ReportDepartmentRepo.queryParameters);


 static getDepartmentApi() async {
    print(uri);

    try{
      http.Response response = (await http.get(uri));
      if(response.statusCode == 200){
        Map temp = json.decode(utf8.decode(response.bodyBytes));
        print("***$temp***");
        List<dynamic> data = temp ['responseData'];
        print(data);
        data.forEach((v) {
          depDetailsList.add(ReportDepartmentModalClass(
            id: v['id'],
            departmentName: v['departmentName'].toString(),
          ));
        });
        return depDetailsList;
      }
    }

    catch(e){
      print("Exception in Data $e");
      throw e;
    }
  }

}