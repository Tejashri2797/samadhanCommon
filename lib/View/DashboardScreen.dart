import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:samadhan/View/TrackGrievance.dart';
import '../View_mdal/ProfileVM.dart';

import '../Modal/notification_modal.dart';
import '../Repository/getGreivance_Resolved Repo.dart';
import '../Repository/logout_repo.dart';
import '../Repository/notification Repo.dart';
import '../Repository/notification Repo.dart';
import '../Repository/otppost_repository.dart';
import '../Utility/DashboardCommonWidget.dart';
import '../View_mdal/NotificationDetailsVM.dart';
import '../View_mdal/ProfileVM.dart';
import '../View_mdal/department_viewmodal.dart';
import '../View_mdal/district_viewmodal.dart';
import '../View_mdal/get_ResolvedViewModal.dart';
import '../View_mdal/get_office_viewmodal.dart';
import '../View_mdal/logout_viewmodal.dart';
import '../View_mdal/nature_viewModal.dart';
import '../View_mdal/notification_viewModal.dart';
import '../View_mdal/otp_viewmodal.dart';
import '../View_mdal/signup_viewmodal.dart';
import '../View_mdal/submitFeedbackVM.dart';
import '../View_mdal/taluka_viewmodal.dart';
import '../View_mdal/track_grievance_list_vm.dart';
import '../View_mdal/vilaage_viewmoda.dart';
import '../main.dart';
import 'OTPTabbar.dart';
import 'PostGrievance.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

final talukaViewModal = Get.put(TalukaViewModal());
final districtViewModal = Get.put(DistrictViewModal());
final resolvedViewModal = Get.put(ResolvedViewModal());
final notificationViewModal = Get.put(NotificationViewModal());
final notificatinDetailsVM = Get.put(NotificatinDetailsVM());
final profileVM = Get.put(ProfileVM());
final trackGrievanceVMDashboard = Get.put(TrackGrievanceListVM());
final logoutViewModal = LogoutViewModal();
final villageViewModalG = Get.put(VillageViewModal());
final departmentViewModal = Get.put(DepartmentViewModal());
final getOfficeByIdViewModal = Get.put(GetOfficeByIdViewModal());
final natureViewModal = Get.put(NatureViewModal());
final submitFeedbackVM = Get.put(SubmitFeedbackVM());


