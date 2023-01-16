import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Modal/village_modal.dart';
import '../View/SignUp.dart';

List<VillageModalClass> VillageList = [];

class VillageRepository {
  static var queryParameters;

  @override
  static getVillageData(String talukaId) async {
    queryParameters = {
      "TalukaId": talukaId,
    };

    Uri uri = Uri.http(
        'samadhan-api.mahamining.com',
        'samadhan/commondropdown/GetVillageByTalukaId',
        VillageRepository.queryParameters);

    print(uri);
    try {
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(utf8.decode(response.bodyBytes));
        temp['responseData'].forEach((v) {
          VillageList.add(VillageModalClass(
            talukaId:v['talukaId'],
            id: v['id'],
            village: v['village'],
            m_Village: v['m_Village'],
          ));
        });

        return VillageList;
      }
    } catch (e) {
      print('Exception in Data $e');
    }
  }
}
