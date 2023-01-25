import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Modal/getDepartmentModalgriev.dart';




List<OfficerDepartmentModal> departmentList=[];
class DepartmentRepository {

  static final queryParameters = {
    "deptId": "1",


  };
  static Uri uri= Uri.http('samadhan-api.mahamining.com',
      '/samadhan/commondropdown/GetAllDepartment',DepartmentRepository.queryParameters);


  getDepartmentData() async {

    try{
      print(uri);
      http.Response response =(await http.get(uri));
      if(response.statusCode == 200){
        Map temp =json.decode(utf8.decode(response.bodyBytes));
        temp['responseData'].forEach((v){
          departmentList.add(OfficerDepartmentModal(
            id:v['id'],
            departmentName:v['departmentName'],
            m_DepartmentName:v['m_DepartmentName'],

          ));
        });
        return departmentList;
      }
    }
    catch(e){
      print('Exception in Data $e');
    }
  }
}