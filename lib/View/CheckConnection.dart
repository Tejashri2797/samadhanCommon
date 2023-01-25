/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utility/snack_bar.dart';
import '../service/CheckInternetCon.dart';

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // create an instance
  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          (networkManager.connectionType == 0 )? toastMessage('No Internet'):Text(''),

          ],
        ),
      ),
    );
  }
}*/
