import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Modal/received_grievance_modal.dart';


class GrievanceReceivedRepo {
  static List<ReceivedGrievanceModal> grievanceDetails = [];

  static var queryParameters;

  static grReceivedDetails( String userId,String statusId,String date,String textsearch) async {
    queryParameters = {
      "userid": userId,
      "statusId": statusId,
      "date": date,
      "Textsearch":textsearch,

    };
    Uri uri = Uri.http('samadhan-api.mahamining.com',
        'samdhan/Grievance_App/GetGrievanceReceived_App', GrievanceReceivedRepo.queryParameters);

    try {
      print(uri);
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(response.body);
        print(temp);
        temp['responseData']['responseData1'].forEach((v) {
          grievanceDetails.add(ReceivedGrievanceModal(
            grievanceId: v["grievanceId"],
            grievanceNo: v["grievanceNo"],
            grievanceStatusId: v["grievanceStatusId"],
            isActionable: v["isActionable"],
            status: v["status"],
            applicantName: v["applicantName"],
            date: DateTime.parse(v["date"]),
            districtId: v["districtId"],
            district: v["district"],
            talukaId: v["talukaId"],
            taluka: v["taluka"],
            stateId: v["stateId"],
            state: v["state"],
            villageId: v["villageId"],
            village: v["village"],
            concernDeptId: v["concern_DeptId"],
            department: v["department"],
            concernOfficeId: v["concern_OfficeId"],
            officeName: v["officeName"],
            natureGrievanceId: v["natureGrievanceId"],
            natureofGrievance: v["natureofGrievance"],
            grievanceDescription: v["grievanceDescription"],
            isSelfGrievance: v["isSelfGrievance"],
            otherCitizenName: v["otherCitizenName"],
            otherCitizenMobileNo: v["otherCitizenMobileNo"],
            otherCitizenAddress: v["otherCitizenAddress"],
            createdBy: v["createdBy"],
            createdDate: DateTime.parse(v["createdDate"]),
            modifiedBy: v["modifiedBy"],
            modifiedDate: DateTime.parse(v["modifiedDate"]),
            isDeleted: v["isDeleted"],
            isPartial: v["isPartial"],
            isRed: v["isRed"],
          ));
        });

        return grievanceDetails;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception in Data $e');
      }
      debugPrintStack();
    }
  }
}
