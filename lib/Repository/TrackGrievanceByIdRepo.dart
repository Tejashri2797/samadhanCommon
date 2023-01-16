import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../Modal/track_grievance_byid.dart';








TrackGrievanceByIdModal trackGrievanceByIdModal=TrackGrievanceByIdModal();
class TrackGrievanceByIdRepo {
  static List<TrackGrievanceByIdModal> allGrievance=[];

  static var queryParameters;

  static grievanceListData(String id) async {
    queryParameters = {
      "Id": id,
    };
    Uri uri = Uri.http('samadhan-api.mahamining.com',
        '/samdhan/Grievance_App/GetById', TrackGrievanceByIdRepo.queryParameters);


    try{
      print(uri);
      http.Response response =(await http.get(uri));
      if(response.statusCode == 200){
        Map temp =json.decode(response.body);
        print(temp);

         final value= TrackGrievanceByIdModal.fromJson(temp["responseData"]);
         allGrievance.add(value);




          return allGrievance;




      }
    }
    catch(e){
      print('Exception in Data $e');
      debugPrintStack();
    }
  }

}