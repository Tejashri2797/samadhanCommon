
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Modal/PostGrievanceModal.dart';
import '../Modal/SubmitFeedBackModal.dart';
import '../Repository/PostFeedBackRepo.dart';
import '../Repository/PostGrievanceRepo.dart';
import '../View/PostGrievance.dart';

class PostFeedBackVM extends GetxController {

  List<PostFeedbackModal> feedBack = [];

  var isLoading = true.obs;

  @override
  void onReady(){
    // postGrievanceInfo(postGrievanceModal);
  }

  postFeedbackInfo(PostFeedbackModal postFeedbackModal) async  {
    await PostFeedBackRepo.postData(
        1,
       112,
        "comment",
        0,
        0 ,
        1
    );


  }



}