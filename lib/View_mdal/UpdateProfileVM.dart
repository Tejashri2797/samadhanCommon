
import 'package:get/get.dart';
import 'package:samadhan/Utility/officerDashboard.dart';
import 'package:samadhan/View/UpdateProfile.dart';
import 'package:samadhan/View_mdal/ProfileVM.dart';

import '../Modal/UpdateProfileModal.dart';
import '../Repository/UpdateProfileRepo.dart';
import '../View/OTPTabbar.dart';

class UpdateProfileVM extends GetxController {
  var isLoading = true.obs;

  updateUser(UpdateProfileModalClass updateProfileModalClass) async {

   await UpdateProfileRepo.updateProfile(
       int.parse(data.read('profileId')),
       updateName!.text,
       updateNumber!.text,
       updateEmail!.text,
      (talukaChange == false)?updateTalukaId : int.parse(updateTalukaValue!),
       (villageChange == false)?updatevillageId :  int.parse(updateVillageValue!),
       int.parse(data.read('profileId')),
       DateTime.now()
   );
  }

  updatedStatus(){

  }
}
