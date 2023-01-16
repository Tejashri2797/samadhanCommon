import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Modal/officerlogin_modal.dart';


List<OfficerLoginModal> officerDetailList = [];
String? message;
class OfficerLoginRepo {
  static var queryParameters;

  static officerDetails(String username,String password) async {
    queryParameters = {
      "UserName": username,
      "Password": password,
    };

    Uri uri = Uri.http(
        'samadhan-api.mahamining.com','samadhan/userregistration_appmodel/GetOfficerLogin',
        OfficerLoginRepo.queryParameters);

    print(uri);
    try {
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(utf8.decode(response.bodyBytes));
        print(temp);
        message = temp["statusMessage"];
        print(message);
        final value= OfficerLoginModal.fromJson(temp["responseData"]);
        officerDetailList.add(value);
        return officerDetailList;
      }
    } catch (e) {
      print('Exception in Data $e');
    }
  }
}
