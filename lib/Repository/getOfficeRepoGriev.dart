import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Modal/getOfficeModalgriev.dart';



List<OfficeModalClass> officeList =[];

class OfficeRepository{
  static var queryParameters;

  @override
  static getOfficeData(String deptId) async {
    queryParameters = {
      "DeptId": deptId,
    };

   Uri uri = Uri.http("samadhan-api.mahamining.com",
      "/samadhan/commondropdown/GetOfficeByDeptId",OfficeRepository.queryParameters);

    print(uri);

    try{
      http.Response response = (await http.get(uri));
      if(response.statusCode == 200){
        Map temp = json.decode(utf8.decode(response.bodyBytes));
        print(temp);
        List<dynamic> data = temp ['responseData'];
        print(data);
        data.forEach((v) {
          officeList.add(OfficeModalClass(
            id: v['id'],
            deptId: v['deptId'],
            name: v['name'].toString(),
            m_OfficeName: v['m_OfficeName'].toString(),
          ));
        });
        return officeList;
      }
    }
    catch(e){
      print("Exception in Data $e");
      throw e;
    }
  }
}