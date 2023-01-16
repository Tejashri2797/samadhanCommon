import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

AnimatedSnackBar snackBar(String message) => AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.info,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      desktopSnackBarPosition: DesktopSnackBarPosition.bottomLeft,
    );

FToast fToast = FToast();

Widget toast(String toastMessage) {
  return Container(
    width: 200,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 2,
          )
        ],
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
    ),
    child: Center(child: Text(toastMessage)),
  );
}

void toastMessage(String msg) => fToast.showToast(
    child: toast(msg),
    toastDuration: const Duration(seconds: 3),
    positionedToastBuilder: (context, child) {
      return Positioned(
        top: MediaQuery.of(context).size.height / 1.2,
        left: MediaQuery.of(context).size.width / 4,
        child: child,
      );
    });
