import 'dart:convert';

import 'package:samadhan/Modal/get_grievanceModal.dart';
import 'package:http/http.dart' as http;


List<GetGrievanceResolvedModal> ResolvedList=[];

class ResolvedRepository {
  Uri uri = Uri.http("samadhan-api.mahamining.com",
      "/samdhan/Grievance_App/GetLatestResolved_App");

  getResolveddata() async{
    print(uri);
    try{
      http.Response response = (await http.get(uri));
      if(response.statusCode == 200){
        Map temp= json.decode(response.body);
        print(temp);
        temp['responseData'].forEach((v){
          ResolvedList.add(GetGrievanceResolvedModal(
            id: v['id'],
            grievanceNo: v['grievanceNo'],
            isSatisfied: v['isSatisfied'],
            taluka: v['taluka'],
            department: v['department'],
            nature_Of_Grievance: v['nature_Of_Grievance'],
            reg_Date: v['reg_Date'],
            resolved_Date: v['resolved_Date'],
            isSelfGrievance: v['isSelfGrievance'],
          ));
        });

        return ResolvedList;
      }
    }
    catch(e){
      print('Exception in Data $e');
    }
  }

}