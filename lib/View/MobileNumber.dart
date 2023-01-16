import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utility/TextFieldControllerFile.dart';
import '../View_mdal/signup_validation.dart';
GlobalKey<FormState> otpFormKey=GlobalKey<FormState>();
int? numberFlag;
class MobileNumber extends StatefulWidget {
  const MobileNumber({Key? key}) : super(key: key);

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

final allValidation=Get.put(AllValidation());
class _MobileNumberState extends State<MobileNumber> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();



  }
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height /2,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                height: 47,
                child: Form(
                  key: otpFormKey,
                  child: TextFormField(
                   // validator: allValidation.mobileValidator1,
                    controller: mobileNumberController,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 25,
                    cursorColor: const Color(0xFFb83058),
                    style: const TextStyle( fontFamily: 'Montserrat',fontSize: 20,height: 1),
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFb83058))),
                        hintText: "mobile".tr,
                        hintStyle: const TextStyle(
                          height: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.black45,
                            fontFamily: 'Montserrat-Medium',
                          //  fontStyle: FontStyle.normal
                            ),
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
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25),
              child: Text(
                "otp".tr,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                   // fontStyle: FontStyle.normal
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text(''),
                GestureDetector(
                  onTap: (){
                    Get.offAllNamed("/officerLogin");
                  },
                  child: Text(
                    "o_login".tr,
                    style: TextStyle(
                      fontSize: 16,
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
            const SizedBox(height: 25,)
          ],
        ),
      );

  }
}
