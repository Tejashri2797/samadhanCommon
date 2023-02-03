
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../Modal/SubmitFeedBackModal.dart';
import '../Repository/PostFeedBackRepo.dart';
import '../View/OTPTabbar.dart';
import '../View/SubmitFeedback1.dart';
import 'feedback_details_vm.dart';

class PostFeedBackVM extends GetxController {

  List<PostFeedbackModal> feedBack = [];

  var isLoading = true.obs;

  @override
  void onReady(){
    // postGrievanceInfo(postGrievanceModal);
  }

  feedbackSatisfied(PostFeedbackModal postFeedbackModal) async  {
    await PostFeedBackRepo.postData(
        0,
        GrievanceId!.toString(),
        commentController.text,
        1,
        0 ,
        data.read('profileId')
    );


  }
  feedbackDisSatisfied(PostFeedbackModal postFeedbackModal) async  {
    await PostFeedBackRepo.postData(
       0,
       GrievanceId!.toString(),
        commentController.text,
        1,
        int.parse(reason!) ,
        data.read('profileId')
    );


  }




}