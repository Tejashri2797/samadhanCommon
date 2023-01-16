
import 'dart:convert';

import '../Modal/notification_modal.dart';
import 'package:http/http.dart' as http;

import 'otp_Repository.dart';

List<NotificationModal> notificationList=[];
var count=0;
class NotificationRepo {
  static var queryParameters;

  static getNotificationCount(String userId) async {
    queryParameters ={
      "UserId": userId,
    };
     Uri uri = Uri.http("samadhan-api.mahamining.com",
        "/samdhan/Grievance_App/GetNotificationCountByUserId",NotificationRepo.queryParameters);
    print(uri);
    try{
      http.Response response = (await http.get(uri));
      if(response.statusCode ==200){
        Map temp = json.decode(response.body);
        print(temp);
        temp['responseData'].forEach((v){
          notificationList.add(NotificationModal(
              userId:v['userId'],
            isReadcount:v['isReadcount'],
          ));
        });

        return notificationList;
      }
    }
    catch(e){
      print('Exception in Data $e');
    }
  }
}