import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Modal/SubmitFeedBackModal.dart';

class PostFeedBackRepo {
  static List<PostFeedbackModal> feedbackList = [];

  static postData(int id, String grievanceId, String comment, int isSatisfied,
      int dSatisfactnReason, String createdBy) async {
    var data = jsonEncode({
      "id": id,
      "grievanceId": grievanceId,
      "comment": comment,
      "isSatisfied": isSatisfied,
      "d_satisfactn_Reason": dSatisfactnReason,
      "createdBy": createdBy,
    });
    print(data);
    try {

      var request = await http.post(
          Uri.parse(
              'https://samadhan-api.mahamining.com/samadhan/feedback/AddFeedbackDetails'),
          body: data,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            'Content-Transfer-Encoding': 'base64'
          });
       print(request.statusCode);
      if (request.statusCode == 200) {
        print(request.statusCode);
        print(data);

        Map temp = jsonDecode(utf8.decode(request.bodyBytes));
        print(temp);
      }
    } catch (e) {
      if (kDebugMode) {
        print("error");
        print(e);
      }
    }
  }
}
