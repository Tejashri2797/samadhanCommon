import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Modal/department_report_details.dart';
import '../Repository/dept_report_details.dart';


class DeptReportVm extends GetxController {
  List<DeptReportDetailsModal> deptReport = [];

  var isLoading = true.obs;


  deptDetails(String deptId, String id, String startDate, String endDate) async {
    var details = await DeptReportDetailRepo.deptReport(deptId,id, startDate, endDate);
    print("++++++$details");
    if (details != null) {
      deptReport = details;

      isLoading.value = false;
    }

  }
}