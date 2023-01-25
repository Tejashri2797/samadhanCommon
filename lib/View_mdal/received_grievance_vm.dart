import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Modal/received_grievance_modal.dart';
import '../Repository/grievance_received_repo.dart';


class GrievanceReceivedVM extends GetxController {
  List<ReceivedGrievanceModal> grReceivedDetails = [];

  var isLoading = true.obs;


    grDetails(String userId,String statusId,String date,String textsearch) async {
    var details = await GrievanceReceivedRepo.grReceivedDetails(userId,statusId, date, textsearch);
    print("++++++$details");
    if (details != null) {
      grReceivedDetails = details;

      isLoading.value = false;
    }

  }
}