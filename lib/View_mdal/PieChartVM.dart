import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Modal/PicChartData.dart';
import '../Repository/PieChartRepo.dart';

int? count1 ;
int? count2;
int? count3;
int? count4;
int? count5;
int? total;
class PicChartVM extends GetxController{
  List<PicChartModalClass> chartData=[];

  var isLoading =true.obs;
  @override
  void onInit(){
    super.onInit();
   // chartDetails();
  }

  chartDetails(String id,String startDate,String endDate)async{
    var details = await PicChartRepo.pieChartData(id,startDate,endDate);
print(details);
    if(details != null){

      chartData =  details;

      isLoading.value=false;
    }
     count1 = chartData[0].count;
      print(count1);
      count2 = chartData[1].count;
      count3 = chartData[2].count;
      count4 = chartData[3].count;
      count5 = chartData[4].count;
      total= chartData[0].totalcount;





}}