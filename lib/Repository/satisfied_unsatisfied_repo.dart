import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Modal/satisfied_unstatisfied_report.dart';


class StatisfiedUnsatisfiedRepo {
  static List<SatisfiedUnSReportModal> reportDetails = [];

  static var queryParameters;

  static satisfiedReport( String deptId,String id,String startDate,String endDate) async {
    queryParameters = {
      "searchdeptId":deptId,
      "userid": id,
      "fromDate":startDate,
      "toDate":endDate
    };
    Uri uri = Uri.http('samadhan-api.mahamining.com',
        'samadhan/Reports/OfficerIsSatisfiedReport', StatisfiedUnsatisfiedRepo.queryParameters);

    try {
      print(uri);
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(response.body);
        print(temp);
        temp['responseData'].forEach((v) {
          reportDetails.add(SatisfiedUnSReportModal(
            deptId: v["deptId"],
            departmentname: v["departmentname"],
            received: v["received"],
            resolved: v["resolved"],
            satisfied: v["satisfied"],
            unSatisfied: v["unSatisfied"],
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