class _DashBoardScreenState extends State<DashBoardScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<NotificationModal> noti = notificationList;

  // String profileId = Get.arguments;

  /// Local Storage Using getX


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    setState(() {
      profileVM.getDetails("${data.read('profileId')}");
      notificationViewModal.getallNotification("${data.read('profileId')}");
      trackGrievanceVMDashboard.getGrievanceList("${data.read('profileId')}");
      submitFeedbackVM.feedbackList.clear();
      submitFeedbackVM.feedbackGrievanceList("${data.read('profileId')}");

      talukaViewModal.talukaList.clear();
      selectedTalukaValueG= null;
      talukaViewModal.isLoading.value = true;

      departmentViewModal.departmentList.clear();
      selectedDepartmentValue=null;
      departmentViewModal.isLoading.value = true;

      natureViewModal.natureList.clear();
      selectedNatureValue=null;
      natureViewModal.isLoading.value = true;

      villageViewModalG.villageList.clear();
      selectedVillageValueG=null;
      villageViewModalG.isLoading.value = true;

      getOfficeByIdViewModal.grievanceOfficeList.clear();
      selectedOfficeValue=null;
      getOfficeByIdViewModal.isLoading.value = true;


      //notificatinDetailsVM.isLoading.value= true;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(),
                      accountName: Center(child: Text('')),
                      accountEmail: Text(
                        "${"hello".tr} ${data.read('profileName')}",
                        style: TextStyle(
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

                      Get.toNamed('/PostGrievance1');
                    },
                    child: drawerBox(
                        icon: 'assets/Post Grievance Grey.svg',
                        section: 'postGrievance'.tr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      trackGrievanceVMDashboard.grievanceList.clear();
                      trackGrievanceVM.isLoading.value = true;
                    await  trackGrievanceVM.getGrievanceList("${data.read('profileId')}");
                      Get.toNamed('/TrackGrievance');
                    },
                    child: drawerBox(
                        icon: 'assets/Track Grievance Grey.svg',
                        section: 'trackGrievance'.tr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  drawerBox(
                      icon: 'assets/feedback Grey.svg',
                      section: 'submitFeedback'.tr),
                  const SizedBox(


                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/ContactUsScreen");
                    },
                    child: drawerBox(
                        icon: 'assets/Contact Us Grey.svg',
                        section: 'contact'.tr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/FAQ");
                    },
                    child:
                        drawerBox(icon: 'assets/FAQ\'s.svg', section: "faq".tr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed("/ChooseLanguage");
                      },
                      child: drawerBox(
                          icon: 'assets/settings.svg',
                          section: 'chooseLang'.tr)),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Container(
                                    height: 170,
                                    width:
                                        MediaQuery.of(context).size.width / 0.8,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: SvgPicture.asset(
                                            'assets/Notification Alert.svg',
                                            height: 50,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          'logoutAlert'.tr,
                                          style: const TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            MaterialButton(
                                              height: 40,
                                              minWidth: 100,
                                              color: Color(0xFFb83058),
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text(
                                                'n'.tr,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            MaterialButton(
                                              height: 40,
                                              minWidth: 100,
                                              color: Color(0xFFb83058),
                                              onPressed: () async {
                                                await logoutViewModal.logoutCurrentUser(int.parse("${data.read('profileId')}"));
                                                data.remove('profileId');
                                                PostOTP.otpList2.clear();
                                                Get.offAllNamed(
                                                    '/loginAndSignUp');
                                              },
                                              child: Text(
                                                'y'.tr,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: drawerBox(
                          icon: 'assets/logout Grey.svg',
                          section: 'logout'.tr)),
                ],
              )
            ],
          ),
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFb83058),
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 7.4,
                    left: MediaQuery.of(context).size.width / 18),
                child: Text(
                  "${"hello".tr} ${data.read('profileName')}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(45),
                        topLeft: Radius.circular(45))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 10),
              child: IconButton(
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
                icon: SvgPicture.asset(
                  'assets/menu.svg',
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      IconButton(
                          onPressed: () async {
                            notificatinDetailsVM.notifictn.clear();
                            notificatinDetailsVM.isLoading.value = true;
                            await notificatinDetailsVM.notificationData("${data.read('profileId')}");
                            Get.toNamed("/NotificationScreen");
                          },
                          icon: SvgPicture.asset('assets/Notification.svg',
                              height: 25, color: Colors.white)),
                      Padding(
                        padding: EdgeInsets.only(top: 9.0, left: 21),
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: Obx(
                            () =>
                                (notificationViewModal.isLoading.value == true)
                                    ? Text("")
                                    : Center(
                                        child: (notificationViewModal.notificationList.isEmpty)?
                                        Text(
                                          '0',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13),
                                        ):
                                        Text(
                                          '$isReadCount',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13),
                                        ),
                                      ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () async {
                        //   await profileVM.getDetails(id1!);
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
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 6,
                  left: MediaQuery.of(context).size.width / 10,
                  right: MediaQuery.of(context).size.width / 10),
              child: GridView.count(
                clipBehavior: Clip.none,
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 35,
                children: [
                  GestureDetector(
                    onTap: () async {

                      Get.toNamed("/PostGrievance1");
                    },
                    child: dashboardGridContainer(context,
                        imageIconPath: 'assets/Track Grievance.svg',
                        imageIconText: 'postGrievanceD'.tr),
                  ),
                  GestureDetector(
                    onTap: () async {
                      trackGrievanceVMDashboard.grievanceList.clear();
                      trackGrievanceVM.isLoading.value = true;
                     await trackGrievanceVM.getGrievanceList("${data.read('profileId')}");
                      Get.toNamed("/TrackGrievance");
                    },
                    child: dashboardGridContainer(context,
                        imageIconPath: 'assets/Track Grievance.svg',
                        imageIconText: 'trackGrievanceD'.tr),
                  ),
                  GestureDetector(
                    onTap: () {
                    //  submitFeedbackVM.feedbackGrievanceList();
                      Get.toNamed("/SubmitFeedback");
                    },
                    child: dashboardGridContainer(context,
                        imageIconPath: 'assets/Submit Feedback.svg',
                        imageIconText: 'submitFeedbackD'.tr),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/ContactUsScreen");
                    },
                    child: dashboardGridContainer(context,
                        imageIconPath: 'assets/Contact Us.svg',
                        imageIconText: 'contactD'.tr),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.57,
              left: MediaQuery.of(context).size.width / 20,
              child: Text(
                'latestGrievanceResolved'.tr,
                style: const TextStyle(
                    color: Color(0xFFb83058),
                    fontSize: 19,
                    fontFamily: 'Montserrat-SemiBold'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 1.53),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 5),

                  // color: Colors.lightBlue,
                  child: Obx(
                    () => (resolvedViewModal.isLoading.value == true)
                        ? Center(
                            child: Container(
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
                          )
                        : ListView.builder(
                            // itemCount: resolvedViewModal.resolvedList.length,
                            itemCount: resolvedViewModal.resolvedList.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 3.6,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x15b83058),
                                        blurRadius: 8,
                                        spreadRadius: 1,
                                        offset: Offset(0, 8))
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    top: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 4,
                                              child: Text(
                                                (resolvedViewModal
                                                    .resolvedList[index]
                                                    .grievanceNo)!,
                                                style: const TextStyle(
                                                    color: Color(0xFFb83058),
                                                    fontSize: 13,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          const Expanded(
                                            flex: 7,
                                            child: Divider(
                                              color: Color(0xFFb83058),
                                              thickness: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  'tal'.tr,
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                      fontFamily: 'Montserrat'),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  'dept'.tr,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                      fontFamily: 'Montserrat'),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  (resolvedViewModal
                                                      .resolvedList[index]
                                                      .taluka)!,
                                                  style: const TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 13,
                                                      fontFamily: 'Montserrat'),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  (resolvedViewModal
                                                      .resolvedList[index]
                                                      .department)!,
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 13,
                                                      fontFamily: 'Montserrat'),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'nature'.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontFamily: 'Montserrat'),
                                              ),
                                              Text(
                                                (resolvedViewModal
                                                    .resolvedList[index]
                                                    .nature_Of_Grievance)!,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'Montserrat',
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: SvgPicture.asset(
                                              'assets/Satisfied logo green.svg',
                                              height: 50,
                                              width: 50,
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'regDate'.tr,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Montserrat',
                                                color: Colors.grey),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Text(
                                              (resolvedViewModal
                                                  .resolvedList[index]
                                                  .reg_Date)!,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Montserrat'),
                                            ),
                                          ),
                                          Text(
                                            'resolvedDate'.tr,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                fontFamily: 'Montserrat'),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              (resolvedViewModal
                                                  .resolvedList[index]
                                                  .resolved_Date)!,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Montserrat'),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
