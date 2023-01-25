import 'package:get/get.dart';
import '../Modal/getDepartmentModalgriev.dart';
import '../Repository/getDepartmentRepoGriev.dart';


DepartmentRepository districtRepository=DepartmentRepository();
class OfficerDepartment extends GetxController{
  List<OfficerDepartmentModal>  departmentList=[];
  var isLoading =true.obs;
  @override
  void onInit(){
    super.onInit();
    // getAllDepartment();
  }

  getAllDepartment()async{
    var departmentDetails =await districtRepository.getDepartmentData();
    print(departmentDetails);
    if(departmentDetails != null){
      departmentList=departmentDetails;
      isLoading.value=false;
    }
    print(departmentList);
  }
}