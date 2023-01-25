import 'package:get/get.dart';

import '../Modal/getNatureModalgriev.dart';
import '../Repository/getNatureRepoGriev.dart';





NatureRepository natureRepository = NatureRepository();


class OfficerNatureViewModal extends GetxController{
  List<NatureModalClass> natureList=[];
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
    // getNatureGrievance();
  }
  getNatureGrievance() async {
    var natureData = await natureRepository.getNatureApi();
    print(natureData);
    if(natureData != null){
      natureList = natureData;
      isLoading.value= false;
    }
    print(natureList);
  }
}