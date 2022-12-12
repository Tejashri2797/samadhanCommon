import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utility/DashboardCommonWidget.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

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
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: SvgPicture.asset(
                        'assets/Cross.svg',
                        height: 20,
                      ),
                    ),
                  ),
                  const Text(
                    'Mukul Joshi',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat-Medium'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed('/PostGrievance1');
                    },
                    child: drawerBox(
                        icon: 'assets/Post Grievance Grey.svg',
                        section: 'Post Grievance'
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/TrackGrievance');
                    },
                    child: drawerBox(
                        icon: 'assets/Track Grievance Grey.svg',
                        section: 'Track Grievance'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  drawerBox(
                      icon: 'assets/feedback Grey.svg', section: 'Feedback'),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed("/ContactUsScreen");
                    },
                    child: drawerBox(
                        icon: 'assets/Contact Us Grey.svg',
                        section: 'Contact Us'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/FAQ");
                    },
                    child:
                        drawerBox(icon: 'assets/FAQ\'s.svg', section: 'FAQ\'S'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  drawerBox(icon: 'assets/settings.svg', section: 'Setting'),
                  const SizedBox(
                    height: 10,
                  ),
                  drawerBox(icon: 'assets/logout Grey.svg', section: 'Logout'),
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
                    top: MediaQuery.of(context).size.height / 7,
                    left: MediaQuery.of(context).size.width / 18),
                child: const Text(
                  'Hello, Mukul Joshi',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Montserrat-Medium'),
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
                  IconButton(
                      onPressed: () {
                        Get.toNamed("/NotificationScreen");
                      },
                      icon: SvgPicture.asset('assets/Notification.svg',height: 25,
                          color: Colors.white)),
                  IconButton(
                      onPressed: () {
                      Get.toNamed("/ProfileScreen");
                      },
                      icon: SvgPicture.asset(
                        'assets/Profile.svg',
                        color: Colors.white,height: 25,
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 5.5,
                  left: MediaQuery.of(context).size.width / 10,
                  right: MediaQuery.of(context).size.width / 10),
              child: GridView.count(
                clipBehavior: Clip.none,
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 35,
                children: [
                  GestureDetector(
                    onTap:(){
                      Get.toNamed("/PostGrievance1");
                    },
                      child: dashboardGridContainer(context)),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/TrackGrievance");
                    },
                    child: dashboardGridContainer(context,
                        imageIconPath: 'assets/Track Grievance.svg',
                        imageIconText: 'Track Grievance'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/SubmitFeedback");
                    },
                    child: dashboardGridContainer(context,
                        imageIconPath: 'assets/Submit Feedback.svg',
                        imageIconText: 'Submit Feedback'),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed("/ContactUsScreen");
                    },
                    child: dashboardGridContainer(context,
                        imageIconPath: 'assets/Contact Us.svg',
                        imageIconText: 'Contact us'),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.62,
              left: MediaQuery.of(context).size.width / 20,
              child: const Text(
                'Latest Grievance Resolved',
                style: TextStyle(
                    color: Color(0xFFb83058),
                    fontSize: 18,
                    fontFamily: 'Montserrat-Medium'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 1.57),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 5),

                  // color: Colors.lightBlue,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3.6,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x15b83058),
// blurStyle:BlurStyle.inner,
                                blurRadius: 8,
                                spreadRadius: 1,
                                offset: Offset(0, 8))
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Expanded(
                                      flex: 4,
                                      child: Text(
                                        'OS/20221007-1',
                                        style: TextStyle(
                                            color: Color(0xFFb83058),
                                            fontSize: 14,
                                            fontFamily: 'Montserrat-Medium',
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
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
                                  children: const [
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Taluka',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Montserrat-Medium'),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Department',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontFamily: 'Montserrat-Medium'),
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Row(
                                  children: const [
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Tuljapur',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Montserrat-Medium'),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Collector',
                                          style: TextStyle(
                                              fontSize: 16,
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
                                    children: const [
                                      Text(
                                        'Nature of Grievance',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            fontFamily: 'Montserrat-Medium'),
                                      ),
                                      Text(
                                        'Water Supply',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Montserrat-Medium',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
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
                                children: const [
                                  Text(
                                    'Reg. Date : ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Montserrat-Medium',
                                        color: Colors.grey),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      '12/10/18',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Montserrat-Medium'),
                                    ),
                                  ),
                                  Text(
                                    'Resolved Date : ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontFamily: 'Montserrat-Medium'),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      '12/10/20',
                                      style: TextStyle(
                                          fontSize: 14,
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
                  )),
            )
          ],
        ),
      ),
    );
  }
}
