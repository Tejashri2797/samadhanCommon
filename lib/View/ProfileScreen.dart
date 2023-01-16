
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Repository/otppost_repository.dart';
import '../Utility/DashboardCommonWidget.dart';
import '../View_mdal/ProfileVM.dart';
import '../View_mdal/logout_viewmodal.dart';
import 'OTPTabbar.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final logoutViewModal= LogoutViewModal();
final profileVM= Get.put(ProfileVM());
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFb83058),
          ),
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
            child: Container(
              decoration: const BoxDecoration(
                  color:Colors.white,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(
                left: MediaQuery.of(context).size.width/15,right: MediaQuery.of(context).size.width/15,top: MediaQuery.of(context).size.height/4.9
            ),
            child: Container(
              height: MediaQuery.of(context).size.height/1.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    // blurStyle:BlurStyle.outer,
                      blurRadius: 3,
                    spreadRadius: 1,
                    offset: const Offset(0, 5)
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
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    margin: const EdgeInsets.only(right: 5,top: 18),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: SvgPicture.asset('assets/edit.svg',height: 16,width: 16,)
            ),
                ),
                   Text(profileName!,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat-Medium'
                    ),),
                    SizedBox(height:MediaQuery.of(context).size.height/25 ,),
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
                                  title: Container(
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
                                        SizedBox(height: 30,),
                                        Text(
                                          "logoutAlert".tr,
                                          style:const TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            MaterialButton(
                                              height: 40,
                                              minWidth: 100,
                                              color: Color(0xFFb83058),
                                              onPressed: () {
                                                Get.back();
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
                                              color: Color(0xFFb83058),
                                              onPressed: () async {
                                                await logoutViewModal.logoutCurrentUser(int.parse("${data.read('profileId')}"));
                                                data.remove('profileId');
                                                PostOTP.otpList2.clear();
                                                Get.offAllNamed('/loginAndSignUp');
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
              //   backgroundImage: AssetImage('assets/images/dashboard_screen/Profile Colorful.png',),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Row(
              children: [
                InkWell(
                  onTap:(){
                   Navigator.pop(context);
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
      )
    );
  }
}
