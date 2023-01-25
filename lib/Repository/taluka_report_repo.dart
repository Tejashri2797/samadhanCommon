import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Modal/taluka_report_modal.dart';

class TalukaReportRepo {
  static List<TalukaReportModal> reportDetails = [];

  static var queryParameters;

  static talukaReport( String talukaId,String id,String startDate,String endDate) async {
    queryParameters = {
      "TalukaId":talukaId,
      "userid": id,
      "fromDate":startDate,
      "toDate":endDate
    };
    Uri uri = Uri.http('samadhan-api.mahamining.com',
        'api/ShareGrievances/OfficerTalukaReport', TalukaReportRepo.queryParameters);

    try {
      print(uri);
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(response.body);
        print(temp);
        temp['responseData'].forEach((v) {
          reportDetails.add(TalukaReportModal(
            talukaId: v["talukaId"],
            taluka: v["taluka"],
            received: v["received"],
            openn: v["openn"],
            accepted: v["accepted"],
            resolved: v["resolved"],
            partialResloved: v["partialResloved"],
            rejected: v["rejected"],
            transfered: v["transfered"],
            isDeleted: v["isDeleted"],
          ));
        });

        return reportDetails;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception in Data $e');
      }
      debugPrintStack();
    }
  }
}
