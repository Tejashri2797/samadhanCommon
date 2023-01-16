import 'package:get/get.dart';

import '../Modal/ProfileModal.dart';
import '../Repository/ProfileRepo.dart';
import 'otp_viewmodal.dart';

String? profileName;
String? Email;
String? district;
String? taluka;
String? village;
int? userId;
String? MobileNumber;

class ProfileVM extends GetxController{
  List<ProfileModal>  profileDetails=[];
  var isLoading =true.obs;

  @override
  void onInit()  {
    super.onInit();
  //  getDetails(id1!);
  }

  getDetails(String id)async{
    var details =await ProfileRepository.profileData(id);
 print(details);
    if(details != null){
      profileDetails=details;
      isLoading.value=false;
    }


    profileDetails.forEach((element) {

      MobileNumber=element.mobileNo;
      profileName =element.name;
      Email =element.emailId;
      district = element.district;
      taluka = element.taluka;
      village = element.village;
      userId = element.id;

    });

  }
}