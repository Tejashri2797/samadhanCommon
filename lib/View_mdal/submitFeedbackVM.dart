



import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Modal/SubmiteFeedBack.dart';
import '../Repository/submitFeedbackRepo.dart';


String? GrId;
String? date4;
class SubmitFeedbackVM extends GetxController{
  List<SubmitFeedbackModal>  feedbackList=[];
  RxBool isLoading = true.obs;
  @override
  void onInit(){
    super.onInit();
    //feedbackGrievanceList();
  }

 feedbackGrievanceList(String createdBy)async{
    var grievanceDetails =await SubmitFeedbackRepo.feedbackGrievanceData(createdBy);
    print(grievanceDetails);
    if(grievanceDetails != null){
      feedbackList=grievanceDetails;
      isLoading.value = false;
    }
   else if(grievanceDetails == null){

      isLoading.value = false;
    }

    feedbackList.forEach((element) {
      GrId=element.grievanceId.toString();
      date4 = DateFormat('dd/MM/yyyy').format(DateTime.parse(element.submissionDateAndTime.toString()));
    });




  }

}