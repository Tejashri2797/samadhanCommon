import 'dart:convert';

import '../Modal/district_modal.dart';
import 'package:http/http.dart' as http;

import '../Modal/taluka_modal.dart';






List<TalukaModalClass> talukaList=[];
class TalukaRepository {

  static var queryParameters;

  static getTalukaData() async {
  queryParameters = {
  "DistrictId":"1",
  };

  Uri uri = Uri.http('samadhan-api.mahamining.com',
      'samadhan/commondropdown/GetTalukabyDistId', TalukaRepository.queryParameters);


  print(uri);
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
  } catch (e) {
  print('Exception in Data $e');
  }
  }
  }




