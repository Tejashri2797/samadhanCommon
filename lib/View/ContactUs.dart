
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
                       Text(
                      "contact".tr,

                      style:const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            

            Padding(
              padding:  EdgeInsets.only(
                  left: MediaQuery.of(context).size.width/15,right: MediaQuery.of(context).size.width/15,top: MediaQuery.of(context).size.height/7
              ),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        // blurStyle:BlurStyle.outer,
                        blurRadius: 3,

                       ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                       const SizedBox(height:40,),
                        SvgPicture.asset('assets/Contact Us pink.svg',height: MediaQuery.of(context).size.height/9,),
                          SizedBox(height: MediaQuery.of(context).size.height/20,),
                         Padding(
                           padding: EdgeInsets.only(left:20,right:15),
                            child: Text('contactus_desc'.tr,style: const TextStyle(
                                fontFamily: 'Montserrat-Medium',
                                fontSize: 15,
                                color: Colors.black,
                                height: 1.5
                            ),),
                          ),



                    SizedBox(height:60),
                    Stack(
                      children:[ Container(
                        height: 85,
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
                                      await launchUrl(Uri.parse('tel:02472-227301'));
                                    },
                                    child: Center(
                                      child: Text('   02472-227301',style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.green.shade600,
                                        fontFamily: 'Montserrat',


                                      ),),
                                    ),
                                  ),),
                        ),
                      ),

                                   Padding(
                                     padding: EdgeInsets.only(left: 10.0,top: 10),
                                     child: CircleAvatar(
                                      backgroundColor: Colors.green.shade400,
                                      radius: 30,
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
