import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Repository/officer_login_repo.dart';
import '../Utility/CommonString.dart';
import '../Utility/TextFieldControllerFile.dart';
import '../Utility/snack_bar.dart';
import '../View_mdal/PieChartVM.dart';
import '../View_mdal/officer_login_vm.dart';

bool officerLogin= false;
var officerData =GetStorage();
final picChartVM = Get.put(PicChartVM());
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
final officerLoginVM=Get.put(OfficerLoginVM());

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast.init(context);
    setState(() {

    });
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
                padding:  EdgeInsets.only(bottom: 40.0),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/Login.svg",
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height /5,
              ),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.60,
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
                     Padding(
                        padding:   const EdgeInsets.only(left: 25.0),
                        child: Text(
                          "login".tr,
                          style: const TextStyle(
                            fontSize: 21,
                            // fontWeight: FontWeight.w600,
                            color: Color(0xFFb83058),
                            fontFamily: 'Montserrat-Medium',
                            // fontWeight: FontWeight.w200
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25),
                        child: SizedBox(
                          height: 47,
                          child: TextFormField(
                            controller: userNameController,
                            style: const TextStyle(fontFamily: 'Montserrat-Bold',height: 1),
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              hintText: 'o_UserName'.tr,
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w300
                              ),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFb83058), width: 1.3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: SvgPicture.asset(
                                'assets/Profile.svg',
                                fit: BoxFit.scaleDown,
                                height: 5,
                                width: 5,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                            top: 15
                        ),
                        child: SizedBox(
                          height: 47,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: password,
                            style: const TextStyle(
                                fontFamily: 'Montserrat-Medium',height: 1),
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              hintText: 'password'.tr,
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat-Regular',
                                  fontWeight: FontWeight.w300
                              ),
                              suffixIcon: IconButton(onPressed: (){
                                setState(() {
                                  password = !password;
                                });
                              }, icon: password
                                  ? const Icon(Icons.visibility_off,color: Colors.black45,)
                                  : const Icon(Icons.visibility,color: Colors.black45,),),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFb83058), width: 1.3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(''),
                          Text(
                            "forgotPass".tr,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat-Medium',
                            // fontWeight: FontWeight.bold,
                              color: Colors.transparent,
                              shadows: [
                                Shadow(offset: Offset(0, -7), color: Colors.blue)
                              ],
                              // Step 3 SEE HERE
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(' '),
                          InkWell(
                            onTap: (){
                              Get.offAllNamed("/loginAndSignUp");
                            },
                            child: Text(
                              "citizenLogin".tr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Montserrat-Medium',
                                fontWeight: FontWeight.w400,
                                color: Colors.transparent,
                                shadows: [
                                  Shadow(offset: Offset(0, -7), color: Colors.blue)
                                ],
                                // Step 3 SEE HERE
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25,)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 1.23),
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    await officerLoginVM.getOfficerDetails(userNameController.text, passwordController.text);
                    if(userNameController.text == ""){
                      toastMessage("name_missing_string".tr);
                    }
                    if( passwordController.text == ""){
                    toastMessage("password_missing_string".tr);
                    }

                    else if(officerLoginVM.officerDetails.isEmpty) {
                      toastMessage("$message");
                    }

                    else{
                      officerData.write('officerId',officerId );
                      officerData.write('officerName',officerName );
                      SharedPreferences pref= await SharedPreferences.getInstance();
                      pref.setString('login', subUserTypeId.toString());
                      picChartVM.chartDetails("1", "", "");
                      Get.offAndToNamed('/OfficerDashboard');
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
