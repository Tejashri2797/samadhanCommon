import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:samadhan/Utility/LocationListSignUp.dart';

import '../Modal/signup_modal.dart';
import '../Repository/post_signup.dart';
import '../Utility/signup_controller.dart';
import '../View/SignUp.dart';

String? postMob="";
String? postOTP;
String? postId;
class SignUpViewModal extends GetxController {

  // List<SignUpModalClass> signUpDetails = [];
  SignUpModalClass signUpModalClass = SignUpModalClass();
  var isLoading = true.obs;

  @override
  void onReady(){
   // postAllInformation(signUpModalClass);
  }

  postAllInformation(SignUpModalClass signUpModalClass) async  {
   await PostAPI.postData(
        id,
        userName.text,
        usermobileNo.text,
        int.parse(selectedDistrictValue!),
       selectedTalukaRange!,
       selectedVillageRange!,
       email.text,
        userTypeId,
        deviceTypeId,
    );
    PostAPI.otpList.forEach((element) {
      postMob=element.mobileNo;
      postOTP=element.otp ;
      postId=element.id ;
    });

  }



}