import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Modal/officewise_report_modal.dart';

class OfficeWiseReportRepo {
  static List<OfficeReportModal> reportDetails = [];

  static var queryParameters;

  static officeReport( String deptId,String officeId,String id,String startDate,String endDate) async {
    queryParameters = {
      "searchdeptId":deptId,
      "searchofcId":officeId,
      "userid": id,
      "fromDate":startDate,
      "toDate":endDate
    };
    Uri uri = Uri.http('samadhan-api.mahamining.com',
        'api/ShareGrievances/OfficerOfficeReport', OfficeWiseReportRepo.queryParameters);

    try {
      print(uri);
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(response.body);
        print(temp);
        temp['responseData'].forEach((v) {
          reportDetails.add(OfficeReportModal(
            deptId: v["deptId"],
            departmentname: v["departmentname"],
            officeId: v["officeId"],
            officeName: v["officeName"],
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
