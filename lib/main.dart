import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Utility/CommonString.dart';
import 'View/ContactUs.dart';
import 'View/DashboardScreen.dart';
import 'View/DatePic.dart';
import 'View/DropDown.dart';
import 'View/FAQ.dart';
import 'View/LanguagePage.dart';
import 'View/LoginAndSignUp.dart';
import 'View/LoginAndSignUp.dart';
import 'View/LoginPage.dart';
import 'View/LoginPage.dart';
import 'View/NotificationScreen.dart';
import 'View/OTPDesignPage.dart';
import 'View/OTPTabbar.dart';
import 'View/OfficerDashBoard.dart';
import 'View/PostGrievance.dart';
import 'View/ProfileScreen.dart';
import 'View/Splash_Screen.dart';
import 'View/SubmitFeedback.dart';
import 'View/SubmitFeedback1.dart';
import 'View/SubmitFeedback2.dart';
import 'View/TrackGrievance.dart';
import 'View/TrackGrievanceSearch.dart';
import 'View/TrackGrievanceViewPage.dart';


Future<bool> getValue() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool('login') ?? false;
}


Future<void> main() async {

  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

 getValue().then((value) { runApp( GetMaterialApp(
     theme: ThemeData(
       brightness: Brightness.light,
      primaryColor : const Color(0xFFb83058)
     ),
   translations: LocalString(),
   locale: const Locale('en','US'),
  debugShowCheckedModeBanner: false,

    initialRoute:  value ? '/DashBoardScreen' : '/' ,

    getPages: [

       GetPage(name: '/', page: () => SplashScreen()),
       GetPage(name: '/ChooseLanguage', page: () => ChooseLanguage()),
       GetPage(name: '/officerLogin', page: ()=>const LoginPage()),
       GetPage(name: '/loginAndSignUp', page: ()=>const LoginAndSignUp()),
       GetPage(name: '/OTP_Page', page: ()=>const OTPTabPage()),
      GetPage(name: '/DashBoardScreen', page: () => const DashBoardScreen()),
      GetPage(name: '/OfficerDashboard', page: () => const OfficerDashboard()),
      GetPage(name: '/PostGrievance1', page: () => const PostGrievance1()),
      GetPage(name: '/SubmitFeedback', page: () => const SubmitFeedback()),
      GetPage(name: '/TrackGrievance', page: () => const TrackGrievance()),
      GetPage(name: '/TrackGrievanceSearch', page: () => const TrackGrievanceSearchRepo()),
      GetPage(name: '/TrackGrievanceViewPage', page: () => const TrackGrievanceViewPage()),
      GetPage(name: '/SubmitFeedback1', page: () => const SubmitFeedback1()),
      GetPage(name: '/SubmitFeedback2', page: () => const SubmitFeedback2()),
      GetPage(name: '/FAQ', page: () => const FAQ()),
      GetPage(name: '/ContactUsScreen', page: () => const ContactUsScreen()),
      GetPage(name: '/NotificationScreen', page: () => const NotificationScreen()),
      GetPage(name: '/ProfileScreen', page: () => const ProfileScreen()),
     // GetPage(name: '/', page: () => const SplashScreen()),

    ],


 ) );}
 );

}


