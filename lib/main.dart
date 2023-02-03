import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Utility/CommonString.dart';
import 'View/ContactUs.dart';
import 'View/DashboardScreen.dart';
import 'View/Department Table.dart';
import 'View/FAQ.dart';
import 'View/GrievanceReceivedDetails.dart';
import 'View/LanguagePage.dart';
import 'View/LoginAndSignUp.dart';
import 'View/LoginPage.dart';
import 'View/NotificationScreen.dart';
import 'View/OTPTabbar.dart';
import 'View/OfficerDashBoard.dart';
import 'View/OfficerProfile.dart';
import 'View/PostGrievance.dart';
import 'View/ProfileScreen.dart';
import 'View/Splash_Screen.dart';
import 'View/SubmitFeedback.dart';
import 'View/SubmitFeedback1.dart';
import 'View/TrackGrievance.dart';
import 'View/TrackGrievanceSearch.dart';
import 'View/TrackGrievanceViewPage.dart';
import 'View/UpdateProfile.dart';
import 'View/gr_received_resolved.dart';
import 'View/grievance_received1.dart';
import 'View/officewise_report.dart';
import 'View/pendancy_report.dart';
import 'View/post_grievance.dart';
import 'View/report_screen.dart';
import 'View/satisfied_unsatisfied_report.dart';
import 'View/talukawise_report.dart';



/// 15-02-2023
String? langSelection;

Future<String> getLanguage() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
   return pref.getString('language') ?? '';
}

Future<void> main() async {

  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
///LandscapeMode Off
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  /// Status bar Color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFFb83058), // status bar color
  ));
   getLanguage().then((value) => {
    langSelection = value,
   print(langSelection),
    runApp( GetMaterialApp(

      theme: ThemeData(
        brightness: Brightness.light, primaryColor: const Color(0xFFb83058)),
    translations: LocalString(),
    debugShowCheckedModeBanner: false,
    locale: (langSelection == 'English')
        ? const Locale('en', "US")
        : (langSelection == 'Marathi')
            ? const Locale('mr', "IN")
            : const Locale('en', "US"),

    // initialRoute: '/OfficerDashboard',

    initialRoute: '/',

    getPages: [
      GetPage(name: '/', page: () => const SplashScreen()),
      GetPage(name: '/ChooseLanguage', page: () => const ChooseLanguage()),
      GetPage(name: '/officerLogin', page: () => const LoginPage()),
      GetPage(name: '/loginAndSignUp', page: () => const LoginAndSignUp()),
      GetPage(name: '/OTP_Page', page: () => const OTPTabPage()),
      GetPage(name: '/DashBoardScreen', page: () => const DashBoardScreen()),
      GetPage(name: '/OfficerDashboard', page: () => const OfficerDashboard()),
      GetPage(name: '/PostGrievanceCitizen', page: () => const PostGrievance1()),
      GetPage(name: '/SubmitFeedback', page: () => const SubmitFeedback()),
      GetPage(name: '/TrackGrievance', page: () => const TrackGrievance()),
      GetPage(
          name: '/TrackGrievanceSearch',
          page: () => const TrackGrievanceSearchRepo()),
      GetPage(
          name: '/TrackGrievanceViewPage',
          page: () => const TrackGrievanceViewPage()),
      GetPage(name: '/SubmitFeedback1', page: () => const SubmitFeedback1()),
      GetPage(name: '/FAQ', page: () => const FAQ()),
      GetPage(name: '/ContactUsScreen', page: () => const ContactUsScreen()),
      GetPage(
          name: '/NotificationScreen', page: () => const NotificationScreen()),
      GetPage(name: '/ProfileScreen', page: () => const ProfileScreen()),
      GetPage(name: '/reportScreen', page: () => const ReportScreen()),
      GetPage(name: '/department', page: () => const Department()),
      GetPage(name: '/OfficeWiseReport', page: () => const OfficeWiseReport()),
      GetPage(name: '/TalukaWiseReport', page: () => const TalukaWiseReport()),
      GetPage(name: '/PendancyReport', page: () => const PendancyReport()),
      GetPage(
          name: '/SatisfactionReport', page: () => const SatisfactionReport()),
      GetPage(
          name: '/grievanceReceivedScreen',
          page: () => const GrievanceReceivedScreen()),
      GetPage(
          name: '/GrReceivedDetails', page: () => const GrReceivedDetails()),
      GetPage(
          name: '/GrievanceRecievedResolved',
          page: () => const GrievanceRecievedResolved()),
      GetPage(name: '/OfficerProfile', page: () => const OfficerProfile()),
      GetPage(name: '/PostGrievanceScreen', page: () => const PostGrievanceScreen()),
      GetPage(name: '/UpdateProfile', page: () => const UpdateProfile()),
    ],
  ))});
}
