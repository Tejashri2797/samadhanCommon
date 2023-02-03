import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Modal/department_modal.dart';




List<DepartmentModalClass> depDetailsList = [];

class DepartmentRepo{

  static Uri uri = Uri.http("samadhan-api.mahamining.com",
      "samadhan/commondropdown/GetAllDepartment");

@override
  getDepartmentApi() async {
  print(uri);

  try{
    http.Response response = (await http.get(uri));
    if(response.statusCode == 200){
      Map temp = json.decode(utf8.decode(response.bodyBytes));
      print("***$temp***");
      List<dynamic> data = temp ['responseData'];
      print(data);
      data.forEach((v) {
        depDetailsList.add(DepartmentModalClass(
          id: v['id'],
          departmentName: v['departmentName'].toString(),
          m_DepartmentName: v['m_DepartmentName'].toString(),
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