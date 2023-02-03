import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget drawerBox(
        {String icon = 'assets/Post Grievance Grey.svg',
        String section = 'PostGrievance'}) =>
    ListTile(
      leading: SvgPicture.asset(
        icon,
          height: 25,
        color: Color(0xFFb83058)
      ),
      title: Text(
        section,
        style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontFamily: 'Montserrat',
           fontWeight: FontWeight.w500,
      ),
      ));

Widget profileListTile(
        {String iconImagePath = 'assets/Phone.svg',
        String iconImageText = '9852306147'}) =>
    ListTile(
      leading: SvgPicture.asset(
        iconImagePath,
        height: 20,
        width: 22,
      ),
      title: Text(
        iconImageText,
        style: TextStyle(
            fontSize: 15,
            color: Colors.black54,
            height: 1.3,
            fontFamily: 'Montserrat',

        ),
      ),
    );

Widget dashboardGridContainer(BuildContext context, {
  String imageIconPath = 'assets/Post Grievance.svg',
  String imageIconText = 'Post Grievance',
}) =>
    Container(
      height: MediaQuery.of(context).size.height/4.95,
     width: MediaQuery.of(context).size.width/2.55,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,

              blurRadius: 5,
              spreadRadius: 2,
             )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width /15,
            top: MediaQuery.of(context).size.height /50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              imageIconPath,
              height: 48,
              width: 40,
            ),
            Text(
              imageIconText,

              style: const TextStyle(
                height: 1.3,
                  color: Colors.black87,
               fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat-Medium',
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
