import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:samadhan/View/LanguagePage.dart';
import 'package:samadhan/View/LoginPage.dart';

import 'MobileNumber.dart';
import 'OTPDesignPage.dart';
import 'SignUp.dart';

class OTPLoginAndSignUp extends StatefulWidget {
  const OTPLoginAndSignUp({Key? key}) : super(key: key);

  @override
  State<OTPLoginAndSignUp> createState() => _OTPLoginAndSignUpState();
}

TabController? tabController;

class _OTPLoginAndSignUpState extends State<OTPLoginAndSignUp> {


  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll){
        overScroll.disallowIndicator();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  color: const Color(0xFFb83058),
                  height: MediaQuery.of(context).size.height / 2.4,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 150.0, right: 150, top: 30, bottom: 210),
                    child: SvgPicture.asset(
                      "assets/OTP.svg",
                      height: 40,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height /8.5,
                  ),
                  child: DefaultTabController(
                    length: 2,
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.45,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 6,
                              )
                            ]),
                        child: Column(
                          children: [

                            TabBar(padding: EdgeInsets.only(top: 15,bottom: 15),
                              indicatorColor: const Color(0xFFb83058),
                              controller: tabController,
                              labelColor: const Color(0xFFb83058) ,
                              unselectedLabelColor:  Colors.black54,
                              tabs: const [
                                Tab(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        //color: (tabController?.index == 0)?const Color(0xFFb83058): Colors.black54,
                                        fontFamily: 'Montserrat Bold',
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Tab(
                                  child: Text("Sign Up ",
                                      style: TextStyle(
                                        //  color: (tabController?.index==1)?const Color(0xFFb83058): Colors.black54,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Montserrat Bold')),
                                ),
                              ],
                            ),
                             const Expanded(
                                flex: 1,
                                child: TabBarView(children: [OTP_Page (),SignUp()],))

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 1.27),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/DashBoardScreen');
                      },
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child:
                        SvgPicture.asset("assets/Arrow Pink.svg", height: 50),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 0.5,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 6),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
