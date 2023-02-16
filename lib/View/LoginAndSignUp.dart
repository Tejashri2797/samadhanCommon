
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:samadhan/Modal/otp_modal.dart';
import 'package:samadhan/Utility/TextFieldControllerFile.dart';
import '../Modal/signup_modal.dart';
import '../Utility/CommonString.dart';
import '../Utility/signup_controller.dart';
import '../Utility/snack_bar.dart';
import '../View_mdal/district_viewmodal.dart';
import '../View_mdal/otp_viewmodal.dart';
import '../View_mdal/postotp_viewModal.dart';
import '../View_mdal/signup_viewmodal.dart';
import '../View_mdal/taluka_viewmodal.dart';
import '../View_mdal/vilaage_viewmoda.dart';
import '../service/CheckInternetCon.dart';
import 'MobileNumber.dart';

import 'SignUp.dart';

class LoginAndSignUp extends StatefulWidget {
  const LoginAndSignUp({Key? key}) : super(key: key);

  @override
  State<LoginAndSignUp> createState() => _LoginAndSignUpState();
}
final GetXNetworkManager networkManager = Get.put(GetXNetworkManager());
final ScrollController winController = ScrollController();
SignUpViewModal? signUpViewModal;
OTPViewModal otpViewModal = Get.put(OTPViewModal());
final postOtpViewModal = Get.put(PostOtpViewModal());
final districtViewModal = Get.put(DistrictViewModal());
final talukaViewModal = Get.put(TalukaViewModal());
final villageViewModal = Get.put(VillageViewModal());


List<OTPModalClass> otpInfo = [];

int selectedIndex = 0;
bool validateNumber = false;
bool userSignUp = false;

class _LoginAndSignUpState extends State<LoginAndSignUp> {



bool otpLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast.init(context);
    selectedIndex=0;
    mobileNumberController.clear();
    talukaViewModal.talukaList.clear();
    districtViewModal.districtList.clear();
    districtViewModal.isLoading.value=true;
    talukaViewModal.isLoading.value=true;
    villageViewModal.villageList.clear();
    villageViewModal.isLoading.value = true;
    talukaViewModal.getAllTaluka();
    districtViewModal.getAllDistrict();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
            inAsyncCall: (validateNumber == true || userSignUp == true ),
            color: Colors.black87,
            progressIndicator:  Container(
              decoration: BoxDecoration(
                  color: Colors.black,
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
            child: SizedBox(
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
                          height: 95,
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
                          height: MediaQuery.of(context).size.height / 1.56,
                          width: MediaQuery.of(context).size.width / 1.24,
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
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat-Black',
                                  letterSpacing:(selectedLanguage=="English")?1:0.0,
                                ),
                              ),
                              Text(
                                "signUp".tr,
                                style:  TextStyle(
                                  fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat-Black',
                                    letterSpacing:(selectedLanguage=="English")?1:0.0,
                                ),
                              ),
                            ],
                            views:   const [
                              MobileNumber(),
                              SignUp(),
                            ],
                            onChange: (index) =>
                                setState(() {
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

                            if(mobileNumberController.text == ''){
                              toastMessage("mobToaster".tr);
                            }

                            else{
                              setState(() {
                                validateNumber = true;
                              });
                              await otpViewModal
                                  .getOTPInformation(mobileNumberController.text);
                              otpViewModal.otpList;
                              (mobValidate == mobileNumberController.text)
                                  ?(otpViewModal.isLoading.value== true)?const CircularProgressIndicator(color: Colors.red,) : {
                                districtViewModal.districtList.clear(),
                                talukaViewModal.talukaList.clear(),
                                villageViewModal.villageList.clear(),
                                Get.offAllNamed("/OTP_Page")}
                              : toastMessage("ValidNobToaster".tr);

                            }
                            setState(() {
                                validateNumber = false;
                                otpViewModal.otpList.clear();
                            });
                          }
                          else {

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
                                                    setState(() {
                                                      userSignUp=true;
                                                    }),
                                                    signUpViewModal =
                                                        Get.put(SignUpViewModal()),
                                                    await signUpViewModal!
                                                        .postAllInformation(
                                                            SignUpModalClass()),

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
                                                      email.clear();
                                                      userSignUp= false;
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
                ],
              ),
            ),
          ),


    );
  }
}
