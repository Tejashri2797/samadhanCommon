import 'dart:convert';


import 'package:http/http.dart' as http;

import '../Modal/SubmiteFeedBack.dart';
import '../Modal/track_grievance_list.dart';






class SubmitFeedbackRepo {
  static List<SubmitFeedbackModal> allFeedbackList=[];
  static var queryParameters;
  static feedbackGrievanceData(String createdBy) async {
    queryParameters = {
      "GrievanceStatusId": "0",
      "CreatedBy": createdBy,
    };
    Uri uri = Uri.http('samadhan-api.mahamining.com',
        'samadhan/feedback/GetFeedbackGrievanceDetails',SubmitFeedbackRepo.queryParameters );
    try{
      print(uri);
      http.Response response =(await http.get(uri));
      if(response.statusCode == 200){
        Map temp =json.decode(utf8.decode(response.bodyBytes));
        print(temp);
        temp['responseData']['responseData1'].forEach((v){
          allFeedbackList.add(SubmitFeedbackModal(
            grievanceId: v["grievanceId"],
            grievanceNo: v["grievanceNo"],
            isSelfGrievance: v["isSelfGrievance"],
            deptId: v["deptId"],
            department: v["department"],
            office: v["office"],
            submissionDateAndTime: DateTime.parse(v["submissionDateAndTime"]),
            name: v["name"],
            mobileNo: v["mobileNo"],
            email: v["email"],
            districtId: v["districtId"],
            district: v["district"],
            talukaId: v["talukaId"],
            taluka: v["taluka"],
            villageId: v["villageId"],
            village: v["village"],
            natureOfGrievance: v["natureOfGrievance"],
            grievanceDetails: v["grievanceDetails"],
            grievanceStatusId: v["grievanceStatusId"],
            isSatisfied: v["isSatisfied"],
            status: v["status"],
            createdBy: v["createdBy"],
            modifiedBy: v["modifiedBy"],
            createdDate: DateTime.parse(v["createdDate"]),
            modifiedDate: DateTime.parse(v["modifiedDate"]),
            isDeleted: v["isDeleted"],


          ));
        });

        return allFeedbackList;
      }
    }
    catch(e){
      print('Exception in Data $e');
    }
  }

}