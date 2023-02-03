import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utility/CommonString.dart';
import '../Utility/snack_bar.dart';



class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);


  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

 Locale locale = const Locale('en','US');

class _ChooseLanguageState extends State<ChooseLanguage> {

  Future<bool> getLanguage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('visit') ?? false;
  }
      @override
  void initState() {
        fToast.init(context);

        // TODO: implement initState
    super.initState();



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding:  EdgeInsets.only(bottom: 40.0),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/Language White.svg",
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height /5.5,
              ),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.70,
                  width: MediaQuery.of(context).size.width / 1.25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3,
                          spreadRadius: 2
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Text(
                          "Choose Language",
                          style: TextStyle(
                            letterSpacing: 0.3,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFb83058),
                            fontFamily: 'Montserrat-Black',
                           //  fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,right: 30),
                        child: GestureDetector(
                          onTap: () async {
                            locale = const Locale('en','US');
                            Get.updateLocale(locale!);
                            selectedLanguage = english.tr;
                            SharedPreferences pref= await SharedPreferences.getInstance();
                            pref.setString('language', selectedLanguage);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: (selectedLanguage == marathi)
                                      ? Colors.black26:
                                  (selectedLanguage == english)?
                                       const Color(0xFFb83058):
                                  Colors.black26
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale:1.2,
                                  child: Radio(
                                      activeColor: const Color(0xFFb83058),
                                      value: english,
                                      groupValue: selectedLanguage,
                                      onChanged: (val)  {
                                        setState(()  {
                                          selectedLanguage = val.toString();

                                        });

                                      }),
                                ),

                                Text(
                                  "English",
                                  style: (selectedLanguage == marathi)? TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                    fontFamily: 'Montserrat-Medium',
                                  ):(selectedLanguage== english)?const TextStyle(
                                      color:Color(0xFFb83058),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat-Medium',
                                      fontWeight: FontWeight.w500
                                  ):
                                  TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                    fontFamily: 'Montserrat-Medium',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0,
                            right: 30.0,
                            top: 15
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            selectedLanguage = marathi.tr;
                           locale = const Locale('mr','IN');
                            Get.updateLocale(locale!);
                            SharedPreferences pref= await SharedPreferences.getInstance();
                            pref.setString('language', selectedLanguage);
                            if (kDebugMode) {
                              print(selectedLanguage);
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: (selectedLanguage == english)
                                      ? Colors.black26
                                      : (selectedLanguage == marathi)?const Color(0xFFb83058):
                                  Colors.black26
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale:1.2,
                                  child: Radio(
                                      activeColor: const Color(0xFFb83058),
                                      value: marathi,
                                      groupValue: selectedLanguage,
                                      onChanged: (val) async {
                                        setState(() {
                                          selectedLanguage = val.toString();
                                        });

                                        }

                                  ),
                                ),
                                Text(
                                  "मराठी",
                                  style: (selectedLanguage== english)? const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                  ): (selectedLanguage== marathi)?const TextStyle(
                                      color:Color(0xFFb83058),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500
                                  ):
                                 const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'Montserrat-Black',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 1.30),
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    if(selectedLanguage == ""){
                    toastMessage('Choose Language');}
                    else {
                      setState(() {

                      });
                      await getLanguage().then((value) =>
                      {
                        value ?Timer(Duration(seconds: 3), () {
                          Get.offAllNamed("/DashBoardScreen");
                        }) : Get
                            .offAllNamed('/loginAndSignUp')
                      });
                    }





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

          ],
        ),
      ),
    );
  }
}
