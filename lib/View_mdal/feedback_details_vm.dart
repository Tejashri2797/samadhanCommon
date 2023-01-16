import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:samadhan/View_mdal/submitFeedbackVM.dart';

import '../Modal/feedback_detailModal.dart';
import '../Repository/feedbackDetailsRepo.dart';

String? GrNo;
String? GrievanceId;
String? department;
String? office;
String? userName;
String? mob;
String? Email;
String? district;
String? taluka;
String? village;
String? natureOfG;
String? details;
DateTime? date;
List<CitizenGrievanceImage> uploadedFile=[];
String? docPath;



class FeedbackDetailsVM extends GetxController{
  List<FeedbackDetailsModal>  feedbackDetailsList=[];
  var isLoading =true.obs;
  @override
  void onInit(){
    super.onInit();
   // feedbackDetails(GrId!);
  }

  feedbackDetails(String id)async{
    var details =await FeedbackDetailsRepo.feedbackDetailsData(id);
    print(details);
    if(details != null){
      feedbackDetailsList=details;

      isLoading.value=false;
    }
    for (var value in feedbackDetailsList) {
      GrNo= value.grievanceNo;
      department= value.departmentName;
      office = value.officeName;
      userName = value.name;
      mob = value.userMobileNo;
      Email = value.userEmailId;
      district = value.district;
      taluka =  value.taluka;
      village =  value.village;
      natureOfG=  value.natureofGrievance;
      details=  value.grievanceDescription;
      date = value.grievanceSubmissionDate;

    }



  }

}