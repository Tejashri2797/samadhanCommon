import 'package:get/get.dart';
import 'package:samadhan/View_mdal/ProfileVM.dart';
import '../Modal/PostGrievanceModal.dart';
import '../Repository/PostGrievanceRepo.dart';
import '../View/OTPTabbar.dart';
import '../View/PostGrievance.dart';


class PostGrievanceVM extends GetxController {
  var isLoading = true.obs;

  @override
  void onReady(){
   // postGrievanceInfo(postGrievanceModal);
  }

  postGrievanceInfo(PostGrievanceModal postGrievanceModal) async  {
    await PostGrievanceRepo.postGrievanceData(
    int.parse(" ${data.read('profileId')}"),
      "", 
      int.parse(selectedDistrictValue!),
      int.parse(selectedTalukaValueG!),
       0,
      int.parse(selectedVillageValueG!),
      int.parse(selectedDepartmentValue!),
      int.parse(selectedOfficeValue!),
     int.parse(selectedNatureValue!),
      description.text,
      1,
      profileName!,
      MobileNumber!,
      Email!,
    int.parse("${data.read('profileId')}"),
      1,
     imagesDoc,
    );


  }



}
