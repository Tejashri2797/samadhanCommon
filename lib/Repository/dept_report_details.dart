import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Modal/department_report_details.dart';

class DeptReportDetailRepo {
  static List<DeptReportDetailsModal> reportDetails = [];

  static var queryParameters;

  static deptReport( String deptId,String id,String startDate,String endDate) async {
    queryParameters = {
       "searchdeptId":deptId,
      "userid": id,
      "fromDate":startDate,
      "toDate":endDate
    };
    Uri uri = Uri.http('samadhan-api.mahamining.com',
        '/api/ShareGrievances/OfficerDepartmentReport', DeptReportDetailRepo.queryParameters);

    try {
      print(uri);
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(response.body);
        print(temp);
        temp['responseData'].forEach((v) {
          reportDetails.add(DeptReportDetailsModal(
            deptId: v["deptId"],
            departmentname:  v["departmentname"],
            received:  v["received"],
            openn:  v["openn"],
            accepted:  v["accepted"],
            resolved:  v["resolved"],
            partialResloved:  v["partialResloved"],
            rejected:  v["rejected"],
            transfered:  v["transfered"],
            isDeleted:  v["isDeleted"],
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
