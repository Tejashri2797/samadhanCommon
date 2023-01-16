
import 'package:get/get.dart';
import 'package:samadhan/Repository/notification%20Repo.dart';
import 'package:samadhan/View_mdal/postotp_viewModal.dart';

import '../Modal/notification_modal.dart';

NotificationRepo notificationRepo = NotificationRepo();
int? isReadCount;
class NotificationViewModal extends GetxController{
  List<NotificationModal> notificationList=[];
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
  //  getallNotification(userId.toString());
  }

  getallNotification(String? id) async {
    var notificationDetails = await NotificationRepo.getNotificationCount(id!);
    print(notificationDetails);
    if(notificationDetails != null){
      notificationList = notificationDetails;
      isLoading.value=false;
    }
    notificationList.forEach((element) {
      isReadCount = element.isReadcount!;
    });
    print(notificationList);
  }
}