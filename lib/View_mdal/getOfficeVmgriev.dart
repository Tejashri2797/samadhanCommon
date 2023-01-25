import 'package:get/get.dart';

import '../Modal/getOfficeModalgriev.dart';
import '../Repository/getOfficeRepoGriev.dart';








class OfficeViewModal extends GetxController{
  List<OfficeModalClass> officeList=[];
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
    // getOfficeDropDown();
  }
  getOfficeDropDown(String deptId) async {
    var OfficeData = await OfficeRepository.getOfficeData(deptId);
    print(OfficeData);
    if(OfficeData != null){
      officeList = OfficeData;
      isLoading.value= false;
    }
    print(officeList);
  }
}