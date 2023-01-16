



import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Modal/track_grievance_search.dart';
import '../Repository/TrackGrievanceSearchRepo.dart';
import '../Repository/track_grievance_list.dart';
int? GriId;
String? GrievanceNo;
String? Department;
String? Status;
String? date3;
bool responseData =true;
class TrackGrievanceSearchVM extends GetxController{
  List<TrackGrievanceSearchdModal>  grievanceList1=[];
  var isLoading =true.obs;
  @override
  void onInit(){
    super.onInit();
   // grievanceSearch();
  }

  grievanceSearch(String para)async{
    var grievanceDetails = await TrackGrievanceSearchRepo.grievanceSearchData(para);
    print("---$grievanceDetails");
    if(grievanceDetails != null){
      grievanceList1=grievanceDetails;

      isLoading.value=false;
    }
    else if(grievanceDetails ==  null){
      responseData= false;
    }
    print( grievanceList1.length);
    grievanceList1.forEach((element) {
      GrievanceNo=element.grievanceNo;
      GriId=element.grievanceId;
      Department= element.departmentName;
      Status = element.status;
      date3 =DateFormat('dd/MM/yyyy').format(DateTime.parse(element.grievanceSubmissionDate.toString()));

      print(element.name);

    });

  }

}