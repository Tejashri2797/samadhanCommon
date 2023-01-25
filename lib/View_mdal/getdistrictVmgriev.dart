import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Modal/getDistrictModalgriev.dart';
import '../Repository/getDistrictRepoGriev.dart';


DistrictRepository districtRepository=DistrictRepository();
class DistrictViewModal extends GetxController{
  List<DistrictModalClass>  districtList=[];
  var isLoading =true.obs;
  @override
  void onInit(){
    super.onInit();
    // getAllDistrict();
  }

  getAllDistrict()async{
    var districtDetails =await districtRepository.getDistrictData();
    print(districtDetails);
    if(districtDetails != null){
      districtList=districtDetails;
      isLoading.value=false;
    }
    print(districtList[0].district);
  }
}