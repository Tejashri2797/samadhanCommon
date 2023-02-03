import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:samadhan/Utility/snack_bar.dart';
import 'package:samadhan/View/SubmitFeedback.dart';
import '../Modal/SubmitFeedBackModal.dart';
import '../Utility/GrievanceListLoaction.dart';
import '../View_mdal/DissatisfctnReasonVM.dart';
import '../View_mdal/PostFeedBackVM.dart';
import '../View_mdal/PostGrievanceVM.dart';
import '../View_mdal/feedback_details_vm.dart';

class SubmitFeedback1 extends StatefulWidget {
  const SubmitFeedback1({Key? key}) : super(key: key);

  @override
  State<SubmitFeedback1> createState() => _SubmitFeedback1State();
}

TextEditingController commentController = TextEditingController();
final feedbackDetailsVM = Get.put(FeedbackDetailsVM());
final postFeedBackVM = Get.put(PostFeedBackVM());
final dissatisfactionReasonVM = Get.put(DissatisfactionReasonVM());
String? reason;
class _SubmitFeedback1State extends State<SubmitFeedback1> {
  bool isSatisfied = false;
  bool isDisSatisfied = false;
  bool isSelected = false;
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;

  // File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg'],
        allowMultiple: false,
      );

      if (result != null) {
        fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        // fileToDisplay = File(pickedfile!.path.toString());

        print('File name $fileName');
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }
@override
  void initState() {
   fToast.init(context);
    // TODO: implement initState
    super.initState();
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
          child: ListView(
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
                    padding:  EdgeInsets.only(left:8.0,top: 5),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            feedbackDetailsVM.feedbackDetailsList.clear();
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new),
                          color: Colors.white,
                        ),
                        Text(
                          "submitFeedback".tr,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height /12,),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.22,
                        width: MediaQuery.of(context).size.width / 1.05,
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
                                  padding: const EdgeInsets.only(
                                       bottom: 15),
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
                                                0.68,
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
                                                        text: TextSpan(
                                                            text: '1  ',
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'Montserrat'),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                text:
                                                                    'pgGrievanceDetails'
                                                                        .tr,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        'Montserrat-SemiBold'),
                                                              )
                                                            ]),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "resolved".tr,
                                                        style: const TextStyle(
                                                            color: Colors.green,
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
                                                    children: [
                                                      Text(
                                                        "grievanceid".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        GrNo!,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "dept".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        department!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "pgOffice".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        office!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16.2),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "submissiond&t".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        date!.toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16.2),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "name".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        userName!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16.2),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "mobile".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        mob!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "email".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        Email!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16.2),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "district".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        district!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "taluka".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        taluka!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "village".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        village!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "naturegrievance".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        natureOfG!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "pgGrievanceDetails".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      (details == null)
                                                          ? const Text("")
                                                          : Text(
                                                              details!,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 17),
                                                            ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "fileuploaded".tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Icon(Icons
                                                              .picture_as_pdf_outlined),
                                                          Text(
                                                            "viewfile".tr,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .transparent,
                                                              shadows: [
                                                                Shadow(
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            -8),
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
                                                1.8,
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
                                                  color:
                                                      const Color(0xFFb83058),
                                                  child: const Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Text(
                                                        "Response Details",
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
                                                      Text(
                                                        "municipalcor".tr,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "dearcitizen".tr,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "submitaction".tr,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "letterattach".tr,
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 17,
                                                            ),
                                                          ),
                                                          Icon(Icons
                                                              .picture_as_pdf_outlined)
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "regards".tr,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                        ),
                                                      ),
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
                                                1.37,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade400),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // height: Medconst iaQuery.of(context).size.height/12.2,
                                                  height: 55,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  color:
                                                      const Color(0xFFb83058),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child: Text(
                                                          "submitFeedback".tr,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 19),
                                                        )),
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
                                                      Text(
                                                        "submitreview".tr,
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      MaterialButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            isSatisfied = true;
                                                            isDisSatisfied =
                                                                false;
                                                          });
                                                        },
                                                        height: (isSatisfied ==
                                                                true)
                                                            ? 40
                                                            : 50,
                                                        minWidth:
                                                            double.infinity,
                                                        textColor:
                                                            (isSatisfied ==
                                                                    true)
                                                                ? Colors.white
                                                                : Colors.green,
                                                        color: (isSatisfied ==
                                                                true)
                                                            ? const Color(
                                                                0xFFb83058)
                                                            : Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                            side: (isSatisfied ==
                                                                    true)
                                                                ? BorderSide
                                                                    .none
                                                                : const BorderSide(
                                                                    color: Colors
                                                                        .green,
                                                                    width: 1,
                                                                    style: BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Text(
                                                            'satisfied'.tr,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        18)),
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      MaterialButton(
                                                        onPressed: () async {
                                                          setState(() {
                                                            isSatisfied = false;
                                                            isDisSatisfied =
                                                                true;
                                                            dissatisfactionReasonVM
                                                                .reasonList
                                                                .clear();
                                                            dissatisfactionReasonVM
                                                                .isLoading
                                                                .value = true;
                                                            reason = null;
                                                          });
                                                          await dissatisfactionReasonVM
                                                              .disatisfactnreasonList();
                                                          // Get.toNamed("/SubmitFeedback2");
                                                        },
                                                        height:
                                                            (isDisSatisfied ==
                                                                    true)
                                                                ? 40
                                                                : 50,
                                                        minWidth:
                                                            double.infinity,
                                                        textColor:
                                                            (isDisSatisfied ==
                                                                    true)
                                                                ? Colors.white
                                                                : Colors.green,
                                                        color:
                                                            (isDisSatisfied ==
                                                                    true)
                                                                ? Color(
                                                                    0xFFb83058)
                                                                : Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                            side: (isDisSatisfied ==
                                                                    true)
                                                                ? BorderSide
                                                                    .none
                                                                : const BorderSide(
                                                                    color: Colors
                                                                        .green,
                                                                    width: 1,
                                                                    style: BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Text(
                                                            'disatisfied'.tr,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        18)),
                                                      ),
                                                      (isDisSatisfied == true)
                                                          ? Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Text(
                                                                  "disatisfactionreason"
                                                                      .tr,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                                const SizedBox(
                                                                    height: 15),
                                                                SizedBox(
                                                                  height: 50,
                                                                  child: Obx(
                                                                    () => (dissatisfactionReasonVM.isLoading.value ==
                                                                            true)
                                                                        ? Row(
                                                                            children: [
                                                                                Text("selectreason".tr)
                                                                              ])
                                                                        : DropdownButtonFormField<
                                                                            String>(
                                                                            icon:
                                                                                const Icon(Icons.keyboard_arrow_down_outlined),
                                                                            decoration: InputDecoration(
                                                                                isDense: true,
                                                                                hintText: "selectreason".tr,
                                                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                                                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400))),
                                                                            value: reason,
                                                                            items: dissatisfactionReasonVM.reasonList
                                                                                .map((items) => DropdownMenuItem<String>(
                                                                                      value: items.id.toString(),
                                                                                      child: Text(items.dSatisfactnReason.toString(), style: const TextStyle(fontSize: 16)),
                                                                                    ))
                                                                                .toList(),
                                                                            onChanged: (String? res) =>
                                                                                setState(() {
                                                                              reason = res!;
                                                                            }),
                                                                          ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : Text(''),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        "comment".tr,
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      TextFormField(
                                                        controller:
                                                            commentController,
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              200),
                                                        ],
                                                        maxLines: 3,
                                                        cursorColor:
                                                            Colors.grey,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                'typehere'.tr,
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400))),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Center(
                                                        child: MaterialButton(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          minWidth: 280,
                                                          height: 50,
                                                          color: const Color(
                                                              0xFFb83058),
                                                          onPressed: ()   async {
                                                            (isSatisfied == true) ? {
                                                              (commentController.text.isEmpty) ? toastMessage('Please Comment'):{
                                                                await postFeedBackVM.feedbackSatisfied(PostFeedbackModal()),
                                                                showDialog(
                                                                  context:
                                                                  context,
                                                                  builder: (ctx) =>
                                                                      AlertDialog(
                                                                        shape:
                                                                        OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                                                        title: SvgPicture.asset('assets/submit.svg',
                                                                            height: 60,
                                                                            width: 60),
                                                                        content:
                                                                        Text("thanks".tr),
                                                                        actions: <Widget>[
                                                                          MaterialButton(
                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                                            minWidth: 280,
                                                                            height: 50,
                                                                            color: const Color(0xFFb83058),
                                                                            onPressed: () {


                                                                              Get.offAllNamed('/DashBoardScreen',)?.then((_) {setState(() {

                                                                              });}); // Add Your Code here.
                                                                            },
                                                                            child: Text(
                                                                              "ok".tr,
                                                                              style: const TextStyle(color: Colors.white, fontSize: 18),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                ),

                                                              }
                                                            }: (isDisSatisfied == true) ? {
                                                            (reason == null)
                                                            ? toastMessage(
                                                            'Select Disatisfaction Reason')
                                                                : (commentController
                                                                .text
                                                                .isEmpty)
                                                            ? toastMessage(
                                                            'Please Comment')
                                                                :{
                                                               await  postFeedBackVM.feedbackDisSatisfied(PostFeedbackModal()),
                                                            showDialog(
                                                            context: context, builder: (ctx) =>
                                                            AlertDialog(
                                                            shape:
                                                            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                                            title: SvgPicture.asset('assets/submit.svg',
                                                            height: 60,
                                                            width: 60),
                                                            content:
                                                            Text("thanks".tr),
                                                            actions: [
                                                            MaterialButton(
                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                            minWidth: 280,
                                                            height: 50,
                                                            color: const Color(0xFFb83058),
                                                            onPressed: () {
                                                            Get.offAllNamed('/DashBoardScreen');
                                                            },
                                                            child: Text(
                                                            "ok".tr,
                                                            style: const TextStyle(color: Colors.white, fontSize: 18),
                                                            ),
                                                            ),
                                                            ],
                                                            )),
                                                            }
                                                            }:toastMessage(
                                                                'select type of feedback');
                                                            },
                                                          child: Text(
                                                            "pgSubmit".tr,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
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
          ),
        ),
      ),
    );
  }
}
