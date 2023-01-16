import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Modal/NatureGrievance_Modal.dart';
import '../View/PostGrievance.dart';


List<NatureModalClass> natureDetailsList =[];

class NatureRepository{
  static final queryParameters ={

    "DeptId" : "1",
  };

  static Uri uri = Uri.http("samadhan-api.mahamining.com",
      "/samadhan/commondropdown/GetAllNatureOfGrivanceByDeptId",NatureRepository.queryParameters);

  @override
  getNatureApi() async{
    print(uri);

    try{
      http.Response response = (await http.get(uri));
      if(response.statusCode == 200){
        Map temp = json.decode(utf8.decode(response.bodyBytes));
        print(temp);
        List<dynamic> data = temp ['responseData'];
        print(data);
        data.forEach((v) {
          natureDetailsList.add(NatureModalClass(
            id: v['id'],
            deptId: v['deptId'],
            name: v['name'].toString(),
            m_Name: v['m_Name'].toString(),
          ));
        });
        return natureDetailsList;
      }
    }
    catch(e){
      print("Exception in Data $e");
      throw e;
    }
  }
}