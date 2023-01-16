
import 'package:get/get.dart';

import '../Modal/NatureGrievance_Modal.dart';
import '../Repository/NatureGrievance_Repo.dart';

NatureRepository natureRepository = NatureRepository();


class NatureViewModal extends GetxController{
  List<NatureModalClass> natureList=[];
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
    getNatureGrievance();
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