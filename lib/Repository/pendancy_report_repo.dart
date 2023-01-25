import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Modal/pendancy_report_modal.dart';


class PendancyReportRepo {
  static List<PendancyReportModal> reportDetails = [];

  static var queryParameters;

  static pendancyReport( String deptId,String id,String startDate,String endDate) async {
    queryParameters = {
      "searchdeptId":deptId,
      "userid": id,
      "fromDate":startDate,
      "toDate":endDate
    };
    Uri uri = Uri.http('samadhan-api.mahamining.com',
        'samadhan/Reports/OfficerPendencyReport', PendancyReportRepo.queryParameters);

    try {
      print(uri);
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(response.body);
        print(temp);
        temp['responseData'].forEach((v) {
          reportDetails.add(PendancyReportModal(
            deptId: v["deptId"],
            departmentname: v["departmentname"],
            received: v["received"],
            pending: v["pending"],
            approvedless7: v["approvedless7"],
            approvedless15: v["approvedless15"],
            approvedless30: v["approvedless30"],
            approvedgrt30: v["approvedgrt30"],
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
