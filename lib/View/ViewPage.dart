/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:samadhan/Repository/post_signup.dart';

import '../View_mdal/otp_viewmodal.dart';
import '../View_mdal/signup_viewmodal.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}
OTPViewModal signUpViewModal = Get.put(OTPViewModal());
class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(body:ListView.builder(
      itemCount: signUpViewModal.otpList.length,
        itemBuilder: (context,index)=>ListTile(
      leading: Text(otpList[index].mobileNo!),
    )));
  }
}
*/
