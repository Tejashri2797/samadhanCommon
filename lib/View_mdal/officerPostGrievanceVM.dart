
import 'package:get/get.dart';
import 'package:samadhan/Repository/officerPostGrievanceRepo.dart';

import '../Modal/officerPostGrievanceModal.dart';
import '../View/post_grievance.dart';



class PostGrievanceVM extends GetxController {

   List<OfficerCitizenGrievanceImage> citizenGrievanceImages = [];
  OfficerPostGrievanceModal postGrievanceModal = OfficerPostGrievanceModal();
  var isLoading = true.obs;

  @override
  void onReady(){
   // postGrievanceInfo(postGrievanceModal);
  }


  postGrievanceInfo(OfficerPostGrievanceModal postGrievanceModal) async  {
    await PostGrievanceRepo.postGrievanceData(
      113,
      "",
      int.parse(selectedDistrictValue!),
      int.parse(selectedTalukaValue!),
       0,
      int.parse(selectedVillageValue!),
      int.parse(selectedDepartmentValue!),
      int.parse(selectedOfficeValue!),
      int.parse(selectedNatureValue!),
      description.text,
      0,
      "",
      "",
      "",
      0,
      1,
      postImageList,
    );


  }



}
class PostGrievanceVM1 extends GetxController {

   List<OfficerCitizenGrievanceImage> citizenGrievanceImages = [];
  OfficerPostGrievanceModal postGrievanceModal = OfficerPostGrievanceModal();
  var isLoading = true.obs;

  @override
  void onReady(){
   // postGrievanceInfo(postGrievanceModal);
  }


  postGrievanceInfo1(OfficerPostGrievanceModal postGrievanceModal) async  {
    await PostGrievanceRepo.postGrievanceData(
      113,
      "",
      int.parse(selectedDistrictValue1!),
      int.parse(selectedTalukaValue1!),
       0,
      int.parse(selectedVillageValue1!),
      int.parse(selectedDepartmentValue1!),
      int.parse(selectedOfficeValue1!),
      int.parse(selectedNatureValue1!),
      description1.text,
      1,
      postname.text,
      postmobile.text,
      postaddress.text,
      0,
      1,
      postImageList1,
    );

  }

}