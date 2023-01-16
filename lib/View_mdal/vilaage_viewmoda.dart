import 'package:get/get.dart';
import 'package:samadhan/View/SignUp.dart';

import '../Modal/district_modal.dart';
import '../Modal/taluka_modal.dart';
import '../Modal/village_modal.dart';
import '../Repository/DistrictRepository.dart';
import '../Repository/taluka_repository.dart';
import '../Repository/village_repository.dart';

int? talukaId;

//VillageRepository villageRepository=VillageRepository();
class VillageViewModal extends GetxController{

List<VillageModalClass> villageList = [];
List<VillageModalClass> villageListPG = [];

  final isLoading =true.obs;

  @override
  void onInit()  {
    super.onInit();
    //getAllVillage(selectedTalukaValue!);
  }

  getAllVillage(String talukaId)async{
    var villageDetails =await VillageRepository.getVillageData(talukaId);

    if(villageDetails != null){
     villageList = villageDetails;
      isLoading.value = false;
    }


    if(villageDetails != null){
      villageListPG = villageDetails;
      isLoading.value = false;
    }


    print(villageList[0].village);



  }
}