


import 'package:get/get.dart';

import '../Modal/department_report.dart';
import '../Repository/department_report_repo.dart';


class DepartmentListVM extends GetxController{
  List<ReportDepartmentModalClass> departmentList=[];
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
   // getDepartment();
  }


  getDepartment() async {
    var departmentData = await ReportDepartmentRepo.getDepartmentApi();
    if(departmentData != null){
      departmentList = departmentData;
      isLoading.value= false;
    }


  }
}