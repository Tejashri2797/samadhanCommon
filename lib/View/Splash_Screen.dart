import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../View_mdal/PieChartVM.dart';


final picChartVM = Get.put(PicChartVM());
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
var type;
void getValue() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
 type = preferences.getString('login') ;
  if(type == "1"){
    Timer(const Duration(seconds:3),() async {

     //await picChartVM.chartDetails("1", "", "");
      Get.offAllNamed('/OfficerDashboard');
    });

  }
  else if(type == "7"){
    Timer(const Duration(seconds:3),(){

      Get.offAllNamed('/DashBoardScreen');
    });

  }
  else{
    Timer(const Duration(seconds:3),(){
      Get.offAllNamed('/ChooseLanguage');
    });

  }

}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    getValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb83058),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
            child: Column(
              children: [
                Center(child: Image.asset('assets/Samadhan App_white_icon.png',scale: 1.4,),),
                const Text('Samadhan',style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: 'Montserrat-Bold'
                ),),
                const SizedBox(height: 15,),
                const Text('PUBLIC GRIEVANCE REDRESSAL SYSTEM',
                  style: TextStyle(
                    color:Colors.white,
                  ),),
                const SizedBox(height: 15,),
                const Text('CITIZEN APP',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat-Bold',
                      color:Colors.white,
                      fontWeight: FontWeight.w300
                  ),),
              ],
            ),
          ),
          const Spacer(),
          Center(child: Image.asset('assets/Osmanabad District icon.png',scale: 1.8,),),
          const SizedBox(height: 10,),
          const Text('OSMANABAD DISTRICT',style: TextStyle(
            fontFamily: 'Montserrat',
            color:Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),),
          const SizedBox(height: 70,)


        ],
      ),
    );
  }
}
