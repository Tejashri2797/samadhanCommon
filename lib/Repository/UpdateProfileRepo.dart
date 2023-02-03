import 'dart:convert';
import 'package:http/http.dart'as http;

class UpdateProfileRepo {
  static updateProfile(
  int? id,
  String? name,
  String? mobileNo,
  String? emailId,
  int? talukaId,
  int? villageId,
  int? modifiedBy,
  DateTime? modifiedDate,
      ) async{

    final uri =
    Uri.http('samadhan-api.mahamining.com', '/samadhan/user-registration/UpdateCitizen');

    Map<String, String> headers = {
      'Content-Type': 'application/json',

    };
    final msg = jsonEncode(
        {
          "id": id,
          "name": name,
          "mobileNo": mobileNo,
          "emailId": emailId,
          "talukaId": talukaId,
          "villageId": villageId,
          "modifiedBy": modifiedBy,
          "modifiedDate": modifiedDate?.toIso8601String(),
        });

    try{
      var request = await http.put(uri, body:msg,headers: headers
      );


      if (request.statusCode == 200) {

        print("---$uri");
        print("---$msg}");
        print(request.statusCode);
        Map temp= jsonDecode(request.body);
        print("---$temp}");
        print("Update Profile ${request.statusCode}");



      }
    }
    catch(e){
      print(e);
    }

  }
}