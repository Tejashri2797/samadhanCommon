import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../Modal/PicChartData.dart';

class PicChartRepo {
  static List<PicChartModalClass> chartDetail = [];

  static var queryParameters;

  static pieChartData(String id,String startDate,String endDate) async {
    queryParameters = {
      "UserId": id,
      "fromDate":startDate,
      "toDate":endDate
    };
    Uri uri = Uri.http('samadhan-api.mahamining.com',
        'api/DashboardApp/Dashboard_App', PicChartRepo.queryParameters);

    try {
      print(uri);
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(response.body);
        print(temp);
        temp['responseData'].forEach((v) {
          chartDetail.add(PicChartModalClass(
            count: v["count"],
            grievanceStatusId: v["grievanceStatusId"],
            name: v["name"],
            totalcount: v["totalcount"],
          ));
        });

        return chartDetail;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception in Data $e');
      }
      debugPrintStack();
    }
  }
}
