import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Modal/getTalukaModalgriev.dart';



List<TalukaModalClass> talukaList=[];
class TalukaRepository {

  static final queryParameters = {
    "DistrictId": "1",


  };
  static Uri uri = Uri.http('samadhan-api.mahamining.com',
      'samadhan/commondropdown/GetTalukabyDistId', TalukaRepository.queryParameters);




  @override
  getTalukaData() async {
    try{
      print(uri);
      http.Response response =(await http.get(uri));
      if(response.statusCode == 200){
        Map temp =json.decode(utf8.decode(response.bodyBytes));
        temp['responseData'].forEach((v){
          talukaList.add(TalukaModalClass(
            firstTaluka:"Select Taluka",
            id:v['id'],
            taluka:v['taluka'],
            m_Taluka:v['m_Taluka'],

          ));
        });

        return talukaList;
      }
    }
    catch(e){
      print('Exception in Data $e');
    }
  }

}