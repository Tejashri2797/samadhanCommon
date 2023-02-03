
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:samadhan/View_mdal/vilaage_viewmoda.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Repository/otppost_repository.dart';
import '../Utility/DashboardCommonWidget.dart';
import '../View_mdal/ProfileVM.dart';
import '../View_mdal/district_viewmodal.dart';
import '../View_mdal/logout_viewmodal.dart';
import '../View_mdal/taluka_viewmodal.dart';
import 'OTPTabbar.dart';
import 'UpdateProfile.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final logoutViewModal= LogoutViewModal();
final profileVM= Get.put(ProfileVM());
bool backScreen= false;

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp){
        profileVM.profileDetails.clear();
        profileVM.isLoading.value= true;
        profileVM.getDetails("${data.read('profileId')}");



      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        profileVM.profileDetails.clear();
        profileVM.isLoading.value =true;
        await profileVM.getDetails("${data.read('profileId')}");
        Get.back();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  Obx(
                () =>  ModalProgressHUD(
                  color: Colors.black,
                  inAsyncCall: (profileVM.isLoading.value),
                  progressIndicator: Container(
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
                  child: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height/2.5,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xFFb83058),
              ),
              Padding(
                  padding:  EdgeInsets.only(
                      left: MediaQuery.of(context).size.width/15,right: MediaQuery.of(context).size.width/15,top: MediaQuery.of(context).size.height/5
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height/1.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                         spreadRadius: 5,
                            blurRadius: 4,

                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Column(
                        children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () async {
                            Get.toNamed("/UpdateProfile")?.then((_) {
                              setState(() {

                              });
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(9),
                            margin: const EdgeInsets.only(right: 5,top: 18),
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: SvgPicture.asset('assets/edit.svg',height: 16,width: 16,)
                  ),
                        ),
                      ),
                         Text(profileName!,
                          style: const TextStyle(
                              height: 1.3,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat-Medium',
                              fontSize: 18
                          ),),
                          SizedBox(height:20 ,),
                          profileListTile(
                            iconImagePath: 'assets/Phone.svg',
                            iconImageText: MobileNumber!,
                          ),
                          profileListTile(
                              iconImagePath: 'assets/email.svg',
                              iconImageText: Email!,
                          ),
                          profileListTile(
                            iconImagePath: 'assets/location.svg',
                            iconImageText: district!,
                          ),
                          profileListTile(
                            iconImagePath: 'assets/District.svg',
                            iconImageText: taluka!,
                          ),
                          profileListTile(
                            iconImagePath: 'assets/Village.svg',
                            iconImageText:village!,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () async {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      AlertDialog(
                                        title: SizedBox(
                                          height: 170,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width / 0.8,
                                          child: Column(
                                            children: [


                                              Center(
                                                child: SvgPicture.asset(
                                                  'assets/Notification Alert.svg',
                                                  height: 50,
                                                ),
                                              ),
                                              const SizedBox(height: 30,),
                                              Text(
                                                "logoutAlert".tr,
                                                style:const TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(height: 20,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  MaterialButton(
                                                    height: 40,
                                                    minWidth: 100,
                                                    color: const Color(0xFFb83058),
                                                    onPressed: () {
                                                      Timer(const Duration(seconds: 1), () {
                                                        Get.back();
                                                      });
                                                    },
                                                    child:  Text(
                                                      'n'.tr,
                                                      style:const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  MaterialButton(
                                                    height: 40,
                                                    minWidth: 100,
                                                    color: const Color(0xFFb83058),
                                                    onPressed: () async {
                                                      profileVM.profileDetails.clear();
                                                      profileVM.isLoading.value= true;
                                                      await logoutViewModal.logoutCurrentUser(int.parse("${data.read('profileId')}"));
                                                      data.remove('profileId');
                                                      data.remove('profileName');
                                                      PostOTP.otpList2.clear();
                                                      SharedPreferences pref= await SharedPreferences.getInstance();
                                                      pref.remove('login');
                                                      pref.remove('visit');
                                                      pref.remove('language');

                                                    Timer(Duration(seconds: 1),(){
                                                      Get.offAllNamed('/loginAndSignUp');
                                                    });
                                                      },
                                                    child: Text(
                                                      'y'.tr,
                                                      style:  const TextStyle(
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
                            child: profileListTile(
                              iconImagePath: 'assets/logout pink.svg',
                              iconImageText: 'logout'.tr,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/50,)

                        ],
                      ),
                    ),
                  ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height/6.2,
                  left: MediaQuery.of(context).size.width/2.4,
                  child: CircleAvatar(
                    radius: 36,
                    child: SvgPicture.asset('assets/Profile Colorful.svg',),

                  ),
              ),
              Positioned(
                  top: 50,
                  left: 20,
                  child: Row(
                    children: [
                      InkWell(
                        onTap:() async {

                            profileVM.profileDetails.clear();
                            profileVM.isLoading.value =true;
                            await profileVM.getDetails("${data.read('profileId')}");
                            Get.back();




                        },
                          child: const Icon(Icons.arrow_back_ios_sharp,size: 25, color:Colors.white,)),
                      SizedBox(width: MediaQuery.of(context).size.width/25,),
                     Text('profile'.tr,style:  const TextStyle(
                          color:Colors.white,
                        fontSize: 20,
                        fontFamily: 'Montserrat'
                      ),)
                    ],
                  ),
              )
            ],
          ),
                ),
        )
      ),
    );
  }
}
