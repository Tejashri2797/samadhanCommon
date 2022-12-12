import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFb83058),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
            child: Container(
              decoration: BoxDecoration(
                color:Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 15,
                right: MediaQuery.of(context).size.width / 15,
                top: MediaQuery.of(context).size.height / 8),
            child: Container(
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        // blurStyle:BlurStyle.outer,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 5)),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListView.custom(
                    childrenDelegate: SliverChildListDelegate([
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 10),
                        child: ListTile(
                          leading: SvgPicture.asset(
                              'assets/Notification Alert.svg'),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:  [
                              Text(
                                'Lorem ipsum is simply dummy text',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat-Medium',
                                 color: Colors.grey.shade600
                                ),
                              ),
                              Text(
                                '21/01/2022',
                                style: TextStyle(
                                  fontSize: 14,
                                    fontFamily: 'Montserrat-Medium',
                                    color: Colors.grey.shade600
                                ),
                              ),
                              // SizedBox(height: MediaQuery.of(context).size.height/5,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.grey.shade200,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 10),
                        child: ListTile(
                          leading: SvgPicture.asset(
                              'assets/Notification Alert.svg'),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:  [
                              Text(
                                'Lorem ipsum is simply dummy text',
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Medium',
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '21/01/2022',
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Medium',
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                ),
                              ),
                              // SizedBox(height: MediaQuery.of(context).size.height/5,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.grey.shade200,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 10),
                        child: ListTile(
                          leading: SvgPicture.asset(
                              'assets/Notification Alert.svg'),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:  [
                              Text(
                                'Lorem ipsum is simply dummy text',
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Medium',
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '21/01/2022',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              // SizedBox(height: MediaQuery.of(context).size.height/5,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.grey.shade200,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 10),
                        child: ListTile(
                          leading: SvgPicture.asset(
                              'assets/Notification Alert.svg'),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:  [
                              Text(
                                'Lorem ipsum is simply dummy text',
                                style: TextStyle(
                                  fontSize: 16,
                                    fontFamily: 'Montserrat-Medium',
                                    color: Colors.grey.shade600
                                ),
                              ),
                              Text(
                                '21/01/2022',
                                style: TextStyle(
                                  fontSize: 14,
                                    fontFamily: 'Montserrat-Medium',
                                    color: Colors.grey.shade600
                                ),
                              ),
                              // SizedBox(height: MediaQuery.of(context).size.height/5,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.grey.shade200,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 10),
                        child: ListTile(
                          leading: SvgPicture.asset(
                              'assets/Notification Alert.svg'),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:  [
                              Text(
                                'Lorem ipsum is simply dummy text',
                                style: TextStyle(
                                  fontSize: 16,
                                    fontFamily: 'Montserrat-Medium',
                                    color: Colors.grey.shade600
                                ),
                              ),
                              Text(
                                '21/01/2022',
                                style: TextStyle(
                                  fontSize: 14,
                                    fontFamily: 'Montserrat-Medium',
                                    color: Colors.grey.shade600
                                ),
                              ),
                              // SizedBox(height: MediaQuery.of(context).size.height/5,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.grey.shade200,
                      )
                    ],
                  ),

                ]),
                ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Row(
              children: [
                InkWell(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_sharp,size: 25,color:Colors.white)),
                SizedBox(width: MediaQuery.of(context).size.width/25,),
                Text('Notifications',style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Montserrat-Light'
                ),)
              ],
            ),
          )
        

        ],
      ),
    );
  }
}
