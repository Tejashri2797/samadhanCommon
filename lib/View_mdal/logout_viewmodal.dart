import 'package:get/get.dart';


import '../Repository/logout_repo.dart';



class LogoutViewModal extends GetxController {
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
   // logoutCurrentUser();

  }
  logoutCurrentUser(int? userId) async {

   await LogoutRepo.logout(0, userId!);
  }
}
