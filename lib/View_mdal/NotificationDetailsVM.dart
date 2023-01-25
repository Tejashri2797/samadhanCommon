





import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Modal/NotificationDetails.dart';
import '../Repository/NotificationDetailsRepo.dart';
String? notifications;
class NotificatinDetailsVM extends GetxController{
  List<NotificationDetailModal> notificationList=[];

  var isLoading =true.obs;
  @override
  void onInit(){
    super.onInit();
    //getGrievanceList(GId!);
  }

  notificationData(String id)async{
    var details = await NotificationDetailsRepo.notificationData(id);

    if(details != null){

      notificationList =  details;

      isLoading.value=false;
    }

  }

}