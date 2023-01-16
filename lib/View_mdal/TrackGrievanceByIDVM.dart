




import 'package:get/get.dart';
import 'package:samadhan/View/SignUp.dart';
import 'package:samadhan/View_mdal/track_grievance_list_vm.dart';
import '../Modal/track_grievance_byid.dart';
import '../Repository/TrackGrievanceByIdRepo.dart';
import '../View/TrackGrievance.dart';

String? GrievanceId;
String? department;
String? office;
String? userName;
String? mob;
String? Email;
String? district;
String? taluka;
String? village;
String? natureOfG;
String? details;
DateTime? date;
List<CitizenGrievanceImage> uploadedFile=[];
String? docPath;
String? status;

TrackGrievanceByIdRepo trackGrievanceByIdRepo=TrackGrievanceByIdRepo();

class TrackGrievanceByIDVM extends GetxController{
 List<TrackGrievanceByIdModal>  grievanceList2=[];

  var isLoading =true.obs;
  @override
  void onInit(){
    super.onInit();
    //getGrievanceList(GId!);
  }

  getGrievanceList(String id)async{
    var grievanceDetails = await TrackGrievanceByIdRepo.grievanceListData(id);
    print(grievanceDetails);
    if(grievanceDetails != null){

      grievanceList2 =  grievanceDetails;

      isLoading.value=false;
    }
  for (var element in grievanceList2) {
   GrievanceId = element.grievanceNo ;
   department = element.departmentName;
   office = element.officeName;
   userName = element.name;
   mob = element.userMobileNo;
   Email =element.userEmailId;
   district =element.district;
   taluka = element.taluka;
   village =element.village;
   natureOfG= element.natureofGrievance;
   details= element.grievanceDescription;
   date= element.grievanceSubmissionDate;
   uploadedFile = element.citizenGrievanceImages!;
   status=element.status;

   print(uploadedFile);
   print(GrievanceId);
    print(element.name);

  }
    uploadedFile.forEach((element) {
      docPath= element.docpath;
      print(element.docpath);
    });


  }

}