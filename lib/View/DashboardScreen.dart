import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:samadhan/View/TrackGrievance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Modal/notification_modal.dart';
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
import '../View_mdal/submitFeedbackVM.dart';
import '../View_mdal/taluka_viewmodal.dart';
import '../View_mdal/track_grievance_list_vm.dart';
import '../View_mdal/vilaage_viewmoda.dart';
import 'OTPTabbar.dart';
import 'PostGrievance.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

final resolvedViewModal = Get.put(ResolvedViewModal());
final notificationViewModal = Get.put(NotificationViewModal());
final notificatinDetailsVM = Get.put(NotificatinDetailsVM());
final profileVM = Get.put(ProfileVM());
final trackGrievanceVMDashboard = Get.put(TrackGrievanceListVM());
final logoutViewModal = LogoutViewModal();
final submitFeedbackVM = Get.put(SubmitFeedbackVM());


class _DashBoardScreenState extends State<DashBoardScreen> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  List<NotificationModal> noti = notificationList;



  /// Local Storage Using getX


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
    setState(() {
Timer(const Duration(seconds: 4), () async {


  resolvedViewModal.resolvedList.clear();
  resolvedViewModal.isLoading.value=true;
 await resolvedViewModal.getResolved();
  profileVM.profileDetails.clear();
  profileVM.getDetails("${data.read('profileId')}");
  notificationViewModal.getallNotification("${data.read('profileId')}");
});

    });
  });
        }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      key: key,
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
                      decoration: const BoxDecoration(),
                      accountName: const Center(child: Text('')),
                      accountEmail: Obx(()=>(profileVM.isLoading.value == true )?const Text('')
                          : Text(
                        "${"hello".tr} $profileName",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Montserrat'),
                      ),
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

                      Get.toNamed('/PostGrievanceCitizen')?.then((_) {
                        setState(() {

                        });
                      });
                    },
                    child: drawerBox(
                        icon: 'assets/Post Grievance Grey.svg',
                        section: 'postGrievance'.tr),
                  ),

                  GestureDetector(
                    onTap: () async {
                     setState(() {
                       trackGrievanceVMDashboard.grievanceList.clear();
                       trackGrievanceVMDashboard.isLoading.value = true;
                       trackGrievanceVMDashboard.trackGrievanceList("0","${data.read('profileId')}");
                       Get.toNamed('/TrackGrievance');
                     });
                    },
                    child: drawerBox(
                        icon: 'assets/Track Grievance Grey.svg',
                        section: 'trackGrievance'.tr),
                  ),

                  GestureDetector(
                    onTap: (){
                      Get.toNamed("/SubmitFeedback");
                    },
                    child: drawerBox(
                        icon: 'assets/feedback Grey.svg',
                        section: 'submitFeedback'.tr),
                  ),

                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/ContactUsScreen");
                    },
                    child: drawerBox(
                        icon: 'assets/Contact Us Grey.svg',
                        section: 'contact'.tr),
                  ),

                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/FAQ");
                    },
                    child:
                        drawerBox(icon: 'assets/FAQ\'s.svg', section: "faq".tr),
                  ),

                  GestureDetector(
                      onTap: () async {
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        pref.setBool('visit', true);
                        Get.toNamed("/ChooseLanguage");
                      },
                      child: drawerBox(
                          icon: 'assets/settings.svg',
                          section: 'chooseLang'.tr)),

                  InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: SizedBox(
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

                                        Text(
                                          'logoutAlert'.tr,
                                          style: const TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            MaterialButton(
                                              height: 40,
                                              minWidth: 100,
                                              color: const Color(0xFFb83058),
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
                                              color: const Color(0xFFb83058),
                                              onPressed: () async {

                                                await logoutViewModal.logoutCurrentUser(int.parse("${data.read('profileId')}"));
                                                data.remove('profileId');
                                                PostOTP.otpList2.clear();
                                                SharedPreferences pref= await SharedPreferences.getInstance();
                                                pref.remove('login');
                                                pref.remove('visit');
                                                Get.offAllNamed('/loginAndSignUp');

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
      body: Obx(()=>
          ModalProgressHUD(

            blur: 0.5,
          color: Colors.black,
          inAsyncCall: profileVM.isLoading.value && resolvedViewModal.isLoading.value == true,
          progressIndicator: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)),
            height: 150,
            width: 150,
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
                        top: MediaQuery.of(context).size.height / 8.5,
                        left: MediaQuery.of(context).size.width / 18),
                    child: Obx(()=>(profileVM.isLoading.value == true )?Text('hello'.tr,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Montserrat-Medium'))
                      : Text(
                        "${"hello".tr} $profileName",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Montserrat-Medium'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).size.height /4),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(45),
                            topLeft: Radius.circular(45))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 10),
                  child: IconButton(
                    onPressed: () {
                      key.currentState!.openDrawer();
                    },
                    icon: SvgPicture.asset(
                      'assets/menu.svg',
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          IconButton(
                              onPressed: () async {
                                notificatinDetailsVM.notificationList.clear();
                                notificatinDetailsVM.isLoading.value = true;
                                await notificatinDetailsVM.notificationData("${data.read('profileId')}");
                                Get.toNamed("/NotificationScreen")?.then((_) {setState(() {

                                });});
                              },
                              icon: const Icon(Icons.notifications_none_outlined,color: Colors.white,size: 30,)),

                          Padding(
                            padding: const EdgeInsets.only(top: 7.0, left: 25),
                            child: Obx(
                              () =>
                                  (notificationViewModal.isLoading.value == true)
                                      ? const Text("")
                                      : (isReadCount == null)?
                                      const Text(''):(isReadCount == int.parse("0"))?const Text(''):
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Colors.white,
                                        child: Text(
                                          '$isReadCount',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13),
                                        ),
                                      ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: ()  {
                            Get.toNamed("/ProfileScreen")?.then((_) {
                              setState(() {

                              });
                            });
                          },
                          icon: SvgPicture.asset(
                            'assets/Profile.svg',
                            color: Colors.white,
                            height: 24,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/6.8),
                  child: ListView(
                    physics:const NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {

                              Get.toNamed('/PostGrievanceCitizen');


                              },
                            child: dashboardGridContainer(context,
                                imageIconPath: 'assets/Post Grievance.svg',
                                imageIconText: 'postGrievanceD'.tr),
                          ),
                          GestureDetector(
                            onTap: () async {

                              setState(() {
                                trackGrievanceVMDashboard.grievanceList.clear();
                                trackGrievanceVM.isLoading.value = true;
                                trackGrievanceVM.trackGrievanceList("0","${data.read('profileId')}");
                                Get.toNamed("/TrackGrievance")?.then((_) {
                                  setState(() {

                                  });
                                } );
                              });
                            },
                            child: dashboardGridContainer(context,
                                imageIconPath: 'assets/Track Grievance.svg',
                                imageIconText: 'trackGrievanceD'.tr),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed("/SubmitFeedback")?.then((_) {
                                setState(() {

                                });
                              });
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
                      const SizedBox(height: 20,),
                      Padding(
                        padding:  const EdgeInsets.only(left: 25.0),
                        child: Text(
                          'latestGrievanceResolved'.tr,
                          style: const TextStyle(
                              color: Color(0xFFb83058),
                              fontSize: 19,
                              fontFamily: 'Montserrat-Medium'),
                        ),
                      ),
                      const SizedBox(height: 25,),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child:SizedBox(
                                height:MediaQuery.of(context).size.height/2.6 ,
                                width: MediaQuery.of(context).size.width,
                                child: CarouselSlider.builder(

                            itemCount:resolvedViewModal.resolvedList.length,

                            itemBuilder: (BuildContext context,int itemIndex, int pageViewitemIndex) =>
                                  Obx(()=>(resolvedViewModal.isLoading.value==true)? Padding(
                                    padding:  const EdgeInsets.only(left: 20.0,right: 22),

                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 10,),
                                      height: MediaQuery.of(context).size.height/2.7,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
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
                                          top: 22,

                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: const [
                                                Expanded(
                                                    flex: 1,
                                                    child:
                                                    Text(
                                                      ("OS/20220101-1"),
                                                      style: TextStyle(
                                                        color: Color(0xFFb83058),
                                                        fontSize: 17,
                                                        fontFamily: 'Montserrat-Medium',

                                                      ),
                                                    )),
                                                Expanded(
                                                  flex: 1,
                                                  child: Divider(
                                                    color: Color(0xFFb83058),
                                                    thickness: 0.5,
                                                  ),
                                                ),

                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10),
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
                                                children: const [
                                                  Expanded(
                                                      flex: 3,
                                                      child:
                                                      Text(
                                                        ('Bhum'),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontFamily: 'Montserrat-Medium'),
                                                      )),
                                                  Expanded(
                                                      flex: 3,
                                                      child:  Text(
                                                        ('Education'),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontFamily: 'Montserrat-Medium'),
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
                                                    const Text(
                                                      ('Individual'),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Montserrat-Medium',
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
                                            const Divider(
                                              color: Colors.black26,
                                              thickness: 1,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'regDate'.tr,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.grey),
                                                ),
                                                const Expanded(
                                                  flex: 5,
                                                  child:  Text(
                                                    ("01-01-1023"),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily: 'Montserrat-Medium'),
                                                  ),
                                                ),
                                                Text(
                                                  'resolvedDate'.tr,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                      fontFamily: 'Montserrat'),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child:  Text(
                                                    ("01-01-2924")!,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: 'Montserrat-Medium'),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                    : Padding(
                                        padding:  const EdgeInsets.only(left: 20.0,right: 22),

                                      child: Container(
                                          margin: const EdgeInsets.only(bottom: 10,),
                                          height: MediaQuery.of(context).size.height/2.7,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black26,
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
                                              top: 22,

                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child:
                                                       Text(
                                                          (resolvedViewModal
                                                              .resolvedList[itemIndex]
                                                              .grievanceNo)!,
                                                          style: const TextStyle(
                                                              color: Color(0xFFb83058),
                                                              fontSize: 17,
                                                              fontFamily: 'Montserrat-Medium',

                                                             ),
                                                        )),
                                                    const Expanded(
                                                      flex: 1,
                                                      child: Divider(
                                                        color: Color(0xFFb83058),
                                                        thickness: 0.5,
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10),
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
                                                          child:
                                                          Text(
                                                            (resolvedViewModal
                                                                .resolvedList[itemIndex]
                                                                .taluka)!,
                                                            style: const TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 14,
                                                                fontFamily: 'Montserrat-Medium'),
                                                          )),
                                                      Expanded(
                                                          flex: 3,
                                                          child:  Text(
                                                            (resolvedViewModal
                                                                .resolvedList[itemIndex]
                                                                .department)!,
                                                            style: const TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 14,
                                                                fontFamily: 'Montserrat-Medium'),
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
                                                              .resolvedList[itemIndex]
                                                              .nature_Of_Grievance)!,
                                                          style: const TextStyle(
                                                            fontSize: 14,
                                                            fontFamily: 'Montserrat-Medium',
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
                                                const Divider(
                                                  color: Colors.black26,
                                                  thickness: 1,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'regDate'.tr,
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          fontFamily: 'Montserrat',
                                                          color: Colors.grey),
                                                    ),
                                                    Expanded(
                                                      flex: 5,
                                                      child:  Text(
                                                        (resolvedViewModal
                                                            .resolvedList[itemIndex]
                                                            .reg_Date)!,
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontFamily: 'Montserrat-Medium'),
                                                      ),
                                                    ),
                                                    Text(
                                                      'resolvedDate'.tr,
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                          fontFamily: 'Montserrat'),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child:  Text(
                                                        (resolvedViewModal
                                                            .resolvedList[itemIndex]
                                                            .resolved_Date)!,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                            fontSize: 12,
                                                            fontFamily: 'Montserrat-Medium'),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  ), options: CarouselOptions(
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: (resolvedViewModal.isLoading.value==true)?false:true,
                                  autoPlayInterval: const Duration(milliseconds:500),
                                  autoPlayAnimationDuration: const Duration(seconds:12),
                                  autoPlayCurve: Curves.linear,
                                  enlargeCenterPage: false,
                                  scrollDirection: Axis.vertical,
                                  animateToClosest: true
                          ),
                          ),
                                ),
                              ),




                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
