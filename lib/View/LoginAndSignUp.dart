import 'dart:async';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:samadhan/Modal/otp_modal.dart';
import 'package:samadhan/Utility/TextFieldControllerFile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Modal/signup_modal.dart';
import '../Utility/signup_controller.dart';
import '../Utility/snack_bar.dart';
import '../View_mdal/otp_viewmodal.dart';
import '../View_mdal/postotp_viewModal.dart';
import '../View_mdal/signup_viewmodal.dart';
import 'MobileNumber.dart';

import 'SignUp.dart';

class LoginAndSignUp extends StatefulWidget {
  const LoginAndSignUp({Key? key}) : super(key: key);

  @override
  State<LoginAndSignUp> createState() => _LoginAndSignUpState();
}
final ScrollController winController = ScrollController();
SignUpViewModal? signUpViewModal;
OTPViewModal otpViewModal = Get.put(OTPViewModal());
final postOtpViewModal = Get.put(PostOtpViewModal());

List<OTPModalClass> otpInfo = [];

int selectedIndex = 0;

class _LoginAndSignUpState extends State<LoginAndSignUp> {
  TabController? _tabController;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast.init(context);
    _scrollController.addListener(() {
      if (_scrollController.offset < 40) {
        setState(() {
          signupFlag = 2;
          print(signupFlag);
        });
      } else {
        setState(() {
          numberFlag = 1;
          print(numberFlag);
        });
      }
    });
  }

  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                color: const Color(0xFFb83058),
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/Login.svg",
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 6,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 17,
                  ),
                  child: Center(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: MediaQuery.of(context).size.height / 1.55,
                      width: MediaQuery.of(context).size.width / 1.19,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 6,
                            )
                          ]),
                      child: ContainedTabBarView(
                        tabBarProperties: const TabBarProperties(
                          indicatorColor: Color(0xFFb83058),
                          labelColor: Color(0xFFb83058),
                          unselectedLabelColor: Colors.black87,
                        ),

                        tabs: [

                          Text(
                            "login".tr,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat-Regular',
                            ),
                          ),
                          Text(
                            "signUp".tr,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat-Regular',
                            ),
                          ),
                        ],
                        views:  const [
                          MobileNumber(),
                          SignUp(),
                        ],
                        onChange: (index) => setState(() {
                        selectedIndex = index;

                       })
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 1.16),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (selectedIndex == 0) {
                        await otpViewModal
                            .getOTPInformation(mobileNumberController.text);
                        otpViewModal.otpList;
                        (mobileNumberController.text == '')
                            ? toastMessage("mobToaster".tr)
                            : (mobValidate == mobileNumberController.text)
                                ? Get.offAllNamed("/OTP_Page")
                                : toastMessage("ValidNobToaster".tr);

                        setState(() {
                          mobileNumberController.clear();
                          otpViewModal.otpList.clear();
                        });
                      } else {
                        (userName.text == "")
                            ? toastMessage("name".tr)
                            : (usermobileNo.text == "")
                                ? toastMessage("mobNo".tr)
                                : (selectedDistrictValue == null)
                                    ? toastMessage("district".tr)
                                    : (selectedTalukaValue == null)
                                        ? toastMessage("taluka".tr)
                                        : (selectedVillageValue == null)
                                            ? toastMessage("village".tr)
                                            : {
                                                signUpViewModal =
                                                    Get.put(SignUpViewModal()),
                                                await signUpViewModal!
                                                    .postAllInformation(
                                                        SignUpModalClass(
                                                  id: id,
                                                  name: userName.text,
                                                  mobileNo: usermobileNo.text,
                                                  districtId: int.parse(
                                                      selectedDistrictValue!),
                                                  talukaId: int.parse(
                                                      selectedTalukaValue!),
                                                  villageId: int.parse(
                                                      selectedVillageValue!),
                                                  emailId: email.text,
                                                  userTypeId: userTypeId,
                                                  deviceTypeId: deviceTypeId,
                                                )),
                                                print(postMob),
                                                (postMob == usermobileNo.text)
                                                    ? {
                                                  districtViewModal.districtList.clear(),
                                                  talukaViewModal.talukaList.clear(),
                                                  villageViewModal.villageList.clear(),
                                                        Get.offAllNamed(
                                                            '/OTP_Page')
                                                      }
                                                    : toastMessage(
                                                        "mobNoToaster".tr),
                                                setState(() {
                                                  usermobileNo.clear();
                                                  userName.clear();
                                                }),
                                              };
                      }
                      // otpViewModal.otpList;
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child:
                          SvgPicture.asset("assets/Arrow Pink.svg", height: 48),
                    ),
                  ),
                ),
              ),
              /*Container(
                height: MediaQuery.of(context).size.height / 0.5,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children:  const [
                    Text(
                      "Powered By : ",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Montserrat'),

                    ),
                    Image(image: AssetImage("assets/img.png"),height: 20,)
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
