import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import 'MobileNumber.dart';
import 'SignUp.dart';

class LoginAndSignUp extends StatefulWidget {
  const LoginAndSignUp({Key? key}) : super(key: key);

  @override
  State<LoginAndSignUp> createState() => _LoginAndSignUpState();
}

TabController? tabController;

class _LoginAndSignUpState extends State<LoginAndSignUp> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll){
          overScroll.disallowIndicator();
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
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
                        left: 142.0, right: 142, top: 30, bottom: 210),
                    child: SvgPicture.asset(
                      "assets/Login.svg",
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

                            TabBar(padding: const EdgeInsets.only(top: 15,bottom: 15),
                              indicatorColor: const Color(0xFFb83058),
                              controller: tabController,
                              labelColor: const Color(0xFFb83058) ,
                              unselectedLabelColor:  Colors.black54,
                              tabs: const [
                                Tab(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(

                                        fontFamily: 'Montserrat Bold',
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Tab(
                                  child: Text("Sign Up ",
                                      style: TextStyle(

                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Montserrat Bold')),
                                ),
                              ],
                            ),
                             const Expanded(
                              flex: 1,
                                child: TabBarView(children: [MobileNumber(),SignUp()],))

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
                        Get.toNamed('/OTP_Page');
                      },
                      child: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.white,
                        child:
                            SvgPicture.asset("assets/Arrow Pink.svg", height:40),
                      ),
                    ),
                  ),
                ),
                Container(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
