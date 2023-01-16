import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Modal/track_grievance_list.dart';
import '../Modal/track_grievance_search.dart';






class TrackGrievanceSearchRepo {
  static List<TrackGrievanceSearchdModal> allGrievanceList1=[];
  static var queryParameters;



  static grievanceSearchData(String searchPara) async {
    queryParameters = {
      "Textsearch": searchPara,
      "GrievanceStatusId": "0",
      "CreatedBy": "1",


    };
    Uri uri = Uri.http('samadhan-api.mahamining.com',
        '/samdhan/Grievance_App/GetTrackGrievance_App', TrackGrievanceSearchRepo.queryParameters);


    try{
      print(uri);
      http.Response response =(await http.get(uri));
      if(response.statusCode == 200){
        Map temp =json.decode(utf8.decode(response.bodyBytes));
        print(temp);
        temp['responseData']['responseData1'].forEach((v){
          allGrievanceList1.add(TrackGrievanceSearchdModal(
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
            otherCitizenName: v["otherCitizenName"],
            otherCitizenMobileNo: v["otherCitizenMobileNo"],
            otherCitizenAddress: v["otherCitizenAddress"],
            grievanceSubmissionDate: DateTime.parse(v["grievanceSubmissionDate"]),
            grievanceStatusId: v["grievanceStatusId"],
            grievanceStatusDate: DateTime.parse(v["grievanceStatusDate"]),
            status: v["status"],
            createdBy: v["createdBy"],
            name: v["name"],
            userMobileNo: v["userMobileNo"],
            userEmailId: v["userEmailId"],
            citizenGrievanceImages: List<CitizenGrievanceImage>.from(v["citizenGrievanceImages"].map((x) => CitizenGrievanceImage.fromJson(x))),



          ));
        });

        return allGrievanceList1;

      }
    }
    catch(e){
      print('Exception in Data $e');
      debugPrintStack();
    }
  }

}