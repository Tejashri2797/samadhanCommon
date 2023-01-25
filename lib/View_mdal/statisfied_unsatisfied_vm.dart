import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Modal/satisfied_unstatisfied_report.dart';
import '../Repository/satisfied_unsatisfied_repo.dart';

class SatisfactionReportVM extends GetxController {
  List<SatisfiedUnSReportModal> satisReportList = [];

  var isLoading = true.obs;


 satisfiedDetails(String deptId, String id, String startDate, String endDate) async {
    var details = await StatisfiedUnsatisfiedRepo.satisfiedReport(deptId,id, startDate, endDate);
    print("++++++$details");
    if (details != null) {
      satisReportList = details;

      isLoading.value = false;
    }

  }
}