
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';



class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2.3,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFb83058),),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: Colors.white,
                    ),
                    const Text(
                      "Contact Us",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ),
            

            Padding(
              padding:  EdgeInsets.only(
                  left: MediaQuery.of(context).size.width/15,right: MediaQuery.of(context).size.width/15,top: MediaQuery.of(context).size.height/7
              ),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        // blurStyle:BlurStyle.outer,
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(0, 5)),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                       SizedBox(height:40,),
                        SvgPicture.asset('assets/Contact Us pink.svg',height: MediaQuery.of(context).size.height/9,),
                          SizedBox(height: MediaQuery.of(context).size.height/20,),
                          const Text('If you want to know about the grievance\n'
                              'redressal system or if you are facing any\n'
                              'technical difficulty please call on below\n'
                              '          phone number.Our call center\n'
                              '          representative will help you',style: TextStyle(
                              fontFamily: 'Montserrat-Light',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.5
                          ),),



                    SizedBox(height: MediaQuery.of(context).size.height/20,),
                    Stack(
                      children:[ Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,

                        child: Center(
                          child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/1.4,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green.shade600),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:
                                  InkWell(
                                    onTap: () async {
                                      await launchUrl(Uri.parse('tel:+1800-120-8040'));
                                    },
                                    child: Center(
                                      child: Text('   1800 120 8040',style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.green.shade600,
                                        fontFamily: 'Montserrat-Light',


                                      ),),
                                    ),
                                  ),),
                        ),
                      ),

                                   Padding(
                                     padding: EdgeInsets.only(left: 10.0,top: 10),
                                     child: CircleAvatar(
                                      backgroundColor: Colors.green.shade400,
                                      radius: 35,
                                      child: SvgPicture.asset('assets/Call Solid.svg'),

                            ),
                                   ),



                ])






                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
