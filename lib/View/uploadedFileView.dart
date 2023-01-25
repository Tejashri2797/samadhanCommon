import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
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

          body: WebView(
              initialUrl: "$docPath",
              javascriptMode: JavascriptMode.unrestricted)),
    );
  }
}
