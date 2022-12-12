import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget drawerBox(
        {String icon = 'assets/Post Grievance Grey.svg',
        String section = 'PostGrievance'}) =>
    ListTile(
      leading: SvgPicture.asset(
        icon,
        //scale: 0.8,
        height: 30,
        color: Colors.grey.shade700,
      ),
      title: Text(
        section,
        style: const TextStyle(
            fontSize: 18,
            color: Colors.black45,
            fontFamily: 'Montserrat-Medium',
            fontWeight: FontWeight.w500),
      ),
      );

Widget profileListTile(
        {String iconImagePath = 'assets/Phone.svg',
        String iconImageText = '9852306147'}) =>
    ListTile(
      leading: SvgPicture.asset(
        iconImagePath,
        height: 20,
        width: 20,
      ),
      title: Text(
        iconImageText,
        style: TextStyle(
            fontSize: 17,
            color: Colors.grey.shade700,
            fontFamily: 'Montserrat-Light',
            fontWeight: FontWeight.w500),
      ),
    );

Widget dashboardGridContainer(
  BuildContext context, {
  String imageIconPath = 'assets/Post Grievance.svg',
  String imageIconText = 'Post \nGrievance',
}) =>
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
            left: MediaQuery.of(context).size.width / 20,
            top: MediaQuery.of(context).size.height /50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              imageIconPath,
              height: 40,
              width: 40,
            ),
            Text(
              imageIconText,
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontFamily: 'Montserrat-Medium',
                  fontSize: 18),
            )
          ],
        ),
      ),
    );
