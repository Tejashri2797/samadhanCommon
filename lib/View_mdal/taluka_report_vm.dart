import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Modal/taluka_report_modal.dart';
import '../Repository/taluka_report_repo.dart';

class TalukaReportVm extends GetxController {
  List<TalukaReportModal> talukaReport = [];

  var isLoading = true.obs;


 talukaDetails(String talukaId, String id, String startDate, String endDate) async {
    var details = await TalukaReportRepo.talukaReport(talukaId,id, startDate, endDate);
    print("++++++$details");
    if (details != null) {
      talukaReport = details;

      isLoading.value = false;
    }

  }
}