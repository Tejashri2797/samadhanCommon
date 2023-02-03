import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samadhan/View/uploadedFileView.dart';

import '../View_mdal/TrackGrievanceByIDVM.dart';

class TrackGrievanceViewPage extends StatefulWidget {
  const TrackGrievanceViewPage({Key? key}) : super(key: key);

  @override
  State<TrackGrievanceViewPage> createState() => _TrackGrievanceViewPageState();
}

final trackGrievanceByIdVM = Get.put(TrackGrievanceByIDVM());

class _TrackGrievanceViewPageState extends State<TrackGrievanceViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
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
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();

                            trackGrievanceByIdVM.grievanceList2.clear();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      Text('trackGrievance'.tr,
                          style: const TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Montserrat'))
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: MediaQuery.of(context).size.height /11,
                    bottom: 10),
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
                      padding: const EdgeInsets.only(left: 20.0, right: 10),
                      child: ListView(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Text('enter_grievance_no'.tr,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Montserrat')),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
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
                            height: 15,
                          ),
                          MaterialButton(
                            height: 40,
                            minWidth: MediaQuery.of(context).size.width,
                            onPressed: () {},
                            color: const Color(0xFFb83058),
                            shape: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(7)),
                            child: Text(
                              'search'.tr,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height /1.57,
                            width: MediaQuery.of(context).size.width ,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black12)),
                            child: ListView(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                  Text(
                                      "pgGrievanceDetails".tr,
                                      style: TextStyle(
                                          height: 1,
                                          fontSize:16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'Montserrat',
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      status!,
                                      style: TextStyle(
                                          height: 1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: (status == "Open")?Colors.purpleAccent.shade200:
                                          (status == "Transferred")?Color(0xffff69b4):
                                          (status == "Partial Resolved")?Colors.blueAccent.shade200
                                              :Colors.red,
                                          fontFamily: 'Montserrat',
                                         ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Divider(
                                  thickness: 2,
                                  color: Colors.greenAccent,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ///Grievance id
                                      Text("grievance_id".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        GrievanceId!,
                                        style: const TextStyle(
                                            height: 1,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                            fontFamily: 'Montserrat',
                                            fontStyle: FontStyle.normal),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///Grievance Department

                                      Text("dept".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      (department == null)
                                          ? const Text("Not selected")
                                          : Text(
                                              department!,
                                              style: const TextStyle(
                                                  height: 1,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      'Montserrat-Medium',
                                                  fontStyle:
                                                      FontStyle.normal),
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///Office

                                      Text("pgOffice".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      (office == null)
                                          ? const Text("Not selected")
                                          : Text(
                                              office!,
                                              style: const TextStyle(
                                                  height: 1,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      'Montserrat-Medium',
                                                  fontStyle:
                                                      FontStyle.normal),
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///Submission Date & Time

                                      Text("submission_date_time".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      (date == null)
                                          ? const Text("Not selected")
                                          : Text(
                                              date.toString(),
                                              style: const TextStyle(
                                                  height: 1,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      'Montserrat-Medium',
                                                  fontStyle:
                                                      FontStyle.normal),
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///Name
                                      Text("userName".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      (userName == null)
                                          ? const Text("null")
                                          : Text(
                                              userName!,
                                              style: const TextStyle(
                                                  height: 1,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      'Montserrat-Medium',
                                                  fontStyle:
                                                      FontStyle.normal),
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///Mobile Number
                                      Text("mobile".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      (mob == null)
                                          ? const Text("null")
                                          : Text(
                                              mob!,
                                              style: const TextStyle(
                                                  height: 1,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      'Montserrat-Medium',
                                                  fontStyle:
                                                      FontStyle.normal),
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///Email
                                      Text("email".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      (Email == null)
                                          ? const Text("null")
                                          : Text(
                                              Email!,
                                              style: const TextStyle(
                                                  height: 1,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      'Montserrat-Medium',
                                                  fontStyle:
                                                      FontStyle.normal),
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///District
                                      Text("pgDistrict".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      (district == null)
                                          ? const Text("null")
                                          : Text(
                                              district!,
                                              style: const TextStyle(
                                                  height: 1,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      'Montserrat-Medium',
                                                  fontStyle:
                                                      FontStyle.normal),
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///Taluka
                                      Text("pgTaluka".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      (taluka == null)
                                          ? const Text("null")
                                          : Text(
                                              taluka!,
                                              style: const TextStyle(
                                                  height: 1,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      'Montserrat-Medium',
                                                  fontStyle:
                                                      FontStyle.normal),
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///Village
                                      Text("pgvillage".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      (village == null)
                                          ? const Text("null")
                                          : Text(
                                              village!,
                                              style: const TextStyle(
                                                  height: 1,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      'Montserrat-Medium',
                                                  fontStyle:
                                                      FontStyle.normal),
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///Nature of Grievance
                                      Text("pgNature".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      (natureOfG == null)
                                          ? const Text("null")
                                          : Text(
                                              natureOfG!,
                                              style: const TextStyle(
                                                  height: 1,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      'Montserrat-Medium',
                                                  fontStyle:
                                                      FontStyle.normal),
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///Grievance Details
                                      Text("pgGrievanceDetails".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      (details == null)
                                          ? const Text("null")
                                          : Text(
                                              details!,
                                              style: const TextStyle(
                                                  height: 1,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      'Montserrat-Medium',
                                                  fontStyle:
                                                      FontStyle.normal),
                                            ),

                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///File Uploaded
                                      Text("file_uploaded".tr,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat')),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            const Icon(
                                              Icons.picture_as_pdf_outlined,
                                              size: 25,
                                              color: Color(0xFFb83058),
                                            ),
                                            const Spacer(),
                                            MaterialButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const UploadedFileView()));
                                              },
                                              child: Text(
                                                "view_file".tr,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.transparent,
                                                  shadows: [
                                                    Shadow(
                                                        offset: Offset(0, -5),
                                                        color: Colors.blue)
                                                  ],
                                                  // Step 3 SEE HERE
                                                  decoration: TextDecoration
                                                      .underline,
                                                  decorationColor:
                                                      Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
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
    );
  }
}
