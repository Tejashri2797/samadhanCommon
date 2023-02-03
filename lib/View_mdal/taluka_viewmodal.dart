import 'package:get/get.dart';

import '../Modal/district_modal.dart';
import '../Modal/taluka_modal.dart';
import '../Repository/DistrictRepository.dart';
import '../Repository/taluka_repository.dart';

String? id;

class TalukaViewModal extends GetxController{
  List<TalukaModalClass>  talukaList=[];
  var isLoading =true.obs;
  @override
  void onInit(){
    super.onInit();
  // getAllTaluka();

  }

  getAllTaluka()async{
    var talukaDetails =await TalukaRepository.getTalukaData();
    print(talukaDetails);
    if(talukaDetails != null){
      talukaList=talukaDetails;

      isLoading.value=false;
    }




  }
}