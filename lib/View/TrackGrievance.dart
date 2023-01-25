
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


import '../Utility/PopUpMenuCommonStringClass.dart';
import '../View_mdal/TrackGrievanceByIDVM.dart';
import '../View_mdal/TrackGrievanceSearchVM.dart';
import '../View_mdal/track_grievance_list_vm.dart';

class TrackGrievance extends StatefulWidget {
  const TrackGrievance({Key? key}) : super(key: key);

  @override
  State<TrackGrievance> createState() => _TrackGrievanceState();
}
TextEditingController search =TextEditingController();
final trackGrievanceVM= Get.put(TrackGrievanceListVM());
final trackGrievanceSearchVM= Get.put(TrackGrievanceSearchVM());
TrackGrievanceByIDVM trackGrievanceByIDVM=TrackGrievanceByIDVM();

class _TrackGrievanceState extends State<TrackGrievance> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      trackGrievanceByIDVM.grievanceList2.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll){
            overScroll.disallowIndicator();
            return true;
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                      height: 15,
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
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat-Regular'))
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: MediaQuery.of(context).size.height / 9,
                      bottom: 25),
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
                      padding: const EdgeInsets.only(left: 16.0, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                           Text('enter_grievance_no'.tr,
                              style:const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Montserrat-Regular')),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: SizedBox(
                                  height: 45,
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
                                  child: CircleAvatar(
                                    radius: 22,
                                    backgroundColor: const Color(0xFFb83058),
                                    child:PopupMenuButton(
                                      onSelected: (value) {
                                        setState(() {
                                          value = value;
                                        });
                                      },
                                      itemBuilder: (context){
                                        return
                                          list.map((popupItem choice) {
                                            return PopupMenuItem(
                                                value: choice,
                                                child: Column(
                                                  children: [
                                                    Text(choice.name,style: const TextStyle(
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
                                        radius: 20,
                                        backgroundColor: Colors.white,
                                        child: SvgPicture.asset("assets/filter.svg",
                                            height: 25),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          MaterialButton(
                            height: 45,
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
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Montserrat-Regular'),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 1.76,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child:Obx(() => (trackGrievanceVM.isLoading.value == true)?Text("")
                              : ListView.builder(
                                  itemCount: trackGrievanceVM.grievanceList.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      Padding(
                                        padding: const EdgeInsets.only(top: 9.0),
                                        child: GestureDetector(
                                          onTap: () async {
                                            await trackGrievanceByIDVM.getGrievanceList((trackGrievanceVM.grievanceList[index].grievanceId)!.toString());
                                            trackGrievanceByIDVM.grievanceList2.clear();
                                            Get.toNamed("/TrackGrievanceViewPage");
                                          },
                                          child: Container(
                                            height:
                                                MediaQuery.of(context).size.height / 5,
                                            width:
                                                MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              border: Border.all(
                                                  color: Colors.grey.shade300),
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
                                                                    .circular(7),
                                                                bottomLeft:
                                                                    Radius.circular(
                                                                        7))),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text("${index + 1}",
                                                            style: const TextStyle(
                                                                fontSize: 30,
                                                                color: Colors.white,
                                                                fontWeight:
                                                                    FontWeight.w300,
                                                                fontFamily:
                                                                    'Montserrat-Regular')),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(( trackGrievanceVM.grievanceList[index].grievanceSubmissionDate!).toString()!)),
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors.white,
                                                                fontWeight:
                                                                    FontWeight.w300,
                                                                fontFamily:
                                                                    'Montserrat-Regular')),
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
                                                      height: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2.3,
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
                                                          Row(
                                                            children:  [
                                                              const Text("Grievance Id",
                                                                  style: TextStyle(
                                                                      fontSize: 12,
                                                                      color: Colors.black54,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily:
                                                                          'Montserrat-Regular')),
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
                                                            height: 2,
                                                          ),
                                                           Text(
                                                           trackGrievanceVM.grievanceList[index].grievanceNo!,
                                                            style: TextStyle(
                                                                height: 1,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                color: Colors.black,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontStyle: FontStyle
                                                                    .normal),
                                                          ),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                         Text("dept".tr,
                                                              style: const  TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Montserrat-Regular')),
                                                          const SizedBox(
                                                            height: 2,
                                                          ),

                                                         ( trackGrievanceVM.grievanceList[index].departmentName==null)?Text("Not Selected")
                                                          :Text(
                                                             ( trackGrievanceVM.grievanceList[index].departmentName)!,
                                                            style: const TextStyle(
                                                                height: 1,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                color: Colors.black,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontStyle: FontStyle
                                                                    .normal),
                                                          ),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                           Text("status".tr,
                                                              style:const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Montserrat-Regular')),
                                                          const SizedBox(
                                                            height: 2,
                                                          ),
                                                          (trackGrievanceVM.grievanceList[index].status==null)?Text(''):
                                                          Text(
                                                            (trackGrievanceVM.grievanceList[index].status)!,
                                                            style: TextStyle(
                                                                height: 1,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                color: Colors
                                                                    .greenAccent
                                                                    .shade400,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontStyle: FontStyle
                                                                    .normal),
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
                                      )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
               /* Container(
                  height: MediaQuery.of(context).size.height / 0.5,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Powered By : ",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Montserrat'),
                      ),
                      Image(
                        image: AssetImage("assets/img.png"),
                        height: 20,
                      )
                    ],
                  ),
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
