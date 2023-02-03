import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utility/TextFieldControllerFile.dart';
import '../View_mdal/district_viewmodal.dart';
import '../View_mdal/signup_validation.dart';
import '../View_mdal/taluka_viewmodal.dart';
GlobalKey<FormState> otpFormKey=GlobalKey<FormState>();
int? numberFlag;

class MobileNumber extends StatefulWidget {
  const MobileNumber({Key? key}) : super(key: key);

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

final allValidation=Get.put(AllValidation());
final districtViewModalno = Get.put(DistrictViewModal());
final talukaViewModalno = Get.put(TalukaViewModal());
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
              padding: const EdgeInsets.only(top: 40.0,left: 13,right: 13,bottom: 38),
              child: SizedBox(
                height: 50,
                child: Form(
                  key: otpFormKey,
                  child: TextFormField(
                   // validator: allValidation.mobileValidator1,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: mobileNumberController,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 25,
                    cursorColor: Colors.black26,
                    cursorWidth: 1,
                    expands: false,
                    style: const TextStyle(
                      letterSpacing: 0.2,
                      fontSize: 19,
                      color: Colors.black45,
                      fontFamily: 'Montserrat-Medium',
                      //  fontStyle: FontStyle.normal
                    ),
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)),
                        hintText: "mobile".tr,
                        hintStyle: const TextStyle(

                         letterSpacing: 0.2,
                            fontSize: 17,
                             color: Colors.black45,
                            fontFamily: 'Montserrat-Medium',
                          //  fontStyle: FontStyle.normal
                            ),
                        prefixIcon: SvgPicture.asset(
                          "assets/Phone.svg",
                          color: Colors.black45,
                          height: 5.5,
                          width: 5.5,
                          fit: BoxFit.scaleDown,
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45))),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 12.0,bottom: 40),
              child: Text(
                "otp".tr,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    fontFamily: 'Montserrat-Medium',
                   // fontStyle: FontStyle.normal
                ),
              ),
            ),

            Row(
              children:  [
                Text(''),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    Get.offAllNamed("/officerLogin");
                  },
                  child: Text(
                    "o_login".tr,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat-Medium',
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
              ],
            ),

          ],
        ),
      );

  }
}
