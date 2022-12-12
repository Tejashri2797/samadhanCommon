import 'dart:async';

import 'package:countdown_widget/countdown_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utility/CommonOtpWidget.dart';
import '../Utility/TextFieldControllerFile.dart';

class OTP_Page extends StatefulWidget {
  const OTP_Page({Key? key}) : super(key: key);

  @override
  State<OTP_Page> createState() => _OTP_PageState();
}

class _OTP_PageState extends State<OTP_Page> {
  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
      width: MediaQuery.of(context).size.width / 1.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          const Text(
            "We have sent OTP on your Number. ",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black45,
                fontFamily: 'Montserrat Regular',
                fontStyle: FontStyle.normal),
          ),
          const SizedBox(
            height: 30,
          ),
          // Implement 4 input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpInput(fieldOne, true), // auto focus
              OtpInput(fieldTwo, false),
              OtpInput(fieldThree, false),
              OtpInput(fieldFour, false),
              OtpInput(fieldFive, false),
            ],

          ),
          const SizedBox(
            height: 20,
          ),
          /* ElevatedButton(
              onPressed: () {
                setState(() {
                  _otp = fieldOne.text +
                      fieldTwo.text +
                      fieldThree.text +
                      fieldFour.text +
                      fieldFive.text;
                });
              },
              child: const Text('Submit')),*/


          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/1.8),
            child: CountDownWidget(
              duration: const Duration(milliseconds:30000),
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
          const Text(
            "Didn't receive OTP? ",
            style: TextStyle(
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
              child: const Text(
                "Resend OTP",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  color: Colors.transparent,
                  shadows: [Shadow(offset: Offset(0, -8), color: Colors.blue)],
                  // Step 3 SEE HERE
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                ),
              )),

        ],
      ),
    );
  }
}
