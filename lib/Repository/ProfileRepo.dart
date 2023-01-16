import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Modal/ProfileModal.dart';
import '../Modal/village_modal.dart';
import '../View/SignUp.dart';

List<ProfileModal> detailList = [];

class ProfileRepository {
  static var queryParameters;

  static profileData(String id) async {
    queryParameters = {
      "Id": id,
    };

    Uri uri = Uri.http(
        'samadhan-api.mahamining.com',
            'samadhan/userregistration_appmodel/GetAppUserProfile',
        ProfileRepository.queryParameters);

    print(uri);
    try {
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(utf8.decode(response.bodyBytes));
        print(temp);
        final value= ProfileModal.fromJson(temp["responseData"]);
        detailList.add(value);




        return detailList;

      }
    } catch (e) {
      print('Exception in Data $e');
    }
  }
}
