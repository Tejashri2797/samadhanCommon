
import 'package:get/get.dart';
import 'package:samadhan/Repository/get_office_by_deptid.dart';
import '../Modal/get_office_modalclass.dart';

class GetOfficeByIdViewModal extends GetxController {

  List<GetOfficeByDeptId> grievanceOfficeList =[] ;
  var isLoading = true.obs;

  getOfficeByDepartment(String value)async{
    var officeList = await GetOfficeByDeptIdRepo.getOfficeById(value);
    print(officeList);
    if(officeList != null){
      grievanceOfficeList = officeList;
      isLoading.value = false;
    }
   print(grievanceOfficeList);
  }
}