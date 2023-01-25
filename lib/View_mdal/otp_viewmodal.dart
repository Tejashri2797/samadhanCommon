import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:samadhan/Modal/otp_modal.dart';

import 'package:samadhan/Utility/TextFieldControllerFile.dart';
import '../Repository/otp_Repository.dart';


String? mobValidate;
String? id1;
OTPRepository otpRepository=OTPRepository();
class OTPViewModal extends GetxController{


  List<OTPModalClass> otpList=[];

  var isLoading = true.obs;

  @override
  void onReady(){
    super.onReady();
    //getOTPInformation(mobileNumberController.text!);

  }

  getOTPInformation(String mob) async{
    var details = await OTPRepository.getOTPFromApi(mob!)  ;
      print("mob:$mob");

    if(details != null)
    {
      otpList = details ;
      isLoading.value = false;
    }
 otpList.forEach((element) {
   mobValidate=element.mobileNo.toString();
   id1=element.id;
   print(mobValidate);
 });

  }


}