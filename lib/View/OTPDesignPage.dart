import 'package:countdown_widget/countdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samadhan/Utility/CommonString.dart';
import '../Utility/CommonOtpWidget.dart';
import '../Utility/TextFieldControllerFile.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.7,
      width: MediaQuery.of(context).size.width / 1.2,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text(
              "otpPage".tr,
              style: TextStyle(
                  fontSize: 16,
                  letterSpacing: (selectedLanguage=="English")?0.4:0.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: 'Montserrat-Black',
                  fontStyle: FontStyle.normal),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(

              children:  [
                Text(''),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    Get.offAllNamed("/loginAndSignUp");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      "editMobileNum".tr,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat-Black',
                          fontWeight: FontWeight.w400,
                          color: Colors.transparent,
                          shadows: [
                            Shadow(offset: Offset(0, -3), color: Colors.blueAccent.shade400)
                          ],
                          // Step 3 SEE HERE
                          decoration: TextDecoration.underline,

                          decorationColor:Colors.blueAccent.shade400,
                          decorationThickness: 1.5

                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Implement 4 input fields
            GestureDetector(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 3,
                  ),
                  OtpInput(fieldOne, true),
                  const SizedBox(
                    width: 5,
                  ), // auto focus
                  OtpInput(fieldTwo, false),
                  const SizedBox(
                    width: 5,
                  ),
                  OtpInput(fieldThree, false),
                  const SizedBox(
                    width: 5,
                  ),
                  OtpInput(fieldFour, false),
                  const SizedBox(
                    width: 5,
                  ),
                  OtpInput(fieldFive, false),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),


               Row(
                 children: [
                   Spacer(),
                   CountDownWidget(
                    duration: const Duration(milliseconds: 30000),
                    builder: (context, duration) {
                      return Text(
                        "00:${duration.inSeconds} ",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontFamily: 'Montserrat-Black',
                           ),
                      );
                    },
                    onControllerReady: (controller) {
                      countDownController = controller;
                    },
                    onDurationRemainChanged: (duration) {},
              ),
                 ],
               ),

            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "otpNotReceived".tr,
                style:  TextStyle(
                    fontSize: 17,
                    letterSpacing: (selectedLanguage=="English")?0.1:0.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'Montserrat-Black',
                    fontStyle: FontStyle.normal),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "resendOtp".tr,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat-Black',
                        fontWeight: FontWeight.w400,
                        color: Colors.transparent,
                        shadows: [
                          Shadow(offset: Offset(0, -3), color: Colors.blueAccent.shade400)
                        ],
                        // Step 3 SEE HERE
                        decoration: TextDecoration.underline,

                        decorationColor:Colors.blueAccent.shade400,
                        decorationThickness: 1.5

                    ),
                  ),),
            ),
          ],
        ),
      ),
    );
  }
}
