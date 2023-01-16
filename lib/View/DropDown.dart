import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samadhan/View/SignUp.dart';
import '../Utility/LocationListSignUp.dart';

class getDropDownData extends StatefulWidget {
  const getDropDownData({Key? key}) : super(key: key);

  @override
  State<getDropDownData> createState() => _getDropDownDataState();
}

class _getDropDownDataState extends State<getDropDownData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(

           child: DropdownButtonFormField(
              style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black54,
                  fontWeight: FontWeight.w300
              ),
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Osmanabad',
                border: OutlineInputBorder(
                    borderSide: BorderSide.none),
              ),
              //value: items.district![0].toString(),
              items: districtViewModal.districtList
                  .map((items) =>
                  DropdownMenuItem(
                    value: items.m_District,
                    child: Text(items.m_District.toString(),
                        style: const TextStyle(
                            fontFamily: 'Monteserrat',
                            fontSize: 17)),
                  ))
                  .toList(),
              onChanged: (district) =>
                  setState(() =>
                  selectdistrict = district),

                 menuMaxHeight: 300,
            )
        ),
      ),
    );
  }
}
