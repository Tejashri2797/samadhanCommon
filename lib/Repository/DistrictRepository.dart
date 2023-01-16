import 'dart:convert';

import '../Modal/district_modal.dart';
import 'package:http/http.dart' as http;




List<DistrictModalClass> districtList=[];
class DistrictRepository {
  Uri uri= Uri.http('samadhan-api.mahamining.com',
      '/samadhan/commondropdown/GetAllDistrict');
  @override
  getDistrictData() async {
    print(uri);
   try{
     http.Response response =(await http.get(uri));
     if(response.statusCode == 200){
       Map temp =json.decode(utf8.decode(response.bodyBytes));
       temp['responseData'].forEach((v){
       districtList.add(DistrictModalClass(
         id:v['id'],
         district:v['district'],
         m_District:v['m_District'],

       ));
     });

       return districtList;
           }
   }
   catch(e){
     print('Exception in Data $e');
    }
  }

}