


import 'package:get/get.dart';
import 'package:samadhan/Repository/getGreivance_Resolved%20Repo.dart';

import '../Modal/get_grievanceModal.dart';

ResolvedRepository resolvedRepository = ResolvedRepository();

class ResolvedViewModal extends GetxController{
  List<GetGrievanceResolvedModal> resolvedList=[];
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
    getResolved();
  }

  getResolved() async {
    var resolvedData = await resolvedRepository.getResolveddata();
    print(resolvedData);
    if(resolvedData != null){
      resolvedList = resolvedData;
      isLoading.value= false;
    }
    print(resolvedList);
  }
}