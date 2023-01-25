import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../View_mdal/TrackGrievanceByIDVM.dart';




class GrievanceRecievedResolved extends StatefulWidget {
  const GrievanceRecievedResolved({Key? key}) : super(key: key);

  @override
  State<GrievanceRecievedResolved> createState() => _GrievanceRecievedResolvedState();
}

class _GrievanceRecievedResolvedState extends State<GrievanceRecievedResolved> {

  String resolved = 'Resolved';

  String partialresolved = 'Partial resolved';
  String groupVal = 'Resolved';

  FilePickerResult? result;
  String fileName = '';
  PlatformFile? pickedfile;
  bool isLoading = false;
  // File? fileToDisplay;

  void pickFile() async {
    try{
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png','jpg','jpeg'],
        allowMultiple: false,
      );

      if(result != null){
        fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        // fileToDisplay = File(pickedfile!.path.toString());

        print('File name $fileName');
      }

      setState(() {
        isLoading = false;
      });
    } catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child:ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 0.1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.6,
                    color: const Color(0xFFb83058),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                          "Grievance Recieved",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.22,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 1.22,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.white,
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 30),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                0.7,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade400),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: RichText(
                                                        text: const TextSpan(
                                                            text: '1  ',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Montserrat'),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                text:
                                                                    'Grievance Details',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,fontWeight: FontWeight.w500,
                                                                    fontFamily:
                                                                        'Montserrat'),
                                                              )
                                                            ]),
                                                      ),
                                                    ),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                       status!,
                                                        style: const TextStyle(
                                                            color: Colors.lightGreen,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(
                                                  color: Colors.green,
                                                  thickness: 2,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children:  [
                                                      Row(
                                                        children: const [
                                                          Text(
                                                            "Grievance ID",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors.grey),
                                                          ),
                                                          Spacer(),
                                                          ImageIcon(
                                                            AssetImage('assets/share.png'),
                                                            color: Colors.red,size: 30,),

                                                        ],
                                                      ),


                                                      const SizedBox(height: 5),
                                                      Text(
                                                        GrievanceId!,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "Department",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        department!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "Office",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                    Text(
                                                        office!,
                                                        style:   const  TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16.2),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "Submission Date & Time",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                  Text(
                                                    DateFormat('dd/MM/yyyy   hh:ss ').format(DateTime.parse(date.toString())),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16.2),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "Name",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                       userName!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16.2),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "Mobile No.",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                     Text(
                                                       mob!,
                                                        style:  const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "Email",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                     Text(
                                                        Email!,
                                                        style:  const TextStyle(
                                                             fontWeight: FontWeight.w400,
                                                            fontSize: 17),
                                                      ),

                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "District",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        district!,
                                                        style:  const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "Taluka",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                     Text(
                                                          taluka!,
                                                        style: const  TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "Village",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        village!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "Nature of Grievance",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                    Text(
                                                        natureOfG!,
                                                        style:  const  TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "Grievance Details",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                       Text(
                                                        details!,
                                                        style:const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(height: 20),
                                                      const Text(
                                                        "File Uploaded",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),

                                                      const SizedBox(height: 5),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: const [
                                                          Icon(Icons.picture_as_pdf_outlined,color: Colors.red),
                                                          Text(
                                                            "View Login",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily: 'Montserrat',
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.transparent,
                                                              shadows: [
                                                                Shadow(offset: Offset(0, -8), color: Colors.blue)
                                                              ],
                                                              decoration: TextDecoration.underline,
                                                              decorationColor: Colors.blue,
                                                            ),
                                                          ),
                                                        ],),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          const SizedBox(height: 30),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                1.2,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade400),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // height: MediaQuery.of(context).size.height/12.2,
                                                  height: 55,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  color: const Color(0xFFb83058),
                                                  child: const Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left: 15.0),
                                                      child: Text(
                                                        "Record Action",
                                                        style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 19),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(height: 5),
                                                      const Text(
                                                        "Update Status",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          Transform.scale(
                                                            scale: 1.3,
                                                            child: Radio(
                                                                activeColor: const Color(0xFFb83058),
                                                                value: resolved,
                                                                groupValue: groupVal,
                                                                onChanged: (value){
                                                                  setState(() {
                                                                    groupVal = value.toString();
                                                                  });
                                                                }
                                                            ),
                                                          ),
                                                          Text("Resolved")
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Transform.scale(
                                                            scale: 1.3,
                                                            child: Radio(
                                                                activeColor: const Color(0xFFb83058),
                                                                value: partialresolved,
                                                                groupValue: groupVal,
                                                                onChanged: (value){
                                                                  setState(() {
                                                                    groupVal = value.toString();
                                                                  });
                                                                }
                                                            ),
                                                          ),
                                                          Text("Partial Resolved")
                                                        ],
                                                      ),
                                                     ( groupVal==resolved)?
                                                      Card(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(height: 20),
                                                            const Text(
                                                              "Remark",
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.w100,
                                                                fontSize: 17,
                                                              ),
                                                            ),
                                                            const SizedBox(height: 7),
                                                            TextFormField(
                                                              inputFormatters: [
                                                                LengthLimitingTextInputFormatter(200),
                                                              ],
                                                              maxLines: 6,
                                                              cursorColor: Colors.grey,
                                                              decoration: InputDecoration(
                                                                  hintText: 'Type here....',
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(8)),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color:
                                                                          Colors.grey.shade400))),
                                                            ),
                                                            const SizedBox(height: 20),
                                                            //Upload Image
                                                            Text(
                                                              "Upload Image/ Document",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors.grey.shade700),
                                                            ),
                                                            const SizedBox(height: 7),
                                                            Container(
                                                              height: 55,
                                                              width: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .width,
                                                              decoration: BoxDecoration(
                                                                  border:
                                                                  Border.all(color: Colors.grey),
                                                                  borderRadius:
                                                                  BorderRadius.circular(8)),
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(top: 8,right: 8,bottom: 8),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    const SizedBox(width: 5),
                                                                    Expanded(
                                                                      child: Text(
                                                                        fileName.isEmpty? "No File Choosen" :"$fileName",
                                                                        style: const TextStyle(fontSize: 12),
                                                                      ),
                                                                    ),
                                                                    MaterialButton(
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(8),
                                                                        ),
                                                                        color: Colors.grey.shade200,
                                                                        onPressed: () {
                                                                          pickFile();
                                                                        },
                                                                        child: const Text("Choose File"))
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            const Padding(
                                                              padding: EdgeInsets.all(5.0),
                                                              child: Text(
                                                                "Files must be less than 2 MB. \nAllowed file types: png jpg jpeg.",
                                                                style: TextStyle(color: Colors.grey,fontSize: 11),
                                                              ),
                                                            ),
                                                            const SizedBox(height: 20),
                                                            Center(
                                                              child: MaterialButton(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(8)),
                                                                minWidth: 280,
                                                                height: 50,
                                                                color: const Color(0xFFb83058),
                                                                onPressed: () {
                                                                  showDialog(
                                                                    context: context,
                                                                    builder: (ctx) => AlertDialog(shape: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(20)
                                                                    ),
                                                                      title: SvgPicture.asset('assets/images/submit.svg',height: 60,width: 60),
                                                                      content: const Text("Grievance has been Resolved."),
                                                                      actions: <Widget>[
                                                                        MaterialButton(
                                                                          shape: RoundedRectangleBorder(
                                                                              borderRadius:
                                                                              BorderRadius.circular(8)),
                                                                          minWidth: 280,
                                                                          height: 50,
                                                                          color: const Color(0xFFb83058),
                                                                          onPressed: () {
                                                                            Get.toNamed("/GrievanceReceivedScreen");
                                                                          },
                                                                          child: const Text(
                                                                            "Okay",
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                                child: const Text(
                                                                  "Submit",
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 18),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(height: 20),
                                                          ],
                                                        ),
                                                      )
                                                         :Card(
                                                       child: Column(
                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                         children: [
                                                           SizedBox(height: 20),
                                                           const Text(
                                                             "Remark",
                                                             style: TextStyle(
                                                               fontWeight: FontWeight.w100,
                                                               fontSize: 17,
                                                             ),
                                                           ),
                                                           const SizedBox(height: 7),
                                                           TextFormField(
                                                             inputFormatters: [
                                                               LengthLimitingTextInputFormatter(200),
                                                             ],
                                                             maxLines: 6,
                                                             cursorColor: Colors.grey,
                                                             decoration: InputDecoration(
                                                                 hintText: 'Type here....',
                                                                 border: OutlineInputBorder(
                                                                     borderRadius:
                                                                     BorderRadius.circular(8)),
                                                                 focusedBorder: OutlineInputBorder(
                                                                     borderSide: BorderSide(
                                                                         color:
                                                                         Colors.grey.shade400))),
                                                           ),
                                                           const SizedBox(height: 20),
                                                           //Upload Image
                                                           Text(
                                                             "Upload Image/ Document",
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 color: Colors.grey.shade700),
                                                           ),
                                                           const SizedBox(height: 7),
                                                           Container(
                                                             height: 55,
                                                             width: MediaQuery
                                                                 .of(context)
                                                                 .size
                                                                 .width,
                                                             decoration: BoxDecoration(
                                                                 border:
                                                                 Border.all(color: Colors.grey),
                                                                 borderRadius:
                                                                 BorderRadius.circular(8)),
                                                             child: Padding(
                                                               padding: const EdgeInsets.only(top: 8,right: 8,bottom: 8),
                                                               child: Row(
                                                                 mainAxisAlignment:
                                                                 MainAxisAlignment.spaceEvenly,
                                                                 children: [
                                                                   const SizedBox(width: 5),
                                                                   Expanded(
                                                                     child: Text(
                                                                       fileName.isEmpty? "No File Choosen" :"$fileName",
                                                                       style: const TextStyle(fontSize: 12),
                                                                     ),
                                                                   ),
                                                                   MaterialButton(
                                                                       shape: RoundedRectangleBorder(
                                                                         borderRadius:
                                                                         BorderRadius.circular(8),
                                                                       ),
                                                                       color: Colors.grey.shade200,
                                                                       onPressed: () {
                                                                         pickFile();
                                                                       },
                                                                       child: const Text("Choose File"))
                                                                 ],
                                                               ),
                                                             ),
                                                           ),
                                                           const Padding(
                                                             padding: EdgeInsets.all(5.0),
                                                             child: Text(
                                                               "Files must be less than 2 MB. \nAllowed file types: png jpg jpeg.",
                                                               style: TextStyle(color: Colors.grey,fontSize: 11),
                                                             ),
                                                           ),
                                                           const SizedBox(height: 20),
                                                           Center(
                                                             child: MaterialButton(
                                                               shape: RoundedRectangleBorder(
                                                                   borderRadius:
                                                                   BorderRadius.circular(8)),
                                                               minWidth: 280,
                                                               height: 50,
                                                               color: const Color(0xFFb83058),
                                                               onPressed: () {
                                                                 showDialog(
                                                                   context: context,
                                                                   builder: (ctx) => AlertDialog(shape: OutlineInputBorder(
                                                                       borderRadius: BorderRadius.circular(20)
                                                                   ),
                                                                     title: SvgPicture.asset('assets/images/submit.svg',height: 60,width: 60),
                                                                     content: const Text("Grievance has been Resolved."),
                                                                     actions: <Widget>[
                                                                       MaterialButton(
                                                                         shape: RoundedRectangleBorder(
                                                                             borderRadius:
                                                                             BorderRadius.circular(8)),
                                                                         minWidth: 280,
                                                                         height: 50,
                                                                         color: const Color(0xFFb83058),
                                                                         onPressed: () {
                                                                           Get.toNamed("/GrievanceReceivedScreen");
                                                                         },
                                                                         child: const Text(
                                                                           "Okay",
                                                                           style: TextStyle(
                                                                               color: Colors.white,
                                                                               fontSize: 18),
                                                                         ),
                                                                       ),
                                                                     ],
                                                                   ),
                                                                 );
                                                               },
                                                               child: const Text(
                                                                 "Transfer",
                                                                 style: TextStyle(
                                                                     color: Colors.white,
                                                                     fontSize: 18),
                                                               ),
                                                             ),
                                                           ),
                                                           const SizedBox(height: 20),
                                                         ],
                                                       ),
                                                     ),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 30),
                                        ],
                                      ),
                                    ),
                                  ),

                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
