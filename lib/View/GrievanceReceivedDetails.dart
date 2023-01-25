import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:samadhan/Utility/DottedLine.dart';
import '../View_mdal/TrackGrievanceByIDVM.dart';





class GrReceivedDetails extends StatefulWidget {
  const GrReceivedDetails({Key? key}) : super(key: key);

  @override
  State<GrReceivedDetails> createState() => _GrReceivedDetailsState();
}
bool grAccepted=true;
bool grTransfered=false;
final trackGrievanceByIdVM = Get.put(TrackGrievanceByIDVM());
class _GrReceivedDetailsState extends State<GrReceivedDetails> {
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
                        height: 10,
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
                          const Text('Grievance Received',
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Montserrat-Regular'))
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 17,
                        right: 17,
                        top: MediaQuery.of(context).size.height / 11,
                        bottom: 35),
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
                        padding: const EdgeInsets.only(left: 20.0, right: 20,top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height/1.30,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black12)
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    const   SizedBox(height: 20,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0,right: 10),
                                      child: Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [

                                          const Text("1  Grievance Details",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize:19,
                                                fontWeight:
                                                FontWeight.w400,
                                                color:Colors.black,
                                                fontFamily:
                                                'Montserrat-SemiBold',
                                                fontStyle: FontStyle
                                                    .normal),),
                                          Text(
                                            status!,
                                            style: TextStyle(
                                                height: 1,
                                                fontSize:17,
                                                fontWeight:
                                                FontWeight.w500,
                                                color:Colors.cyan.shade400,
                                                fontFamily:
                                                'Montserrat-SemiBold',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),

                                        ],
                                      ),
                                    ),
                                    const SizedBox(height:10,),
                                    Divider(
                                      height: 2,
                                      thickness: 2,
                                      color:Colors.cyan.shade400 ,
                                    ),
                                    Container(
                                      height: 35,
                                      color: Colors.grey.shade200,
                                      child: Row(
                                        children:  [
                                          const Text("   Submission Date & Time: ",
                                              style: TextStyle(
                                                  fontSize:15,
                                                  color: Colors
                                                      .black38,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(date.toString())),

                                              style: const TextStyle(
                                                  fontSize:15,
                                                  color: Colors
                                                      .black,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left:15.0,top: 15,right: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          ///Grievance id
                                          const Text("Grievance Id",
                                              style: TextStyle(
                                                  fontSize:15,
                                                  color: Colors
                                                      .black38,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const  SizedBox(height:7,),
                                         Text(
                                            GrievanceId!,
                                            style:  const TextStyle(
                                                height: 1,
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontFamily:
                                                'Montserrat-Regular',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const  SizedBox(height:15,),


                                          ///Grievance Department

                                          const Text("Department",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors
                                                      .black38,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:7,),
                                           Text(
                                            department!,
                                            style: const TextStyle(
                                                height: 1,
                                                fontSize: 17,

                                                color: Colors.black,
                                                fontFamily:
                                                'Montserrat-Regular',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const  SizedBox(height:20,),


                                          ///Office

                                          const Text("Office",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors
                                                      .black38,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const  SizedBox(height:7,),
                                          Text(
                                            office!,
                                            style: const TextStyle(
                                                height: 1,
                                                fontSize: 16,


                                                color: Colors.black,
                                                fontFamily:
                                                'Montserrat-Regular',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const SizedBox(height:15,),


                                        CustomPaint(painter: DrawDottedhorizontalline()),
                                          const SizedBox(height: 15,),
                                          const Text("Nature of Grievance",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors
                                                      .black38,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:7,),
                                           Text(
                                           natureOfG!,
                                            style:const TextStyle(
                                                height: 1,
                                                fontSize: 16,

                                                color: Colors.black,
                                                fontFamily:
                                                'Montserrat-Regular',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const SizedBox(height:20,),

                                          ///Grievance Details
                                          const Text("Grievance Details",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors
                                                      .black38,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:10,),
                                          Text(
                                            details!,
                                            style: const TextStyle(
                                                height: 1,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,

                                                color: Colors.black,
                                                fontFamily:
                                                'Montserrat-Regular',
                                                ),
                                          ),

                                          const SizedBox(height:20,),

                                          ///File Uploaded
                                          const Text("File Uploaded",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors
                                                      .black38,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:10,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10,right: 10),
                                            child: Row(

                                              children: const [
                                                Icon(Icons.picture_as_pdf_outlined,size: 25,color:  Color(0xFFb83058),),
                                                Spacer(),
                                                Text(
                                                  "View File",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                    'Montserrat-Regular',
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
                                          const SizedBox(height:15,),
                                          CustomPaint(painter: DrawDottedhorizontalline()),

                                          const SizedBox(height:15,),


                                          ///Name
                                          const Text("Name",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors
                                                      .black38,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:7,),
                                         Text(
                                            userName!,
                                            style:  const TextStyle(
                                                height: 1,
                                                fontSize: 17,


                                                color: Colors.black,
                                                fontFamily:
                                                'Montserrat-Regular',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const   SizedBox(height:15,),

                                          ///Mobile Number
                                          const Text("Mobile No.",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors
                                                      .black38,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const  SizedBox(height:7,),
                                          Text(
                                          mob!,
                                            style:  const TextStyle(
                                                height: 1,
                                                fontSize: 17,

                                                color: Colors.black,
                                                fontFamily:
                                                'Montserrat-Regular',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),const SizedBox(height:15,),

                                          ///Email
                                          const Text("Email",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors
                                                      .black38,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const  SizedBox(height:7,),
                                         Text(
                                            Email!,
                                            style:  const  TextStyle(
                                                height: 1,
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontFamily:
                                                'Montserrat-Regular',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),const SizedBox(height:15,),

                                          ///District
                                          const Text("Address",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors
                                                      .black38,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(height:7,),
                                           Text(
                                            "$district > $taluka > $village",
                                            style:const TextStyle(
                                                height: 1,
                                                fontSize: 17,

                                                color: Colors.black,
                                                fontFamily:
                                                'Montserrat-Regular',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),const SizedBox(height:15,),





                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: MediaQuery.of(context).size.width,
                                          color: const Color(0xFFb83058),
                                          child: const Center(
                                            child: Text(
                                              'Accept Grievance',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color:Colors.white,
                                                  //fontWeight: FontWeight.w300,
                                                  fontFamily: 'Montserrat-Regular'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 20.0, right: 20,top: 10),
                                          child: Text(
                                            "Is the Grievance received with the right Department/HOD/ Subject as per citizens complaints ?",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 16,

                                                color: Colors.black38,
                                                fontFamily:
                                                'Montserrat-Regular',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0, right: 20,top: 10),
                                          child: MaterialButton(
                                            height: 40,
                                            minWidth: MediaQuery.of(context).size.width,
                                            onPressed: () {
                                             setState(() {
                                               grAccepted=true;
                                               grTransfered=false;
                                             });
                                            },
                                            color:(grAccepted == true) ?  const Color(0xFFb83058): Colors.white,
                                            shape: (grAccepted == true) ? OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.circular(7)):
                                            OutlineInputBorder( borderSide: const BorderSide(color:  Color(0xFFb83058)),
                                             borderRadius: BorderRadius.circular(7)),
                                            child:  Text(
                                              'Yes',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color:(grAccepted == true) ?  Colors.white: const Color(0xFFb83058),
                                                  //fontWeight: FontWeight.w300,
                                                  fontFamily: 'Montserrat-Regular'),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0, right: 20,top: 10),
                                          child: MaterialButton(
                                            height: 40,
                                            minWidth: MediaQuery.of(context).size.width,
                                            onPressed: () {
                                           setState(() {
                                             grAccepted=false;
                                             grTransfered=true;
                                           });
                                            //  Get.toNamed("/GrievanceReceivedNo");

                                            },
                                            color:(grTransfered == true)?const Color(0xFFb83058) :Colors.white,

                                            shape: OutlineInputBorder(
                                                borderSide: const BorderSide(color:  Color(0xFFb83058)),
                                                borderRadius: BorderRadius.circular(7)),
                                            child: Text(
                                              'Transfer Grievance',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color:(grTransfered == true)?Colors.white: const Color(0xFFb83058),
                                                  //fontWeight: FontWeight.w300,
                                                  fontFamily: 'Montserrat-Regular'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15,),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 20.0, right: 20,top: 10),
                                          child: Text(
                                            "Pleas click on Accept to proceed with the action and redress the grievance.",
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 16,

                                                color: Colors.black38,
                                                fontFamily:
                                                'Montserrat-Regular',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                        ),
                                        const SizedBox(height: 15,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0, right: 20,top: 10),
                                          child: MaterialButton(
                                            height: 40,
                                            minWidth: MediaQuery.of(context).size.width,
                                            onPressed: () {
                                              Get.toNamed("/GrievanceRecievedResolved");
                                              },
                                            color: Colors.green,
                                            shape: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.circular(7)),
                                            child: Text(
                                              (grAccepted == true)? 'Accept ' : 'Transfered',
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                  //fontWeight: FontWeight.w300,
                                                  fontFamily: 'Montserrat-Regular'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 35,),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ));
  }
}




















