import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:samadhan/View/DashboardScreen.dart';

import '../View_mdal/NotificationDetailsVM.dart';
import '../View_mdal/TrackGrievanceByIDVM.dart';
import 'OTPTabbar.dart';



class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificatinDetailsVM = Get.put(NotificatinDetailsVM());
  final trackGrievanceByIDVM =Get.put( TrackGrievanceByIDVM());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      notificatinDetailsVM.notificationList.clear();
      notificatinDetailsVM.isLoading.value = true;
      notificatinDetailsVM.notificationData("${data.read('profileId')}");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Obx(()=>
        ModalProgressHUD(
          color: Colors.black,
          inAsyncCall: notificatinDetailsVM.isLoading.value,
          progressIndicator: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)),
            height: 130,
            width: 130,
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: const [
                CircularProgressIndicator(
                  color: Color(0xFFb83058),
                ),
                Text(
                  "Please wait",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2.8,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFFb83058),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 18,
                    right: 18,
                    top: MediaQuery.of(context).size.height / 8),
                child: Container(
                    height: MediaQuery.of(context).size.height / 1.2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                           blurRadius: 5,
                           ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:  ListView.separated(
                          itemCount: notificatinDetailsVM.notificationList.length,
                            itemBuilder: (context,index)  =>Padding(
                              padding: const EdgeInsets.only(left: 13, right: 10,),
                              child: GestureDetector(
                           onTap: () async {
                           await  trackGrievanceByIDVM.getGrievanceList(notificatinDetailsVM.notificationList[index].greivanceId.toString());
                            trackGrievanceByIDVM.grievanceList2.clear();
                            Get.toNamed("/TrackGrievanceViewPage");
                           },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:(notificatinDetailsVM.notificationList[index].msgId == 4)?
                                      Colors.teal.shade50 :
                                      (notificatinDetailsVM.notificationList[index].msgId == 2)?
                                      Color(0xffFFFFE0)
                                      :Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: (notificatinDetailsVM.notificationList[index].msgId! == 4)?
                                        Colors.greenAccent.shade400
                                            : (notificatinDetailsVM.notificationList[index].msgId == 2)?
                                        Color(0xffBDB76B)
                                            :Colors.blue.shade600,
                                        width:1)
                                  ),
                                  child: ListTile(
                                    leading: Container(
                                      height: 40,
                                      width: 40,
                                        decoration: BoxDecoration(
                                          //color: Colors.white,
                                            color: (notificatinDetailsVM.notificationList[index].msgId! == 4)?
                                            Colors.greenAccent.shade400 :
                                            (notificatinDetailsVM.notificationList[index].msgId == 2)?
                                            Colors.orangeAccent
                                                :Colors.blue.shade600,
                                          borderRadius: BorderRadius.circular(14)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: SvgPicture.asset('assets/submit.svg',
                                            color:(notificatinDetailsVM.notificationList[index].msgId! == 4)?
                                            Colors.greenAccent.shade400:
                                              (notificatinDetailsVM.notificationList[index].msgId == 2)?
                                            Colors.orangeAccent
                                                : Colors.blue.shade600,
                                           // height:15,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    ),
                                    title: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children:  [
                                        const SizedBox(
                                          height: 3,
                                        ),

                                        Text(
                                          notificatinDetailsVM.notificationList[index].description!,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Montserrat-Medium',
                                              color: Colors.black
                                          ),
                                        ),

                                        Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(( notificatinDetailsVM.notificationList[index].notificationDate).toString())),
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Montserrat-Medium',
                                              color: Colors.black45
                                          ),
                                        ),


                                        // SizedBox(height: MediaQuery.of(context).size.height/5,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                            color: Colors.white,
                              height: 10,
                            );
                        },
                        ),
                    ),
                    ),


              Positioned(
                top: 50,
                left: 20,
                child: Row(
                  children: [
                    InkWell(
                        onTap:(){
                        Get.back();
                        },
                        child: const Icon(Icons.arrow_back_ios_sharp,size: 25,color:Colors.white)),
                    SizedBox(width: MediaQuery.of(context).size.width/25,),
                    Text('notification'.tr,style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Montserrat'
                    ),)
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
