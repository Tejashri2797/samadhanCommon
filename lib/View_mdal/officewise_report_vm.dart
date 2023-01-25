
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Modal/officewise_report_modal.dart';
import '../Repository/officewise_report_repo.dart';

class OfficeWiseReportVm extends GetxController {
  List<OfficeReportModal> officeReportList = [];

  var isLoading = true.obs;


  officeDetails(String deptId,String officeId, String id, String startDate, String endDate) async {
    var details = await OfficeWiseReportRepo.officeReport(deptId,officeId,id, startDate, endDate);
    print("++++++$details");
    if (details != null) {
      officeReportList = details;

      isLoading.value = false;
    }

  }
}