import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Modal/track_grievance_list.dart';






class TrackGrievanceList {
  static List<TrackGrievanceListModal> allGrievanceList=[];

  static var  queryParameters;


  static Uri uri = Uri.http('samadhan-api.mahamining.com',
      '/samdhan/Grievance_App/GetTrackGrievance_App', TrackGrievanceList.queryParameters);




 static grievanceListData(String statusId,String createdBy) async {
      queryParameters = {

     "GrievanceStatusId": statusId,
     "CreatedBy": createdBy,


   };
    try{
      print(uri);
      http.Response response =(await http.get(uri));
      if(response.statusCode == 200){
        Map temp =json.decode(utf8.decode(response.bodyBytes));
        print(temp);
        temp['responseData']['responseData1'].forEach((v){
          allGrievanceList.add(TrackGrievanceListModal(
            grievanceId: v["grievanceId"],
            grievanceNo: v["grievanceNo"],
            districtId: v["districtId"],
            district: v["district"],
            talukaId: v["talukaId"],
            taluka: v["taluka"],
            stateId: v["stateId"],
            villageId: v["villageId"],
            village: v["village"],
            concernDeptId: v["concern_DeptId"],
            departmentName: v["departmentName"],
            officeName: v["officeName"],
            natureGrievanceId: v["natureGrievanceId"],
            natureofGrievance: v["natureofGrievance"],
            grievanceDescription: v["grievanceDescription"],
            isSelfGrievance: v["isSelfGrievance"],
            grievanceSubmissionDate: DateTime.parse(v["grievanceSubmissionDate"]),
            grievanceStatusId: v["grievanceStatusId"],
            status: v["status"],
            grievanceStatusDate: DateTime.parse(v["grievanceStatusDate"]),


          ));
        });

        return allGrievanceList;
      }
    }
    catch(e){
      print('Exception in Data $e');
      debugPrintStack();
    }
  }

}