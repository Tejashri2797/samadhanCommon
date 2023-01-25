import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget dashboardGridContainer(
    BuildContext context, {
      String imageIconPath = 'assets/Post Grievance.svg',
      String imageIconText = 'Post \nGrievance',
      Color boxColor = Colors.lightBlue,
    }) =>
    Container(
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(20),
        /*     boxShadow: const [
          BoxShadow(
              color: Color(0x15b83058),
// blurStyle:BlurStyle.inner,
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 8))
        ],*/
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 28,
          bottom: MediaQuery.of(context).size.height / 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              imageIconText,
              style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            )
          ],
        ),
      ),
    );

Widget reportsIconContainer({
  Color shadowColor = Colors.grey,
  String imagePtah = 'assets/Post Grievance.svg',
}) =>
    Container(
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: shadowColor, blurRadius: 2, offset: Offset(0, 5))
          ]),
      child: Center(
          child: SvgPicture.asset(
            'assets/Post Grievance.svg',
            height: 25,
          )),
    );

Widget profileListTile(
    {String iconImagePath = 'assets/profile_screen/Phone.svg',
      String iconImageText = '9852306147'}) =>
    ListTile(
      leading: Container(
        height: 30,
        width: 30,
        child: SvgPicture.asset(
          iconImagePath,
          color: Colors.grey.shade400,
        ),
      ),
      title: Text(
        iconImageText,
        style: TextStyle(
            fontSize: 16.5,
            color: Colors.grey.shade500,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400),
      ),
    );
