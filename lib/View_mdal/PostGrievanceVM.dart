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
      selectedTalukaIndex!,
       0,
      selectedVillageIndex!,
      selectedDepartmentIndex!,
      selectedOfficeIndex!,
      selectdNatureIndex!,
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
