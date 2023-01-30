import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:samadhan/View/post_grievance.dart';
import '../Utility/PieChartUtility.dart';
import '../Utility/officerDashboard.dart';
import '../View_mdal/NotificationDetailsVM.dart';
import '../View_mdal/PieChartVM.dart';
import '../View_mdal/ProfileVM.dart';
import '../View_mdal/department_list_vm.dart';
import '../View_mdal/dept_report_vm.dart';
import '../View_mdal/get_office_viewmodal.dart';
import '../View_mdal/officer_login_vm.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:intl/intl.dart';
import '../View_mdal/officewise_report_vm.dart';
import '../View_mdal/pendancy_report_vm.dart';
import '../View_mdal/received_grievance_vm.dart';
import '../View_mdal/statisfied_unsatisfied_vm.dart';
import '../View_mdal/status_vm.dart';
import '../View_mdal/taluka_report_vm.dart';
import '../View_mdal/taluka_viewmodal.dart';
import '../View_mdal/track_grievance_list_vm.dart';
import 'LoginPage.dart';


class OfficerDashboard extends StatefulWidget {
  const OfficerDashboard({Key? key}) : super(key: key);

  @override
  State<OfficerDashboard> createState() => _OfficerDashboardState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

DateTime? startDate;
DateTime? endDate;
final profileVM = Get.put(ProfileVM());
final reportDepartmentViewModal = Get.put(DepartmentListVM());
final deptReportVm = Get.put(DeptReportVm());
final picChartVM = Get.put(PicChartVM());
final officeWiseReportVm = Get.put(OfficeWiseReportVm());
final getOfficeByIdViewModal = Get.put(GetOfficeByIdViewModal());
final talukaViewModal = Get.put(TalukaViewModal());
final talukaReportVm = Get.put(TalukaReportVm());
final pendancyReportVM = Get.put(PendancyReportVM());
final satisfactionReportVM = Get.put(SatisfactionReportVM());
final grievanceReceivedVM = Get.put(GrievanceReceivedVM());
final statusVM = Get.put(StatusVM());
final notificatinDetailsVM = Get.put(NotificatinDetailsVM());
final trackGrievanceVMDashboard = Get.put(TrackGrievanceListVM());


class _OfficerDashboardState extends State<OfficerDashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(()  {
      deptReportVm.deptReport.clear();
      reportDepartmentViewModal.departmentList.clear();
      officeWiseReportVm.officeReportList.clear();
      getOfficeByIdViewModal.grievanceOfficeList.clear();
      talukaViewModal.talukaList.clear();
      talukaReportVm.talukaReport.clear();
      pendancyReportVM.pendancyReportList.clear();
      satisfactionReportVM.satisReportList.clear();
      grievanceReceivedVM.grReceivedDetails.clear();
      picChartVM.chartData.clear();
      picChartVM.isLoading.value =true;
     picChartVM.chartDetails("1","","");
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(),
                      accountName: const Center(child: Text('')),
                      accountEmail: Text(
                        "${"hello".tr} ${officerData.read('officerName')} ",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Montserrat'),
                      ),
                      currentAccountPicture: Center(
                        child: GestureDetector(
                          child: CircleAvatar(
                            radius: 80,
                            child: SvgPicture.asset(
                              'assets/Profile Colorful.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
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
                      Get.toNamed("/grievanceReceivedScreen");
                    },
                    child: drawerBox(
                        icon: 'assets/feedback Grey.svg',
                        section: 'Received Grievance'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/reportScreen");
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
                const SizedBox(
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
                      const Spacer(),
                      IconButton(
                          onPressed: () async {
                            notificatinDetailsVM.notificationList.clear();
                            notificatinDetailsVM.isLoading.value = true;
                            await notificatinDetailsVM.notificationData("${officerData.read('officerId')}");
                            Get.toNamed("/NotificationScreen");

                          },
                          icon: SvgPicture.asset(
                              'assets/Notification.svg',
                              height: 24,
                              color: Colors.white)),
                      IconButton(
                          onPressed: () async {
                            await profileVM.getDetails(officerData.read('officerId').toString());
                            Get.toNamed("/OfficerProfile");
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
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Text(
                    "${"hello".tr} ${officerData.read('officerName')}",
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
                        const SizedBox(
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

                           picChartVM.chartData.clear();
                           if(startDate!=null && endDate!=null){
                           await picChartVM.chartDetails(officerId!.toString(),DateFormat("dd MM yy").format(startDate!),DateFormat("dd MM yy").format(endDate!));
                           }

                             },
                           icon: const Icon(Icons.calendar_month,
                          color: Color(0xFFb83058)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4.6,

                      child: Obx(()=>(picChartVM.isLoading.value == true)?Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(20)),
                          height: 130,
                          width: 130,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                CircularProgressIndicator(
                                  color: Colors.red,
                                ),
                                Text(
                                  "Please wait",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              ]),
                        ),
                      )
                        : PieChart(
                          swapAnimationDuration: const Duration(seconds:2),
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 1.27,
                      child: Obx(()=>(picChartVM.isLoading.value == true)? Text('')
                        : Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 14,
                                  width: 14,
                                  color: const Color(0xFF81D4FA),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                const Text(
                                  "Open",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat-Medium"),
                                ),
                                const Spacer(),

                                  Text("${(((count1!* 100)/total!).toPrecision(1))}%",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat-Medium")),

                              ],
                            ),
                            Row(


                              children: [
                                Container(
                                    height: 14,
                                    width: 14,
                                    color: const Color(0xFFFBC02D)),
                                const SizedBox(
                                  width: 18,
                                ),
                                const Text(
                                  "Accepted",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat-Medium"),
                                ),
                                const Spacer(),
                                Text("${((count2!*100)/total!).toPrecision(1)}%",
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
                                 //
                                 color: const Color(0xFFB388FF),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                const Text(
                                  "Resolved",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat-Medium"),
                                ),
                                const Spacer(),
                                Text("${((count3!*100)/total!).toPrecision(1)}%",
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
                                  color: const Color(0xFFAED581),),
                                const SizedBox(
                                  width: 18,
                                ),
                                const Text(
                                  "Partially Resolved",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat-Medium"),
                                ),
                                const Spacer(),
                                Text("${((count4!*100)/total!).toPrecision(1)}%",
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
                                  color: Colors.red.shade400,
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                const Text("Rejected",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Montserrat-Medium")),
                                const Spacer(),
                                Text("${((count5!*100)/total!).toPrecision(1)}%",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Montserrat-Medium"))
                              ],
                            ),
                          ],
                        ),
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
                        setState(() {
                          districtViewModal.districtList.clear();
                          selectedDistrictValue=null;
                          districtViewModal.isLoading.value = true;
                          districtViewModal.districtList.clear();
                          districtViewModal.getAllDistrict();
                          talukaViewModal.talukaList.clear();
                          selectedTalukaValue=null;
                          talukaViewModal.isLoading.value = true;
                          talukaViewModal.talukaList.clear();
                          talukaViewModal.getAllTaluka();
                          villageViewModal.villageList.clear();
                          selectedVillageValue = null;
                          villageViewModal.isLoading.value = true;
                          departmentViewModal.departmentList.clear();
                          selectedDepartmentValue = null;
                          departmentViewModal.isLoading.value = true;
                          departmentViewModal.departmentList.clear();
                          departmentViewModal.getAllDepartment();
                          officeViewModal.officeList.clear();
                          officeViewModal.isLoading.value = true;
                          natureViewModal.natureList.clear();
                          natureViewModal.isLoading.value = true;
                          natureViewModal.getNatureGrievance();
                          Get.toNamed("/PostGrievanceScreen");
                        });

                      },
                      child: offdashboardGridContainer(context,
                          containerColor: Colors.yellow.shade100),
                    ),
                    GestureDetector(
                      onTap: () async {
                        statusVM.statusList.clear();
                        statusVM.isLoading.value = true;
                        statusVM.statusDetails();
                        grievanceReceivedVM.grReceivedDetails.clear();
                        grievanceReceivedVM.isLoading.value = true;
                        await grievanceReceivedVM.grDetails("1", "0", "", "");
                        Get.toNamed("/grievanceReceivedScreen");
                      },
                      child: offdashboardGridContainer(context,
                          imageIconPath: 'assets/Track Grievance.svg',
                          imageIconText: 'Received \nGrievance',
                          containerColor: Colors.greenAccent.shade100),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/reportScreen");
                      },
                      child: offdashboardGridContainer(context,
                          imageIconPath: 'assets/Post Grievance.svg',
                          imageIconText: '\nReports',
                          containerColor: Colors.deepPurple.shade100),
                    ),
                    InkWell(
                      onTap: ()  {
                        WidgetsBinding.instance.addPostFrameCallback((timeStamp){
                       setState(()  {
                         trackGrievanceVMDashboard.grievanceList.clear();
                         trackGrievanceVMDashboard.isLoading.value = true;

                       });
                       setState(() {
                         trackGrievanceVMDashboard.trackGrievanceList("0","${officerData.read('officerId')}");
                         Get.toNamed("/TrackGrievance");
                       });

                      });},
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
              Obx(()=>(picChartVM.isLoading.value == true)?Text('')
              : Text(
                    "$total",
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 25,
                    ),
                  ),
                ),
                const Text(
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
