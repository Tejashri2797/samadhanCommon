import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../Modal/NotificationDetails.dart';
import '../Modal/track_grievance_byid.dart';



class NotificationDetailsRepo {
  static List<NotificationDetailModal> notificationDetail=[];

  static var queryParameters;

  static notificationData(String id) async {
    queryParameters = {
      "UserId": id,
    };
    Uri uri = Uri.http('samadhan-api.mahamining.com',
        'samdhan/Grievance_App/GetNotificationbyUserId', NotificationDetailsRepo.queryParameters);


    try{
      print(uri);
      http.Response response =(await http.get(uri));
      if(response.statusCode == 200){
        Map temp =json.decode(response.body);
        print(temp);
        temp['responseData']['responseData1'].forEach((v){
          notificationDetail.add(NotificationDetailModal(
            id: v["id"],
            msgId: v["msgId"],
            userId: v["userId"],
            greivanceId: v["greivanceId"],
            deviceTypeId: v["deviceTypeId"],
            appId: v["appId"],
            title: v["title"],
            description: v["description"],
            notificationDate: DateTime.parse(v["notificationDate"]),
            notificatioFailError: v["notificatioFailError"],
            isRead: v["isRead"],


          ));
        });

        return notificationDetail;











      }
    }
    catch(e){
      print('Exception in Data $e');
      debugPrintStack();
    }
  }

}