import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TrackGrievanceViewPage extends StatefulWidget {
  const TrackGrievanceViewPage({Key? key}) : super(key: key);

  @override
  State<TrackGrievanceViewPage> createState() => _TrackGrievanceViewPageState();
}

class _TrackGrievanceViewPageState extends State<TrackGrievanceViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll){
              overScroll.disallowIndicator();
              return true;
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.8,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xFFb83058),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                          const Text('Track Grievance',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Montserrat-Regular'))
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25,
                        right: 25,
                        top: MediaQuery.of(context).size.height / 9,
                        bottom: 45),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 6,
                            )
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              const Text('Enter Grievance No.',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Montserrat-Regular')),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 45,
                                child: TextFormField(
                                  cursorHeight: 20,
                                  cursorColor: const Color(0xFFb83058),
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFb83058))),
                                      hintText: "OS/20221007-1",
                                      hintStyle: const TextStyle(
                                          height: 1,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black26,
                                          fontFamily: 'Montserrat',
                                          fontStyle: FontStyle.normal),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.black12, width: 4))),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              MaterialButton(
                                height: 45,
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () {},
                                color: const Color(0xFFb83058),
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(7)),
                                child: const Text(
                                  'Search',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Montserrat-Regular'),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height/1.9,
                                width: MediaQuery.of(context).size.width/1,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black12)
                                ),
                                child: ListView(
                                  children: [
                                    const   SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                       const Text("1",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize:25,
                                              fontWeight:
                                              FontWeight.w400,
                                              color:Colors.black,
                                              fontFamily:
                                              'Montserrat',
                                              fontStyle: FontStyle
                                                  .normal),),
                                        Text(
                                          "Accepted",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize:20,
                                              fontWeight:
                                              FontWeight.w500,
                                              color:Colors.yellow.shade700,
                                              fontFamily:
                                              'Montserrat',
                                              fontStyle: FontStyle
                                                  .normal),
                                        ),

                                      ],
                                    ),
                                    const SizedBox(height: 2,),
                                    Divider(
                                      thickness: 3,
                                        color:Colors.yellow.shade700 ,
                                    ),
                                    const SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(left:15.0,),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          ///Grievance id
                                          const Text("Grievance Id",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const  SizedBox(height:10,),
                                          const Text(
                                            "OS/20221007-1",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 19,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black54,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const  SizedBox(height:20,),


                                          ///Grievance Department

                                          const Text("Department",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:10,),
                                          const Text(
                                            "Municipal Corporation",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 19,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black54,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const  SizedBox(height:20,),


                                          ///Office

                                          const Text("Office",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const  SizedBox(height:10,),
                                          const Text(
                                            "Osmanabad Municipal Corporation",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 19,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black54,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const SizedBox(height:20,),

                                          ///Submission Date & Time

                                          const Text("Submission Date & Time",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const  SizedBox(height:10,),
                                          const Text(
                                            "12/10/2022   12:01 PM",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 19,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black54,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const SizedBox(height:20,),


                                          ///Name
                                          const Text("Name",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:10,),
                                          const Text(
                                            "Mukul Joshi",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 19,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black54,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const   SizedBox(height:20,),

                                          ///Mobile Number
                                          const Text("Mobile No.",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const  SizedBox(height:10,),
                                          const Text(
                                            "9308987639",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 19,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black54,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),const SizedBox(height:20,),

                                          ///Email
                                          const Text("Email",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const  SizedBox(height:10,),
                                          const Text(
                                            "mukuljoshi@gmail.com",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 19,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black54,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),const SizedBox(height:20,),

                                          ///District
                                          const Text("District",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:10,),
                                          const Text(
                                            "Osmanabad",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 19,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black54,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),const SizedBox(height:20,),
                                          ///Taluka
                                          const Text("Taluka",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:10,),
                                          const Text(
                                            "Tulajapur",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 19,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black54,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),const SizedBox(height:20,),
                                          ///Village
                                          const Text("Village ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:10,),
                                          const Text(
                                            "Andur",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 19,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black54,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),const SizedBox(height:20,),

                                          ///Nature of Grievance
                                          const Text("Nature of Grievance",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:10,),
                                          const Text(
                                            "Water Supply",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 19,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black54,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const SizedBox(height:20,),

                                          ///Grievance Details
                                          const Text("Grievance Details",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:10,),
                                          const Text(
                                            "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 19,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black54,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),

                                        const SizedBox(height:20,),

                                        ///File Uploaded
                                        const Text("File Uploaded",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors
                                                    .black26,
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        const SizedBox(height:10,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10,right: 10),
                                          child: Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: const [
                                              Icon(Icons.picture_as_pdf_outlined,size: 25,color:  Color(0xFFb83058),),
                                              Spacer(),
                                              Text(
                                                "View File",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'Montserrat',
                                                  fontWeight:
                                                  FontWeight
                                                      .w500,
                                                  color: Colors
                                                      .transparent,
                                                  shadows: [
                                                    Shadow(
                                                        offset:
                                                        Offset(
                                                            0,
                                                            -5),
                                                        color: Colors
                                                            .blue)
                                                  ],
                                                  // Step 3 SEE HERE
                                                  decoration:
                                                  TextDecoration
                                                      .underline,
                                                  decorationColor:
                                                  Colors.blue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                          const SizedBox(height:30,),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              ],)
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 0.5,
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Powered By : ",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat'),
                        ),
                        Image(
                          image: AssetImage("assets/img.png"),
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
