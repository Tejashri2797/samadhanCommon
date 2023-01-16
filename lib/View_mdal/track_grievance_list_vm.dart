



import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Modal/track_grievance_list.dart';
import '../Repository/track_grievance_list.dart';
import '../View/OTPTabbar.dart';
String? GId;
String? date1;
class TrackGrievanceListVM extends GetxController{
  List<TrackGrievanceListModal>  grievanceList=[];
  var isLoading =true.obs;
  @override
  void onInit(){
    super.onInit();
   // getGrievanceList("${data.read('profileId')}");
  }

  getGrievanceList(String? createdBy)async{
    var grievanceDetails =await TrackGrievanceList.grievanceListData(createdBy!);
    print(grievanceDetails);
    if(grievanceDetails != null){
      grievanceList=grievanceDetails;

      isLoading.value=false;
    }
    print( grievanceList.length);
    grievanceList.forEach((element) {
      GId = element.grievanceId.toString();

      date1 = DateFormat('dd/MM/yyyy').format(DateTime.parse( element.grievanceSubmissionDate.toString()));




    });

  }

}