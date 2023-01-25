import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Modal/StatusModal.dart';
import '../Repository/status_repo.dart';

class StatusVM extends GetxController {
  List<StatusModal> statusList = [];

  var isLoading = true.obs;


    statusDetails() async {
    var details = await StatusRepo.statusReport();
    print("++++++$details");
    if (details != null) {
      statusList = details;

      isLoading.value = false;
    }

  }
}