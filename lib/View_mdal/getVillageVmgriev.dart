import 'package:get/get.dart';


import '../Modal/getVillageModalgriev.dart';
import '../Repository/getVillageRepoGriev.dart';


//VillageRepository villageRepository=VillageRepository();
class VillageViewModal extends GetxController{
  List<VillageModalClass>  villageList=[];
  var isLoading =true.obs;

  @override
  void onInit()  {
    super.onInit();
    //getAllVillage(selectedTalukaValue!);
  }

  getAllVillage(String talukaId)async{
    var villageDetails =await VillageRepository.getVillageData(talukaId);

    if(villageDetails != null){
     villageList=villageDetails;
      isLoading.value=false;
    }

  }
}