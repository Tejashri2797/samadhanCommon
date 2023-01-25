import 'package:countdown_widget/countdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text(
              "otpPage".tr,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                  fontFamily: 'Montserrat',
                  fontStyle: FontStyle.normal),
            ),
            const SizedBox(
              height: 30,
            ),
            // Implement 4 input fields
            GestureDetector(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  OtpInput(fieldOne, true),
                  const SizedBox(
                    width: 10,
                  ), // auto focus
                  OtpInput(fieldTwo, false),
                  const SizedBox(
                    width: 10,
                  ),
                  OtpInput(fieldThree, false),
                  const SizedBox(
                    width: 10,
                  ),
                  OtpInput(fieldFour, false),
                  const SizedBox(
                    width: 10,
                  ),
                  OtpInput(fieldFive, false),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 1.8),
              child: CountDownWidget(
                duration: const Duration(milliseconds: 30000),
                builder: (context, duration) {
                  return Text(
                    "00:${duration.inSeconds} sec",
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black45,
                        fontFamily: 'Montserrat Regular',
                        fontStyle: FontStyle.normal),
                  );
                },
                onControllerReady: (controller) {
                  countDownController = controller;
                },
                onDurationRemainChanged: (duration) {},
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "otpNotReceived".tr,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                  fontFamily: 'Montserrat Regular',
                  fontStyle: FontStyle.normal),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "resendOtp".tr,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: Colors.transparent,
                    shadows: [
                      Shadow(offset: Offset(0, -8), color: Colors.blue)
                    ],
                    // Step 3 SEE HERE
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
