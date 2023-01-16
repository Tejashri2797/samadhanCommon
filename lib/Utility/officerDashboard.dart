import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget drawerBox(
        {String icon = 'assets/Post Grievance Grey.svg',
        String section = 'PostGrievance'}) =>
    ListTile(
        leading: SvgPicture.asset(icon,
            //scale: 0.8,
            height: 25,
            color: Color(0xFFb83058)),
        title: Text(
          section,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'Montserrat-Regular',
          ),
        ));

Widget profileListTile(
        {String iconImagePath = 'assets/images/Phone.svg',
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
            fontFamily: 'Montserrat-Regular',
            fontWeight: FontWeight.w500),
      ),
    );

DateTime today = DateTime.now();
String currentDate = "${today.day}/${today.month}/${today.year}";


Widget offdashboardGridContainer(BuildContext context,
        {String imageIconPath = 'assets/Post Grievance.svg',
        String imageIconText = 'Post \nGrievance',
        Color containerColor = Colors.yellowAccent}) =>
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: const [
          BoxShadow(
              color: Color(0x15b83058),
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 8))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 55,
            width: 70,
            decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(45),
                  topLeft: Radius.circular(13),

                  //topRight: Radius.circular(4)
                )),
            child: Center(
              child: SvgPicture.asset(
                imageIconPath,
                height: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 20),
            child: Text(
              imageIconText,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat-Medium',
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
