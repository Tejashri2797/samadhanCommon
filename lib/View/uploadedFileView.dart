import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../View_mdal/TrackGrievanceByIDVM.dart';

class UploadedFileView extends StatefulWidget {
  const UploadedFileView({Key? key}) : super(key: key);

  @override
  State<UploadedFileView> createState() => _UploadedFileViewState();
}

class _UploadedFileViewState extends State<UploadedFileView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height / 2.8,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFFb83058)),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20,bottom: 20,top: 20),
              child: WebView(
                  initialUrl: "$docPath",
                  javascriptMode: JavascriptMode.unrestricted),
            ),

             Padding(
               padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/1.2),
               child: IconButton( onPressed: (){
                 Get.back();
               },  icon:const Icon(Icons.cancel_outlined,size: 40,color: Colors.white,)),
             ),

          ])),
    );
  }
}
