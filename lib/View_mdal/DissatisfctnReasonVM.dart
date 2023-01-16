



import 'package:get/get.dart';

import '../Modal/feedbackDissatisfactn.dart';
import '../Modal/track_grievance_list.dart';
import '../Repository/feedback_dissatisfactn_repo.dart';
import '../Repository/track_grievance_list.dart';

class DissatisfactionReasonVM extends GetxController{
  List<DisatisfactionReason>  reasonList=[];
  var isLoading =true.obs;
  @override
  void onInit(){
    super.onInit();
    disatisfactnreasonList();
  }

  disatisfactnreasonList()async{
    var reasonDeatils =await DisSatisfactionReasonRepo.dissatifactionReason();
    print(reasonDeatils);
    if(reasonDeatils != null){
      reasonList=reasonDeatils;isLoading.value=false;
    }



  }

}