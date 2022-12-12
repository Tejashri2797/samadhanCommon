import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utility/TextFieldControllerFile.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({Key? key}) : super(key: key);

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 1.7,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextFormField(
                controller: mobileNumberController,
                keyboardType: TextInputType.phone,
                cursorHeight: 25,
                cursorColor: const Color(0xFFb83058),
                style: const TextStyle( fontFamily: 'Montserrat',fontSize: 20,height: 1),
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFb83058))),
                    hintText: "Mobile Number",
                    hintStyle: const TextStyle(
                      height: 1,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black45,
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.normal),
                    prefixIcon: SvgPicture.asset(
                      "assets/Phone.svg",
                      color: Colors.black54,
                      height: 5,
                      width: 5,
                      fit: BoxFit.scaleDown,
                    ),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "We will send you One Time Password (OTP)",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                  fontFamily: 'Montserrat Bold',
                  fontStyle: FontStyle.normal),
            ),
            Padding(
              padding:  EdgeInsets.only(

                  top:MediaQuery.of(context).size.height/3.41,
                 left: MediaQuery.of(context).size.width/2,


              ),
              child: const Text(
                "Officer's Login",
                style: TextStyle(
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
              ),
            ),
          ],
        ),
      );

  }
}
