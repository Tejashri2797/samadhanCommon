
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


import '../Utility/PopUpMenuCommonStringClass.dart';
import '../View_mdal/feedback_details_vm.dart';
import '../View_mdal/submitFeedbackVM.dart';

class SubmitFeedback extends StatefulWidget {
  const SubmitFeedback({Key? key}) : super(key: key);

  @override
  State<SubmitFeedback> createState() => _SubmitFeedbackState();
}

final submitFeedbackVM=Get.put(SubmitFeedbackVM());
final feedbackDetailsVM=Get.put(FeedbackDetailsVM());
class _SubmitFeedbackState extends State<SubmitFeedback> {
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
                                Get.toNamed("/DashBoardScreen");
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                          Text('submitFeedback'.tr,
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
                        bottom: 45),
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
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Montserrat-Regular')),
                            const SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              height: 45,
                              child: TextFormField(
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

                            const SizedBox(
                              height: 17,
                            ),
                            MaterialButton(
                              height: 45,
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () {
                                Get.toNamed("/SubmitFeedback1");
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
                              child: Obx(() => (submitFeedbackVM.isLoading.value == true)?Text('')
                                : ListView.builder(
                                    itemCount: submitFeedbackVM.feedbackList.length,
                                    itemBuilder: (BuildContext context,
                                        int index) =>
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10.0),
                                          child: GestureDetector(
                                            onTap: () async {
                                              await feedbackDetailsVM.feedbackDetails((submitFeedbackVM.feedbackList[index].grievanceId)!.toString());
                                              Get.toNamed("/SubmitFeedback1");
                                            },
                                            child: Container(
                                              height:
                                              MediaQuery.of(context).size.height /6,
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
                                                          Text(
                                                              DateFormat('dd/MM/yyyy').format(DateTime.parse((submitFeedbackVM.feedbackList[index].submissionDateAndTime).toString()!)),


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
                                                            const SizedBox(height: 5,),
                                                            Row(
                                                              children:  [
                                                                Text("grievanceid".tr,
                                                                    style: const TextStyle(
                                                                        fontSize: 16,
                                                                        color: Colors
                                                                            .black26,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                        fontFamily:
                                                                        'Montserrat-Regular')),
                                                                const Spacer(),
                                                                GestureDetector(
                                                                  onTap: () async {
                                                                    await feedbackDetailsVM.feedbackDetails((submitFeedbackVM.feedbackList[index].grievanceId)!.toString());
                                                                    Get.toNamed("/SubmitFeedback1");
                                                                  },
                                                                  child:  Text(
                                                                    "view".tr,
                                                                    style: const TextStyle(
                                                                      fontSize: 14,
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
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              submitFeedbackVM.feedbackList[index].grievanceNo!,
                                                              style: TextStyle(
                                                                  height: 1,
                                                                  fontSize: 16,
                                                                  color: Colors.black,
                                                                  fontFamily:
                                                                  'Montserrat-Regular',
                                                                  fontStyle: FontStyle
                                                                      .normal),
                                                            ),
                                                            const SizedBox(
                                                              height: 15,
                                                            ),

                                                            const Text("Status",
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    color: Colors
                                                                        .black26,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                    fontFamily:
                                                                    'Montserrat-Regular')),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              submitFeedbackVM.feedbackList[index].status!,
                                                              style: TextStyle(
                                                                  height: 1,
                                                                  fontSize: 17,
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
                  /*   Container(
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
