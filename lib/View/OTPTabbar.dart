import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Modal/otp_postModal.dart';
import '../Repository/otp_Repository.dart';

import '../Repository/otppost_repository.dart';
import '../Utility/TextFieldControllerFile.dart';
import '../Utility/signup_controller.dart';
import '../Utility/snack_bar.dart';
import '../View_mdal/NotificationDetailsVM.dart';
import '../View_mdal/ProfileVM.dart';
import '../View_mdal/otp_viewmodal.dart';
import '../View_mdal/postotp_viewModal.dart';
import '../View_mdal/signup_viewmodal.dart';
import 'LoginAndSignUp.dart';
import 'MobileNumber.dart';
import 'OTPDesignPage.dart';
import 'SignUp.dart';
final data = GetStorage();
class OTPTabPage extends StatefulWidget {
  const OTPTabPage({Key? key}) : super(key: key);

  @override
  State<OTPTabPage> createState() => _OTPTabPageState();
}

class _OTPTabPageState extends State<OTPTabPage> {
  late  PostOtpViewModal postOtpViewModal;
  final profileVM= Get.put(ProfileVM());
  final notificatinDetailsVM= Get.put(NotificatinDetailsVM());
  TabController? _tabController;
  String validateId = "0";
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast.init(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: EdgeInsets.only(bottom: 40.0),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/OTP.svg",
                    height: 100,
                    width: 50,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Padding(
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
                      width: MediaQuery.of(context).size.width / 1.21,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 6,
                            ),
                          ]),
                      child: Column(
                        children: [
                          TabBar(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            indicatorColor: const Color(0xFFb83058),
                            controller: _tabController,
                            labelColor: Color(0xFFb83058),
                            unselectedLabelColor: Colors.black87,
                            tabs:  [
                              Tab(
                                child: Text(
                                  "login".tr,
                                  style:const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Montserrat-Regular',
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "signUp".tr,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Montserrat-Regular',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Expanded(
                              flex: 1,
                              child: TabBarView(
                                children: [OTP_Page(), SignUp()],
                              ))
                        ],
                      ),
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
                    if (postOTP ==
                        (fieldOne.text +
                            fieldTwo.text +
                            fieldThree.text +
                            fieldFour.text +
                            fieldFive.text)) {
                      await profileVM.getDetails(postId!);
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      pref.setBool('login', true);
                      data.write('profileId', postId);
                      data.write('profileName', profileName);
                      Get.offAllNamed('/DashBoardScreen');
                      toastMessage("loginToaster".tr);
                    } else if  (Registeredstatus == "null" ) {
                      print("success");
                      postOtpViewModal = Get.put(PostOtpViewModal());
                      await postOtpViewModal.postAllInformation(OTPPostModal(
                        mobileno: generatedOtpMob,
                        userId: int.parse(generatedOtpId!),
                        key: fieldOne.text +
                            fieldTwo.text +
                            fieldThree.text +
                            fieldFour.text +
                            fieldFive.text,
                        version: commonVersion,
                        loginDeviceTypeId: logindevicetypeId,
                        subUserTypeId: subUsertypeId,
                        fcmId: fcmId,
                        createdBy: createdBy,
                        userTypeId: usertypeId,
                      ));


                      if(PostOTP.otpList2.isNotEmpty) {
                      await profileVM.getDetails(id1!);
                      await notificatinDetailsVM.notificationData(id1!);
                      SharedPreferences pref = await SharedPreferences.getInstance();
                       pref.setBool('login', true);
                         data.write('profileId', id1);
                         data.write('profileName', profileName);
                        Get.offAndToNamed('/DashBoardScreen');
                      }
                          else {
                        toastMessage("otpToaster".tr);
                      }



                    } else {
                      toastMessage("otpToaster".tr);
                    }
                    setState(() {
                      fieldOne.clear();
                      fieldTwo.clear();
                      fieldThree.clear();
                      fieldFour.clear();
                      fieldFive.clear();
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child:
                        SvgPicture.asset("assets/Arrow Pink.svg", height: 50),
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
    );
  }
}
