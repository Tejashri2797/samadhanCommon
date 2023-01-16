
import 'dart:convert';

import 'package:http/http.dart'as http;
class LogoutRepo {
  static logout(
      int appId,
      int userId,
      ) async{
    final uri =
        Uri.http('samadhan-api.mahamining.com','/api/AppLogout/AppLogOut');
    Map<String, String> headers = {
      'Content-Type': 'application/json',

    };
    final msg = jsonEncode(
        {
          "appId": appId,
          "userId": userId
        });

    try{
      var request = await http.put(uri, body:msg,headers: headers
      );
      print(uri);
      if (request.statusCode == 200) {
        print("---$uri}");
        print(request.statusCode);
        Map temp= jsonDecode(request.body);
        print("---$temp}");



      }
    }
    catch(e){
      print(e);
    }

  }
}
