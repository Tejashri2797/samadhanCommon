import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utility/CommonString.dart';
import '../Utility/snack_bar.dart';
import '../service/CheckInternetCon.dart';




class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);


  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();
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

  var locale;
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
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height /4.5,
              ),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.59,
                  width: MediaQuery.of(context).size.width / 1.21,
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
                            fontSize: 19,
                            // fontWeight: FontWeight.w600,
                            color: Color(0xFFb83058),
                            fontFamily: 'Montserrat-Medium',
                           //  fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25),
                        child: GestureDetector(
                          onTap: (){
                            var locale = const Locale('en','US');
                            Get.updateLocale(locale);
                            selectedLanguage = english.tr;
                          },
                          child: Container(
                            height: 43,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: (selectedLanguage == marathi)
                                      ? Colors.black26
                                      : const Color(0xFFb83058)),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale:1.2,
                                  child: Radio(
                                      activeColor: const Color(0xFFb83058),
                                      value: english,
                                      groupValue: selectedLanguage,
                                      onChanged: (val) {
                                        setState(() {
                                          selectedLanguage = val.toString();

                                        });
                                      }),
                                ),

                                Text(
                                  "English",
                                  style: (selectedLanguage== marathi)? TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                  ):const TextStyle(
                                      color:Color(0xFFb83058),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat-Regular',
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                            top: 10
                        ),
                        child: GestureDetector(
                          onTap: (){
                            selectedLanguage = marathi.tr;
                           locale = const Locale('mr','IN');
                            Get.updateLocale(locale);
                          },
                          child: Container(
                            height: 43,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: (selectedLanguage == english)
                                      ? Colors.black26
                                      : const Color(0xFFb83058)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale:1.2,
                                  child: Radio(
                                      activeColor: const Color(0xFFb83058),
                                      value: marathi,
                                      groupValue: selectedLanguage,
                                      onChanged: (val) {
                                        setState(() {
                                          selectedLanguage = val.toString();

                                          //  var locale = const Locale('mr','IN');
                                           // Get.updateLocale(locale);



                                        });
                                      },
                                  ),
                                ),
                                Text(
                                  "मराठी",
                                  style: (selectedLanguage== english)? const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                  ):const TextStyle(
                                      color:Color(0xFFb83058),
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500
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
                  top: MediaQuery.of(context).size.height / 1.20),
              child: Center(
                child: GestureDetector(
                  onTap: () async {

                   await getLanguage().then((value) => {
                      value ? Get.offAllNamed("/DashBoardScreen"): Get.offAllNamed('/loginAndSignUp')
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
