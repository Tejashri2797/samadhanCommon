import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:samadhan/Modal/otp_modal.dart';

import '../Utility/TextFieldControllerFile.dart';

String? Registeredstatus;
String? generatedOtpId;
String? generatedOtpMob;
String? generatedOtp;

List<OTPModalClass> otpDetailstList = [];

class OTPRepository {
  static var queryParameters;

  @override
  static getOTPFromApi(String mob) async {
    queryParameters = {
      "MobileNumber": mob,
      "LoginDeviceTypeId": "1",
    };
    Uri uri = Uri.http('samadhan-api.mahamining.com',
        'samadhan/app-login/generate-otp', OTPRepository.queryParameters);

    print(uri);

    try {
      http.Response response = (await http.get(uri));
      if (response.statusCode == 200) {
        Map temp = json.decode(utf8.decode(response.bodyBytes));
        print("___$temp");
        List<dynamic> data = temp['responseData'];
        print(data);
        data.forEach((v) {
          otpDetailstList.add(OTPModalClass(
            otp: v['otp'].toString(),
            mobileNo: v['mobileNo'].toString(),
            id: v['id'].toString(),
            status: v['status'].toString(),
          ));

          otpDetailstList.forEach((element) {
            Registeredstatus = element.status;
            generatedOtpMob = element.mobileNo;
            generatedOtpId = element.id;
          });
          print(Registeredstatus);
        });
        print(otpDetailstList);
        return otpDetailstList;
      }
    } catch (e) {
      print('Exception in Data $e');
      throw e;
    }
    return null;
    // return temp['data1'];}
  }
}
