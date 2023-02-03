import 'dart:async';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:samadhan/Modal/StatusModal.dart';
import '../Utility/CommonString.dart';
import '../View_mdal/TrackGrievanceByIDVM.dart';
import '../View_mdal/TrackGrievanceSearchVM.dart';
import '../View_mdal/status_vm.dart';
import '../View_mdal/track_grievance_list_vm.dart';
import '../main.dart';
import 'OTPTabbar.dart';

class TrackGrievance extends StatefulWidget {
  const TrackGrievance({Key? key}) : super(key: key);

  @override
  State<TrackGrievance> createState() => _TrackGrievanceState();
}
TextEditingController search =TextEditingController();
final trackGrievanceVM= Get.put(TrackGrievanceListVM());
final trackGrievanceSearchVM= Get.put(TrackGrievanceSearchVM());
final statusVM = Get.put(StatusVM());
TrackGrievanceByIDVM trackGrievanceByIDVM=TrackGrievanceByIDVM();
String? statusId;

class _TrackGrievanceState extends State<TrackGrievance> {
  @override
   void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      trackGrievanceByIDVM.grievanceList2.clear();
      statusVM.statusList.clear();
      statusVM.isLoading.value = true;
      statusVM.statusDetails();
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            trackGrievanceVM.grievanceList.clear();
            trackGrievanceVM.isLoading.value = true;
           Timer(Duration(seconds: 1), () {
             Get.back();
           });
            return false;
          },
          child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(()=>
           ModalProgressHUD(
             color: Colors.black,
             inAsyncCall:trackGrievanceVM.isLoading.value,
             progressIndicator: Container(
               decoration: BoxDecoration(
                   color: Colors.black45,
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
             child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll){
                  overScroll.disallowIndicator();
                  return true;
                },
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.8,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xFFb83058),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {
                                  trackGrievanceSearchVM.grievanceList1.clear();
                                  trackGrievanceVM.grievanceList.clear();
                                  trackGrievanceVM.isLoading.value = true;
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                )),
                             Text('trackGrievance'.tr,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Montserrat'))
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 13,
                          right: 13,
                          top: MediaQuery.of(context).size.height /12,
                          bottom: 15),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 6,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 13.0, right: 10),
                          child: ListView(
                          //  crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                               Text('search'.tr,
                                  style:const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Montserrat')),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: SizedBox(
                                      height: 40,
                                      child: TextFormField(
                                        controller: search,
                                        cursorHeight: 20,
                                        cursorColor: const Color(0xFFb83058),
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20,
                                        ),
                                        decoration: InputDecoration(
                                            focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFb83058))),
                                            hintText: "OS/20221007-1",
                                            hintStyle: const TextStyle(
                                                height: 1,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black26,
                                                fontFamily: 'Montserrat',
                                                fontStyle: FontStyle.normal),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: const BorderSide(
                                                    color: Colors.black12, width: 4))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: PopupMenuButton(


                                        onSelected: (value) {
                                         return setState(() {
                                            statusId = value;
                                            print(statusId);
                                            trackGrievanceVM.grievanceList.clear();
                                            trackGrievanceVM.isLoading.value = true;
                                            trackGrievanceVM.trackGrievanceList(statusId!,"${data.read('profileId')}");
                                          });

                                        },
                                        itemBuilder: (context){
                                          return
                                            statusVM.statusList.map((StatusModal choice) {
                                              return PopupMenuItem(
                                                  value: choice.id.toString(),
                                                  child: Column(
                                                    children: [

                                                      (langSelection =="Marathi" || selectedLanguage == "Marathi")?
                                                  Text(choice.mName.toString(),style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black54,
                                                    fontFamily: 'Montserrat Bold',
                                                    //fontStyle: FontStyle.normal
                                                  )):
                                                      Text(choice.name.toString(),style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w400,
                                                        color: Colors.black54,
                                                        fontFamily: 'Montserrat Bold',
                                                        //fontStyle: FontStyle.normal
                                                      ),),
                                                      Divider(
                                                        thickness: 2,
                                                        color: Colors.grey.shade100,
                                                      )
                                                    ],
                                                  )
                                              );
                                            }).toList();
                                        },
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: const Color(0xFFb83058),
                                           child: CircleAvatar(
                                                radius: 14,
                                                backgroundColor: Colors.white,
                                                child: SvgPicture.asset("assets/filter.svg",
                                                    height: 15),
                                              ),
                                            ),
                                      ),
                                        ),

                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MaterialButton(
                                height: 40,
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () async {
                                  await trackGrievanceSearchVM.grievanceSearch(search.text);
                                  (responseData == true)? Get.toNamed("/TrackGrievanceSearch"):
                                  {
                                    AnimatedSnackBar.material(
                                      'Records not found...',
                                      type: AnimatedSnackBarType.info,
                                      mobileSnackBarPosition: MobileSnackBarPosition
                                          .bottom,
                                      desktopSnackBarPosition:
                                      DesktopSnackBarPosition.bottomLeft,
                                    ).show(context),
                                    trackGrievanceSearchVM.grievanceList1.clear(),
                                    responseData=true,

                                  };

                                  search.clear();


                                },
                                color: const Color(0xFFb83058),
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(7)),
                                child:  Text(
                                  'search'.tr,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height/1.56,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(30),

                                ),
                                child:ListView.builder(
                                  scrollDirection: Axis.vertical,
                                    itemCount: trackGrievanceVM.grievanceList.length,
                                      itemBuilder: (BuildContext context,
                                              int index) =>
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0,right: 1,bottom: 5),
                                            child: GestureDetector(
                                              onTap: () async {
                                                await trackGrievanceByIDVM.getGrievanceList((trackGrievanceVM.grievanceList[index].grievanceId)!.toString());
                                                trackGrievanceByIDVM.grievanceList2.clear();
                                                Get.toNamed("/TrackGrievanceViewPage");
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(left:4.0,right: 4),
                                                child: Container(
                                                  height:
                                                      MediaQuery.of(context).size.height /4.8,
                                                  width:
                                                      MediaQuery.of(context).size.width,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(16),
                                                    boxShadow:  const [
                                                      BoxShadow(
                                                        color: Colors.black26,
                                                         blurRadius: 5,
                                                        spreadRadius: 2, //extend the shadow

                                                      )
                                                    ],

                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          height: MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.2,
                                                          decoration: const BoxDecoration(
                                                              color: Color(0xFFb83058),
                                                              borderRadius:
                                                                  BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(16),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              16))),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Text("${index + 1}",
                                                                  style: const TextStyle(
                                                                      fontSize: 30,
                                                                      color: Colors.white,
                                                                      fontFamily:
                                                                          'Montserrat-Medium')),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(( trackGrievanceVM.grievanceList[index].grievanceSubmissionDate!).toString()!)),
                                                                  style: const TextStyle(
                                                                      fontSize: 13,
                                                                      color: Colors.white,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontFamily:
                                                                          'Montserrat')),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8.0,
                                                              top: 7),
                                                          child: Container(
                                                            height: MediaQuery.of(context).size.height /2.3,
                                                            decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        7)),
                                                            child: Column(

                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const SizedBox(height: 10,),
                                                                Row(
                                                                  children:  [
                                                              Text("grievance_id".tr,
                                                                        style: const TextStyle(
                                                                            fontSize: 14,
                                                                            color: Colors.black54,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .w400,
                                                                            fontFamily:
                                                                                'Montserrat')),
                                                                    const Spacer(),
                                                                    GestureDetector(
                                                                      onTap: () async {
                                                                        await trackGrievanceByIDVM.getGrievanceList((trackGrievanceVM.grievanceList[index].grievanceId)!.toString());
                                                                        trackGrievanceByIDVM.grievanceList2.clear();
                                                                        Get.toNamed("/TrackGrievanceViewPage");
                                                                      },
                                                                      child: Text(
                                                                        "view".tr,
                                                                        style: const TextStyle(
                                                                          fontSize: 13,
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w500,
                                                                          color: Colors
                                                                              .transparent,
                                                                          shadows: [
                                                                            Shadow(
                                                                                offset:
                                                                                    Offset(
                                                                                        0,
                                                                                        -5),
                                                                                color: Colors
                                                                                    .blue)
                                                                          ],
                                                                          // Step 3 SEE HERE
                                                                          decoration:
                                                                              TextDecoration
                                                                                  .underline,
                                                                          decorationColor:
                                                                              Colors.blue,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 4,
                                                                ),
                                                                 Text(
                                                                 trackGrievanceVM.grievanceList[index].grievanceNo!,
                                                                  style: const TextStyle(
                                                                      height: 1,
                                                                      fontSize: 15,
                                                                      color: Colors.black,
                                                                      fontFamily:
                                                                          'Montserrat-Medium',
                                                                      fontStyle: FontStyle
                                                                          .normal),
                                                                ),
                                                                const SizedBox(
                                                                  height: 8,
                                                                ),
                                                               Text("dept".tr,
                                                                    style: const  TextStyle(
                                                                        fontSize: 14,
                                                                        color: Colors
                                                                            .black54,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Montserrat')),
                                                                const SizedBox(
                                                                  height: 4,
                                                                ),

                                                               ( trackGrievanceVM.grievanceList[index].departmentName==null)?Text("")
                                                                :Text(
                                                                   ( trackGrievanceVM.grievanceList[index].departmentName)!,
                                                                  style: const TextStyle(
                                                                      height: 1,
                                                                      fontSize: 15,
                                                                      color: Colors.black,
                                                                      fontFamily:
                                                                          'Montserrat-Medium',
                                                                     ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 8,
                                                                ),
                                                                 Text("status".tr,
                                                                    style:const TextStyle(
                                                                        fontSize: 14,
                                                                        color: Colors
                                                                            .black54,
                                                                        fontFamily:
                                                                            'Montserrat')),
                                                                const SizedBox(
                                                                  height: 2,
                                                                ),
                                                                (trackGrievanceVM.grievanceList[index].status==null)?Text(''):
                                                                Text(
                                                                  (trackGrievanceVM.grievanceList[index].status)!,
                                                                  style: TextStyle(
                                                                      height: 1,
                                                                      fontSize: 16,
                                                                      color: (trackGrievanceVM.grievanceList[index].status == "Open")?Colors.purpleAccent.shade200:
                                                                      (trackGrievanceVM.grievanceList[index].status == "Transferred")?Color(0xffff69b4):
                                                                        (trackGrievanceVM.grievanceList[index].status == "Partial Resolved")?Colors.blueAccent.shade200
                                                                      :Colors.red,
                                                                      fontFamily:
                                                                          'Montserrat-Medium',
                                                                    ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),

                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
           ),
      ),
      ),
        ),
    );
  }
}
