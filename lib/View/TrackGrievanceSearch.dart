import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../View_mdal/TrackGrievanceByIDVM.dart';
import '../View_mdal/TrackGrievanceSearchVM.dart';
import '../View_mdal/track_grievance_list_vm.dart';



class TrackGrievanceSearchRepo extends StatefulWidget {
  const TrackGrievanceSearchRepo({Key? key}) : super(key: key);

  @override
  State<TrackGrievanceSearchRepo> createState() => _TrackGrievanceSearchRepoState();
}

final trackGrievanceByID =Get.put(TrackGrievanceByIDVM());
final trackGrievanceSearch =Get.put(TrackGrievanceSearchVM());
class _TrackGrievanceSearchRepoState extends State<TrackGrievanceSearchRepo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 9.0),
                          child: Container(
                            height:
                            MediaQuery.of(context).size.height / 5.7,
                            width:
                            MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(7),
                              border: Border.all(
                                  color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: MediaQuery.of(context)
                                        .size
                                        .width /
                                        2.2,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFb83058),
                                        borderRadius:
                                        BorderRadius.only(
                                            topLeft: Radius
                                                .circular(7),
                                            bottomLeft:
                                            Radius.circular(
                                                7))),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceAround,
                                      children:  [
                                        const Text("1",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.w300,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(date3!,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.w300,
                                                fontFamily:
                                                'Montserrat-Regular')),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                        top: 7),
                                    child: Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .width /
                                          2.3,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(
                                              7)),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                        children: [
                                          Row(
                                            children:  [
                                              const Text("Grievance Id",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors
                                                          .black26,
                                                      fontWeight:
                                                      FontWeight
                                                          .w400,
                                                      fontFamily:
                                                      'Montserrat-Regular')),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () async {
                                                  await trackGrievanceByID.getGrievanceList(GriId.toString());
                                                  Get.toNamed("/TrackGrievanceViewPage");
                                                },
                                                child: const Text(
                                                  "View",
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
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                     Text(
                                            GrievanceNo!,
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w400,
                                                color: Colors.black,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text("Department",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          ( Department == null)? Text('')
                                          :Text(
                                            Department!,
                                            style: const TextStyle(
                                                height: 1,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w400,
                                                color: Colors.black,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text("Status",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors
                                                      .black26,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily:
                                                  'Montserrat-Regular')),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                         ( Status == null)? Text('')
                                          :Text(
                                          Status!,
                                            style: TextStyle(
                                                height: 1,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w400,
                                                color:Colors.yellow.shade700,
                                                fontFamily:
                                                'Montserrat',
                                                fontStyle: FontStyle
                                                    .normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )],)
                      ),
                    ),
                  ),

              ],
            ),
          ),
        ));
  }
}
