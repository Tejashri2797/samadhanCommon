import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget drawerBox(
        {String icon = 'assets/Post Grievance Grey.svg',
        String section = 'PostGrievance'}) =>
    ListTile(
      leading: SvgPicture.asset(
        icon,
        //scale: 0.8,
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
        height: 18,
        width: 18,
      ),
      title: Text(
        iconImageText,
        style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade700,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500),
      ),
    );

Widget dashboardGridContainer(
  BuildContext context, {
  String imageIconPath = 'assets/Post Grievance.svg',
  String imageIconText = 'Post \nGrievance',
}) =>
    Container(
      height: MediaQuery.of(context).size.height/5,
     width: MediaQuery.of(context).size.width/2.5,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
              color: Color(0x15b83058),
// blurStyle:BlurStyle.inner,
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 8))
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 10,
            top: MediaQuery.of(context).size.height /50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              imageIconPath,
              height: 45,
              width: 40,
            ),
            Text(
              imageIconText,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat-',
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
