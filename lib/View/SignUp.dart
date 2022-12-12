import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utility/LocationListSignUp.dart';
import '../Utility/TextFieldControllerFile.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll){
        overScroll.disallowIndicator();
        return true;
      },
      child: Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height /1.45,
            width: MediaQuery.of(context).size.width / 1.2,
             child: Form(
              child: ListView(
                shrinkWrap: false,
                scrollDirection: Axis.vertical,

                children: [

                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       style:
                       TextStyle(fontFamily: 'Montserrat', height: 1),
                       cursorColor: Colors.grey,
                       decoration: InputDecoration(
                         hintText: 'User Name',
                         filled: true,
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                               color: Color(0xFFb83058), width: 2.0),
                           borderRadius: BorderRadius.circular(8),
                         ),
                         prefixIcon: SvgPicture.asset(
                           'assets/profile.svg',
                           fit: BoxFit.scaleDown,
                           height: 5,
                           width: 5,
                           color: Colors.grey,
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       keyboardType: TextInputType.number,
                       style:
                       TextStyle(fontFamily: 'Montserrat', height: 1),
                       cursorColor: Colors.grey,
                       decoration: InputDecoration(
                         hintText: 'Mobile Number',
                         filled: true,
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                               color: Color(0xFFb83058), width: 2.0),
                           borderRadius: BorderRadius.circular(8),
                         ),
                         prefixIcon: const Icon(
                           Icons.local_phone_outlined,
                           color: Colors.grey,
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       style: const TextStyle(
                           fontFamily: 'Montserrat', height: 1),
                       cursorColor: Colors.grey,
                       decoration: InputDecoration(
                         filled: true,
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                               color: Color(0xFFb83058), width: 2.0),
                           borderRadius: BorderRadius.circular(8),
                         ),
                         prefixIcon: SvgPicture.asset(
                           'assets/District.svg',
                           fit: BoxFit.scaleDown,
                           height: 5,
                           width: 5,
                           color: Colors.grey,
                         ),
                         suffixIcon: Padding(
                           padding: const EdgeInsets.only(left: 25.0),
                           child: Padding(
                             padding: const EdgeInsets.only(left: 11.0),
                             child: TextDropdownFormField(
                               options: district,
                               decoration: InputDecoration(
                                 border: OutlineInputBorder(
                                     borderRadius:
                                     BorderRadius.circular(8),
                                     borderSide: BorderSide.none),
                                 suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey,),
                                 hintText: district[0],
                                 hintStyle: TextStyle(
                                     fontFamily: 'Montserrat',
                                     height: 1),
                               ),
                               dropdownHeight: 200,
                             ),
                           ),
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       child: TextFormField(
                         style: const TextStyle(
                             fontFamily: 'Montserrat', height: 1),
                         cursorColor: Colors.grey,
                         decoration: InputDecoration(
                           filled: true,
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(8),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: const BorderSide(
                                 color: Color(0xFFb83058), width: 2.0),
                             borderRadius: BorderRadius.circular(8),
                           ),
                           prefixIcon: SvgPicture.asset(
                             'assets/District.svg',
                             fit: BoxFit.scaleDown,
                             height: 5,
                             width: 5,
                             color: Colors.grey,
                           ),
                           suffixIcon: Padding(
                             padding: const EdgeInsets.only(left: 25.0),
                             child: Container(
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 11.0),
                                 child: TextDropdownFormField(
                                   options: taluka,
                                   decoration: InputDecoration(
                                     border: OutlineInputBorder(
                                         borderRadius:
                                         BorderRadius.circular(8),
                                         borderSide: BorderSide.none),
                                     suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey,),
                                     hintText: taluka[0],
                                     hintStyle: TextStyle(
                                         fontFamily: 'Montserrat',
                                         height: 1),
                                   ),
                                   dropdownHeight: 200,
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       style: TextStyle(
                           fontFamily: 'Montserrat', height: 1),
                       cursorColor: Colors.grey,
                       decoration: InputDecoration(
                         filled: true,
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                               color: Color(0xFFb83058), width: 2.0),
                           borderRadius: BorderRadius.circular(8),
                         ),
                         prefixIcon: SvgPicture.asset(
                           'assets/District.svg',
                           fit: BoxFit.scaleDown,
                           height: 5,
                           width: 5,
                           color: Colors.grey,
                         ),
                         suffixIcon: Padding(
                           padding: const EdgeInsets.only(left: 25.0),
                           child: Container(
                             child: Padding(
                               padding: const EdgeInsets.only(left: 11.0),
                               child: TextDropdownFormField(
                                 options: village,
                                 decoration: InputDecoration(
                                   border: OutlineInputBorder(
                                       borderRadius:
                                       BorderRadius.circular(8),
                                       borderSide: BorderSide.none),
                                   suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey,),
                                   hintText: village[0],
                                   hintStyle: TextStyle(
                                       fontFamily: 'Montserrat',
                                       height: 1),
                                 ),
                                 dropdownHeight: 200,
                               ),
                             ),
                           ),
                         ),
                       ),
                     ),

                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                       keyboardType: TextInputType.emailAddress,
                       style:
                       TextStyle(fontFamily: 'Montserrat', height: 1),
                       cursorColor: Colors.grey,
                       decoration: InputDecoration(
                         hintText: 'Email',
                         filled: true,
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                               color: Color(0xFFb83058), width: 2.0),
                           borderRadius: BorderRadius.circular(8),
                         ),
                         prefixIcon: SvgPicture.asset(
                           'assets/email.svg',
                           fit: BoxFit.scaleDown,
                           height: 5,
                           width: 5,
                           color: Colors.grey,
                         ),
                       ),
                     ),
                   ),
                ],
              ),
            ),

        ),
      ),
    );

  }
}
