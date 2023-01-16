import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;

   OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  bool fill=false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 45,
      child: TextField(

        style: const TextStyle(
            color: Color(0xFFb83058),
            fontWeight: FontWeight.bold,
            fontSize: 22),
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: const Color(0xFFb83058),
        decoration: InputDecoration(
          filled: true,
          focusColor: const Color(0xFFb83058),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFb83058), width: 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
          ),
          counterText: '',
          hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
            fill=true;
          }
        },
      ),
    );
  }
}
