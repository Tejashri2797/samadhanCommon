import 'dart:convert';


import 'package:http/http.dart' as http;

import '../Modal/feedbackDissatisfactn.dart';








class DisSatisfactionReasonRepo {
  static List<DisatisfactionReason> reasons=[];

  static Uri uri = Uri.http('samadhan-api.mahamining.com',
      '/samadhan/commondropdown_App/GetAllD_satisfactn_Reasons',);




  static dissatifactionReason() async {
    try{
      print(uri);
      http.Response response =(await http.get(uri));
      if(response.statusCode == 200){
        Map temp =json.decode(utf8.decode(response.bodyBytes));
        print(temp);
        temp['responseData'].forEach((v){
          reasons.add(DisatisfactionReason(
            id: v["id"],
            dSatisfactnReason: v["d_satisfactn_Reason"],
          ));
        });

        return reasons;
      }
    }
    catch(e){
      print('Exception in Data $e');
    }
  }

}