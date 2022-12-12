import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:samadhan/Utility/CommonString.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                color: const Color(0xFFb83058),
                height: MediaQuery.of(context).size.height / 2.4,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height/5),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/Language White.svg",
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height /7.2,
                ),
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 6,
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
                                fontSize: 22,
                               // fontWeight: FontWeight.w600,
                                color: Color(0xFFb83058),
                                fontFamily: 'Montserrat',
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: (selectedLanguage == marathi)
                                      ? Colors.black26
                                      : const Color(0xFFb83058)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Radio(
                                    activeColor: const Color(0xFFb83058),
                                    value: english,
                                    groupValue: selectedLanguage,
                                    onChanged: (val) {
                                      setState(() {
                                        selectedLanguage = val.toString();
                                      });
                                    }),
                                const Text(
                                  "English",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Montserrat Light',
                                      fontWeight: FontWeight.w200),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                          ),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: (selectedLanguage == english)
                                      ? Colors.black26
                                      : const Color(0xFFb83058)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Radio(
                                    activeColor: const Color(0xFFb83058),
                                    value: marathi,
                                    groupValue: selectedLanguage,
                                    onChanged: (val) {
                                      setState(() {
                                        selectedLanguage = val.toString();
                                      });
                                    }),
                                const Text(
                                  "Marathi",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Montserrat Light',
                                      fontWeight: FontWeight.w200),
                                )
                              ],
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
                    top: MediaQuery.of(context).size.height / 1.27),
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed('/login');
                    },
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child:
                          SvgPicture.asset("assets/Arrow Pink.svg", height: 50),
                    ),
                  ),
                ),
              ),
              Container(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
