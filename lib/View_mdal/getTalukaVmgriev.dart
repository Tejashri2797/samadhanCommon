import 'package:get/get.dart';

import '../Modal/getTalukaModalgriev.dart';
import '../Repository/getTalukaRepoGriev.dart';




String? id;

TalukaRepository talukaRepository=TalukaRepository();
class TalukaViewModalOfficer extends GetxController{
  List<TalukaModalClass>  talukaList=[];
  var isLoading =true.obs;
  @override
  void onInit(){
    super.onInit();
    // getAllTaluka();

  }

  getAllTaluka()async{
    var talukaDetails =await talukaRepository.getTalukaData();
    print(talukaDetails);
    if(talukaDetails != null){
      talukaList=talukaDetails;

      isLoading.value=false;
    }

    for (var value in talukaList) {
      id=value.id.toString();

    }

  }
}