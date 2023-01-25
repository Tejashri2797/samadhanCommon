import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Modal/pendancy_report_modal.dart';
import '../Repository/pendancy_report_repo.dart';

class PendancyReportVM extends GetxController {
  List<PendancyReportModal> pendancyReportList = [];

  var isLoading = true.obs;


  pendancyDetails(String deptId, String id, String startDate, String endDate) async {
    var details = await PendancyReportRepo.pendancyReport(deptId,id, startDate, endDate);
    print("++++++$details");
    if (details != null) {
      pendancyReportList = details;

      isLoading.value = false;
    }

  }
}