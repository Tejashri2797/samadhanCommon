import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Modal/StatusModal.dart';



class StatusRepo {
  static List<StatusModal> statusDetails = [];



  static statusReport() async {

    Uri uri = Uri.http('samadhan-api.mahamining.com',
        'samadhan/commondropdown/GetAllStatus');

    try {
      print(uri);
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(response.body);
        print(temp);
        temp['responseData'].forEach((v) {
          statusDetails.add(StatusModal(
            id: v["id"],
            name: v["name"],
            mName: v["m_Name"],
          ));
        });

        return statusDetails;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception in Data $e');
      }
      debugPrintStack();
    }
  }
}
