import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../Modal/feedback_detailModal.dart';

class FeedbackDetailsRepo {
  static List<FeedbackDetailsModal> feedbackDetailsModal = [];

  static var queryParameters;

  static feedbackDetailsData(String id) async {
    queryParameters = {
      "Id": id,
    };
    Uri uri = Uri.http(
        'samadhan-api.mahamining.com',
        '/samadhan/feedback/GetCitzen_OfficerGrievancebyId',
        FeedbackDetailsRepo.queryParameters);

    try {
      print(uri);
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(response.body);
        print(temp);

        final value = FeedbackDetailsModal.fromJson(temp["responseData"]);
        feedbackDetailsModal.add(value);

        return feedbackDetailsModal;
      }
    } catch (e) {
      print('Exception in Data $e');
      debugPrintStack();
    }
  }
}
