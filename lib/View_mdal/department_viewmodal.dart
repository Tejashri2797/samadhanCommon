


import 'package:get/get.dart';

import '../Modal/department_modal.dart';
import '../Repository/DepartmentRepo.dart';


DepartmentRepo departmentRepo = DepartmentRepo();

class officerDepartmentVM extends GetxController{
  List<DepartmentModalClass> departmentList=[];
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
    getDepartment();
  }


  getDepartment() async {
    var departmentData = await departmentRepo.getDepartmentApi();
    if(departmentData != null){
      departmentList = departmentData;
      isLoading.value= false;
    }

  }
}