import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:samadhan/View/DashboardScreen.dart';

import '../View_mdal/NotificationDetailsVM.dart';



class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificatinDetailsVM = Get.put(NotificatinDetailsVM());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFb83058),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
            child: Container(
              decoration: BoxDecoration(
                color:Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 15,
                right: MediaQuery.of(context).size.width / 15,
                top: MediaQuery.of(context).size.height / 8),
            child: Container(
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        // blurStyle:BlurStyle.outer,
                       // blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 5)),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child:Obx(()=>(notificationViewModal.isLoading.value == true) ?Text('')
                  : ListView.separated(
                    itemCount: notificatinDetailsVM.notifictn.length,
                      itemBuilder: (context,index)=>Padding(
                        padding: const EdgeInsets.only(left: 7, right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  // blurStyle:BlurStyle.outer,
                                  // blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 2)),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black12,width: 2)
                          ),
                          child: ListTile(
                            leading: SvgPicture.asset(
                                'assets/Notification Alert.svg'),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:  [
                                SizedBox(
                                  height: 10,
                                ),

                                Text(
                                  notificatinDetailsVM.notifictn[index].description!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Montserrat-Regular',
                                      color: Colors.grey.shade600
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(( notificatinDetailsVM.notifictn[index].notificationDate).toString()!)),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      color: Colors.grey.shade600
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                // SizedBox(height: MediaQuery.of(context).size.height/5,),
                              ],
                            ),
                          ),
                        ),
                      ), separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                      color: Colors.white,
                        height: 20,
                      );
                  },
                  ),
                )
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
    );
  }
}
