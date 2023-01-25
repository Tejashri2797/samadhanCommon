import 'package:get/get.dart';

import '../Modal/ProfileModal.dart';
import '../Modal/officerlogin_modal.dart';
import '../Repository/ProfileRepo.dart';
import '../Repository/officer_login_repo.dart';
import 'otp_viewmodal.dart';

int? officerId;
int? subUserTypeId;
String? officerName;
class OfficerLoginVM extends GetxController{
  List<OfficerLoginModal>  officerDetails=[];
  var isLoading =true.obs;

  @override
  void onInit()  {
    super.onInit();
  }

  getOfficerDetails(String username,String password)async{
    var details =await OfficerLoginRepo.officerDetails(username, password);
    print("======$details");
    if(details!= null){
      officerDetails = details;
      isLoading.value=false;
    }

    officerDetails.forEach((element) {
      officerId=element.id;
      officerName=element.name;
      subUserTypeId=element.subUserTypeId;
    });




  }
}