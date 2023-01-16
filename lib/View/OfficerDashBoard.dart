import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../Utility/PieChartUtility.dart';
import '../Utility/officerDashboard.dart';
import '../View_mdal/PieChartVM.dart';
import '../View_mdal/officer_login_vm.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:intl/intl.dart';

import 'LoginPage.dart';


class OfficerDashboard extends StatefulWidget {
  const OfficerDashboard({Key? key}) : super(key: key);

  @override
  State<OfficerDashboard> createState() => _OfficerDashboardState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

DateTime? startDate;
DateTime? endDate;
final picChartVM = Get.put(PicChartVM());
class _OfficerDashboardState extends State<OfficerDashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserAccountsDrawerHeader(
                    otherAccountsPictures: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: SvgPicture.asset(
                          'assets/Cross.svg',
                          height: 20,
                        ),
                      ),
                    ],
                    decoration: BoxDecoration(color: Colors.white),
                    accountName: Text(
                      'Mukul Joshi',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          // fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat-Regular'),
                    ),
                    accountEmail: Text("sundar@appmaking.co"),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/PostGrievanceScreen");
                    },
                    child: drawerBox(
                        icon: 'assets/Post Grievance Grey.svg',
                        section: 'Post Grievance'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/TrackGrievance");
                    },
                    child: drawerBox(
                        icon: 'assets/Track Grievance Grey.svg',
                        section: 'Track Grievance'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/GrievanceReceivedScreen");
                    },
                    child: drawerBox(
                        icon: 'assets/feedback Grey.svg',
                        section: 'Received Grievance'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/ReportScreen");
                    },
                    child: drawerBox(
                        icon: 'assets/feedback Grey.svg',
                        section: 'Reports'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/ContactUsScreen");
                    },
                    child: drawerBox(
                        icon: 'assets/Contact Us Grey.svg',
                        section: 'Contact Us'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/FAQ");
                    },
                    child: drawerBox(
                        icon: 'assets/FAQ\'s.svg', section: 'FAQ\'S'),
                  ),
                  drawerBox(
                      icon: 'assets/settings.svg', section: 'Setting'),
                  drawerBox(
                      icon: 'assets/logout Grey.svg', section: 'Logout'),
                ],
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            color: const Color(0xFFb83058),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            _key.currentState!.openDrawer();
                          },
                          icon: SvgPicture.asset('assets/menu.svg',
                              height: 18, color: Colors.white)),
                      Spacer(),
                      IconButton(
                          onPressed: () {

                            Get.toNamed("/NotificationScreen");
                          },
                          icon: SvgPicture.asset(
                              'assets/Notification.svg',
                              height: 24,
                              color: Colors.white)),
                      IconButton(
                          onPressed: () {
                            Get.toNamed("/ProfileScreen");
                          },
                          icon: SvgPicture.asset(
                            'assets/Profile.svg',
                            color: Colors.white,
                            height: 25,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 17.0),
                  child: Text(
                    "${"hello".tr} $officerName",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat-Medium",
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 6.6,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Grievance Status",
                            style: TextStyle(
                                color: Colors.black87,
                                fontFamily: "Montserrat-SemiBold",
                                fontSize: 15)),
                        const Spacer(),
                        Text('${startDate != null ? DateFormat("dd MMM").format(startDate!) : ''}  ${endDate != null ? DateFormat("dd MMM").format(endDate!) : ''}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat-SemiBold",
                                fontSize: 14)),
                        SizedBox(
                          width: 4,
                        ),
                         IconButton(
                             onPressed: () async {
                           showCustomDateRangePicker(
                                 context,
                                 dismissible: true,
                                 minimumDate: DateTime(2021, 11, 5),
                                 maximumDate: DateTime.now(),
                                 endDate: endDate,
                                 startDate: startDate,
                                 onApplyClick: (start, end) {
                                   setState(() {
                                     endDate = end;
                                     startDate = start;
                                   });
                                 },
                                 onCancelClick: () {
                                   setState(() {
                                     endDate = null;
                                     startDate = null;
                                   });
                                 },

                               );

                           picChartVMLogin.chartData.clear();
                           if(startDate!=null && endDate!=null){
                           await picChartVM.chartDetails(officerId!.toString(),DateFormat("dd MM yy").format(startDate!),DateFormat("dd MM yy").format(endDate!));
                           }

                             },
                           icon: Icon(Icons.calendar_month,
                          color: Color(0xFFb83058)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4.6,

                      child: PieChart(
                        swapAnimationDuration: Duration(seconds: 2),
                        swapAnimationCurve: Curves.linear,
                        PieChartData(
                          borderData: FlBorderData(
                            show: true,

                          ),
                          startDegreeOffset: 60,
                          sectionsSpace: 2,
                          centerSpaceRadius: 65,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 1.27,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 14,
                                width: 14,
                                color: Color(0xFF81D4FA),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              const Text(
                                "Open",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Montserrat-Medium"),
                              ),
                              Spacer(),
                              Text("${((count1!*100)/total!).toPrecision(1)}%",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat-Medium"))
                            ],
                          ),
                          Row(


                            children: [
                              Container(
                                  height: 14,
                                  width: 14,
                                  color: Color(0xFFFBC02D)),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                "Accepted",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Montserrat-Medium"),
                              ),
                              Spacer(),
                              Text("${((count2!*100)/total!).toPrecision(1)}%",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat-Medium"))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 14,
                                width: 14,
                               //
                               color: Color(0xFFB388FF),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                "Resolved",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Montserrat-Medium"),
                              ),
                              Spacer(),
                              Text("${((count3!*100)/total!).toPrecision(1)}%",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat-Medium"))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 14,
                                  width: 14,
                                color: Color(0xFFAED581),),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                "Partially Resolved",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Montserrat-Medium"),
                              ),
                              Spacer(),
                              Text("${((count4!*100)/total!).toPrecision(1)}%",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat-Medium"))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 14,
                                width: 14,
                                color: Colors.red.shade400,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Text("Rejected",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat-Medium")),
                              Spacer(),
                              Text("${((count5!*100)/total!).toPrecision(1)}%",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat-Medium"))
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 1.60,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  color: Color(0xFFb83058),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: GridView.count(
                  padding: const EdgeInsets.only(
                    left: 60,
                    right: 60,
                    top: 15,
                  ),
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 30,
                  clipBehavior: Clip.hardEdge,
                  physics: const ScrollPhysics(),
                  //childAspectRatio: 1.10,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/PostGrievanceScreen");
                      },
                      child: offdashboardGridContainer(context,
                          containerColor: Colors.yellow.shade100),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/GrievanceReceivedScreen");
                      },
                      child: offdashboardGridContainer(context,
                          imageIconPath: 'assets/Track Grievance.svg',
                          imageIconText: 'Received \nGrievance',
                          containerColor: Colors.greenAccent.shade100),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/ReportScreen");
                      },
                      child: offdashboardGridContainer(context,
                          imageIconPath: 'assets/Post Grievance.svg',
                          imageIconText: '\nReports',
                          containerColor: Colors.deepPurple.shade100),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed("/TrackGrievance");
                      },
                      child: offdashboardGridContainer(context,
                          imageIconPath: 'assets/Notification.svg',
                          imageIconText: 'Track \nGrievance',
                          containerColor: Colors.brown.shade100),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 3,
                left: MediaQuery.of(context).size.width / 2.25),
            child: Column(
              children: [
                Text(
                  "$total",
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Total",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
