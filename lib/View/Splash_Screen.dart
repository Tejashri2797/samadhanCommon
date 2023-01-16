import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashboardScreen.dart';
import 'LanguagePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
Future<bool> getValue() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool('login') ?? false;
}
class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    getValue().then((value) => value ?   Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => const DashBoardScreen()
            )
        )
    ):  Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                ChooseLanguage()
            )
        )
    ));

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
