import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Modal/SubmitFeedBackModal.dart';

class PostFeedBackRepo {
  static List<PostFeedbackModal> feedbackList = [];

  static postData(int id, int grievanceId, String comment, int isSatisfied,
      int dSatisfactnReason, int createdBy) async {
    var data = jsonEncode({
      "id": id,
      "grievanceId": grievanceId,
      "comment": comment,
      "isSatisfied": isSatisfied,
      "d_satisfactn_Reason": dSatisfactnReason,
      "createdBy": createdBy,
    });

    try {
      var request = await http.post(
          Uri.parse(
              'https://samadhan-api.mahamining.com/samadhan/feedback/AddFeedbackDetails'),
          body: data,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            'Content-Transfer-Encoding': 'base64'
          });

      if (request.statusCode == 200) {
        print(request.statusCode);

        Map temp = jsonDecode(utf8.decode(request.bodyBytes));
        print(temp);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
