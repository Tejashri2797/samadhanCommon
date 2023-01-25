import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:samadhan/View_mdal/signup_viewmodal.dart';
import '../Modal/otp_postModal.dart';
import '../Repository/otp_Repository.dart';
import '../Repository/otppost_repository.dart';

import '../Utility/TextFieldControllerFile.dart';

String commonVersion = "1.1";
int logindevicetypeId = 1;
int subUsertypeId = 7;
String fcmId = "7";
int createdBy = 1;
int usertypeId = 5;
String? name;
String? Email;
String? district;
String? taluka;
String? village;
int? userId;

String? postMob2;
String? postOTP2;
String? postId2;

class PostOtpViewModal extends GetxController {
  OTPPostModal otpPostModal = OTPPostModal();
  var isLoading = true.obs;

  @override
  void onReady() {
    // super.onReady();
    // postAllInformation(otpPostModal);
  }

  postAllInformation(OTPPostModal otpPostModal) async {
    await PostOTP.postDataOTP(
      generatedOtpMob!,
      int.parse(generatedOtpId!),
      fieldOne.text +
          fieldTwo.text +
          fieldThree.text +
          fieldFour.text +
          fieldFive.text,
      commonVersion,
      logindevicetypeId,
      subUsertypeId,
      fcmId,
      createdBy,
      usertypeId,
    );

    PostOTP.otpList2.forEach((element) {
      postMob2 = element.mobileNo;
      name = element.fullName;
      Email = element.emailId;
      district = element.district;
      taluka = element.taluka;
      village = element.village;
      userId = element.userId;
    });
  }
}
