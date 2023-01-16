import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../Modal/PostGrievanceModal.dart';
import 'package:http/http.dart' as http;


class PostGrievanceRepo {
  static List<PostGrievanceModal> postGrievance = [];

  static postGrievanceData(
      int id,
      String grievanceNo,
      int districtId,
      int talukaId,
      int stateId,
      int villageId,
      int concernDeptId,
      int concernOfficeId,
      int natureGrievanceId,
      String grievanceDescription,
      int isSelfGrievance,
      String otherCitizenName,
      String otherCitizenMobileNo,
      String otherCitizenAddress,
      int createdBy,
      int modifiedBy,
      List<CitizenGrievanceImage> citizenGrievanceImages,
      )  async {

    Uri uri= Uri.http("samadhan-api.mahamining.com",
        "/samdhan/Grievance_App/PostGrievance");

    var data = jsonEncode({
      "id": id,
      "grievanceNo": grievanceNo,
      "districtId": districtId,
      "talukaId": talukaId,
      "stateId": stateId,
      "villageId": villageId,
      "concern_DeptId": concernDeptId,
      "concern_OfficeId": concernOfficeId,
      "natureGrievanceId": natureGrievanceId,
      "grievanceDescription": grievanceDescription,
      "isSelfGrievance": isSelfGrievance,
      "otherCitizenName": otherCitizenName,
      "otherCitizenMobileNo": otherCitizenMobileNo,
      "otherCitizenAddress": otherCitizenAddress,
      "createdBy": createdBy,
      "modifiedBy": modifiedBy,
      "citizenGrievanceImages": List<dynamic>.from(
          citizenGrievanceImages!.map((x) => x.toJson())
      ),

      //required parameter
    });



    try {
      print(uri);
      print("----$data");

      var request = await http.post(uri,
          body: data,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          });
print(request.statusCode);
    if (request.statusCode == 200) {
      print(data);
      print(request.statusCode);
      Map temp= jsonDecode(utf8.decode(request.bodyBytes));
    print("----$temp");
  /*  temp['responseData'].forEach((v) {
      postGrievance.add(PostGrievanceModal(

    ));
    });
    return postGrievance;*/


    }
    } catch (e) {
      print(e);
      debugPrintStack();

    }
    }
  }
