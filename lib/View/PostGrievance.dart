import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:samadhan/View/SignUp.dart';
import 'package:samadhan/View_mdal/get_office_viewmodal.dart';
import '../Modal/PostGrievanceModal.dart';
import '../Utility/CommonString.dart';
import '../Utility/snack_bar.dart';
import '../View_mdal/PostGrievanceVM.dart';
import '../View_mdal/department_viewmodal.dart';
import '../View_mdal/district_viewmodal.dart';
import '../View_mdal/nature_viewModal.dart';
import '../View_mdal/taluka_viewmodal.dart';
import '../View_mdal/vilaage_viewmoda.dart';
import 'OTPTabbar.dart';

TextEditingController description = TextEditingController();

class PostGrievance1 extends StatefulWidget {
  const PostGrievance1({Key? key}) : super(key: key);

  @override
  State<PostGrievance1> createState() => _PostGrievance1State();
}




final postGrievanceVM = Get.put(PostGrievanceVM());

String? selectedDistrictValue;
String? selectedNatureValue;
String? selectedTalukaValueG;
String? selectedVillageValueG;
String? selectedDepartmentValue;
String? selectedOfficeValue;
List<CitizenGrievanceImage> imagesDoc = [];


class _PostGrievance1State extends State<PostGrievance1> {

  final talukaViewModal = Get.put(TalukaViewModal());
  final districtViewModal = Get.put(DistrictViewModal());
  final villageViewModalG = Get.put(VillageViewModal());
  final departmentViewModal = Get.put(DepartmentViewModal());
  final getOfficeByIdViewModal = Get.put(GetOfficeByIdViewModal());
  final natureViewModal = Get.put(NatureViewModal());

  void onTalukaChangePG(taluka) {
    setState(() {
      selectedTalukaValueG = taluka;
      villageViewModalG.villageListPG.clear();
      selectedVillageValueG = null;
      villageViewModalG.isLoading.value = true;

    });
    setState(() {
      villageViewModalG.getAllVillage(selectedTalukaValueG!);
    });
  }

  void onVillageChangePG(village) {
    setState(() {
      selectedVillageValueG = village;
    });
  }



  void onDepartmentChangePG(department) {
    setState(() {
     selectedDepartmentValue = department;
     getOfficeByIdViewModal.grievanceOfficeList.clear();

     selectedOfficeValue = null;
     getOfficeByIdViewModal.isLoading.value = true;
    });
    setState(() {
      getOfficeByIdViewModal.getOfficeByDepartment(selectedDepartmentValue!);
    });
  }

  void onOfficeChangePG(office) {
    setState(() {
      selectedOfficeValue = office;
    });
  }

  FilePickerResult? result;
  String fileName = '';
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
        allowedExtensions: ['png', 'jpg', 'jpeg', 'pdf'],
        allowMultiple: false,
      );

      if (result != null) {
        fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        // fileToDisplay = File(pickedfile!.path.toString());

        print('File name $fileName');
        imagesDoc.add(CitizenGrievanceImage(
          grievanceId: 101,
          docname: "images",
          docpath:
              "https://samadhan-api.mahamining.com/Uploads/grievance/$fileName",
          sortOrder: 0,
          createdBy: 1,
          modifiedBy: 0,
        ));
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
    // TODO: implement initState
    super.initState();
    fToast.init(context);
   setState(()  {
     districtViewModal.districtList.clear();
     districtViewModal.isLoading.value = true;
     districtViewModal.getAllDistrict();

     talukaViewModal.talukaList.clear();
     selectedTalukaValueG= null;
     talukaViewModal.isLoading.value = true;
     talukaViewModal.getAllTaluka();

   });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => (districtViewModal.isLoading.value == true &&
                talukaViewModal.isLoading.value == true &&
                departmentViewModal.isLoading.value == true &&
                natureViewModal.isLoading.value == true
               )
            ? Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20)),
                  height: 130,
                  width: 130,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        CircularProgressIndicator(
                          color: Colors.red,
                        ),
                        Text(
                          "Please wait",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ]),
                ),
              )
            : NotificationListener<OverscrollIndicatorNotification>(
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
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  districtViewModal.districtList.clear();
                                  districtViewModal.isLoading.value = true;
                                  Get.back();
                                },
                                icon: const Icon(Icons.arrow_back_ios_new),
                                color: Colors.white,
                              ),
                              Text(
                                "postGrievance".tr,
                                style:const  TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 1.28,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        1.28,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      color: Colors.white,
                                      elevation: 4,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 25),

                                              //District
                                              RichText(
                                                text: TextSpan(
                                                    text: 'pgDistrict'.tr,
                                                    style:const  TextStyle(
                                                      fontFamily:
                                                          'Montserrat-Medium',
                                                      color: Colors.black45,
                                                      fontSize: 13,
                                                    ),
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                        text: ' * ',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFb83058),
                                                            fontSize: 18),
                                                      )
                                                    ]),
                                              ),
                                              const SizedBox(height: 2),
                                              SizedBox(
                                                height: 50,
                                                child: DropdownButtonFormField<
                                                    String>(
                                                  hint:  Text(
                                                    'district'.tr,
                                                    style:const TextStyle(
                                                      fontSize: 13,
                                                      fontFamily:
                                                          'Montserrat-Medium',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontFamily:
                                                        'Montserrat-Medium',
                                                    color: Colors.black,
                                                  ),
                                                  decoration: InputDecoration(
                                                      isDense: true,
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade400))),
                                                  value: selectedDistrictValue,
                                                  items: districtViewModal
                                                      .districtList
                                                      .map((items) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: items.id
                                                                .toString(),
                                                            child: Text(
                                                                items.district
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    fontFamily:
                                                                        'Montserrat-Medium',
                                                                    fontSize:
                                                                        14)),
                                                          ))
                                                      .toList(),
                                                  onChanged: (String? dist) =>
                                                      setState(() {
                                                    selectedDistrictValue =
                                                        dist!;
                                                    print(
                                                        selectedDistrictValue);
                                                  }),
                                                  menuMaxHeight: 300,
                                                ),
                                              ),
                                              const SizedBox(height: 15),

                                              //Taluka
                                              RichText(
                                                text: TextSpan(
                                                    text: 'pgTaluka'.tr,
                                                    style:  const TextStyle(
                                                      fontFamily:
                                                          'Montserrat-Medium',
                                                      color: Colors.black45,
                                                      fontSize: 13,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: ' * ',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFb83058),
                                                            fontSize: 18),
                                                      )
                                                    ]),
                                              ),
                                              const SizedBox(height: 2),
                                              SizedBox(
                                                height: 50,
                                                child: DropdownButtonFormField<
                                                        String>(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    //validator: validationViewModal.districtValidator!,
                                                    hint: Text(
                                                      'taluka'.tr,
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        fontFamily:
                                                            'Montserrat-Medium',
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                    decoration: InputDecoration(
                                                        isDense: true,
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    5)),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400))),
                                                    value: selectedTalukaValueG,
                                                    items: talukaViewModal
                                                        .talukaListPG
                                                        .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id
                                                                  .toString(),
                                                              child: Text(
                                                                  items.taluka!
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          'Montserrat-Medium')),
                                                            ))
                                                        .toList(),
                                                    onChanged: onTalukaChangePG,
                                                    menuMaxHeight: 500),
                                              ),
                                              const SizedBox(height: 15),
                                              RichText(
                                                text:  TextSpan(
                                                    text: 'pgvillage'.tr,
                                                    style:const TextStyle(
                                                      fontFamily:
                                                          'Montserrat-Medium',
                                                      color: Colors.black45,
                                                      fontSize: 13,
                                                    ),
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                        text: ' * ',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFb83058),
                                                            fontSize: 18),
                                                      )
                                                    ]),
                                              ),
                                              const SizedBox(height: 2),
                                              Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade700),
                                                ),
                                                child: SizedBox(
                                                  height: 50,
                                                  child: Obx(
                                                    () => (villageViewModalG
                                                                .isLoading
                                                                .value ==
                                                            true)
                                                        ? Row(children:  [
                                                            Text(
                                                                "selectVillage".tr)
                                                          ])
                                                        : DropdownButtonFormField<
                                                            String>(
                                                            hint: Text(
                                                              'village'.tr,
                                                              style: const TextStyle(
                                                                  fontSize: 13,
                                                                  fontFamily:
                                                                      'Montserrat-Medium',
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300),
                                                            ),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Montserrat-Medium',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            decoration:
                                                                const InputDecoration(
                                                              isDense: true,
                                                              border: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none),
                                                            ),
                                                            value:
                                                                selectedVillageValueG,
                                                            items: villageViewModalG
                                                                .villageListPG
                                                                .map((items) =>
                                                                    DropdownMenuItem<
                                                                        String>(
                                                                      value: items
                                                                          .id
                                                                          .toString(),
                                                                      child: Text(
                                                                          items
                                                                              .village!
                                                                              .toString(),
                                                                          style: const TextStyle(
                                                                              fontSize: 14,
                                                                              fontFamily: 'Montserrat-Medium')),
                                                                    ))
                                                                .toList(),
                                                            onChanged:
                                                                onVillageChangePG,
                                                            menuMaxHeight: 300,
                                                          ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 15),

                                              //Department
                                              RichText(
                                                text:  TextSpan(
                                                    text: 'pgDept'.tr,
                                                    style:const TextStyle(
                                                      fontFamily:
                                                          'Montserrat-Medium',
                                                      color: Colors.black45,
                                                      fontSize: 13,
                                                    ),
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                        text: ' * ',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFb83058),
                                                            fontSize: 14),
                                                      )
                                                    ]),
                                              ),
                                              const SizedBox(height: 2),
                                              SizedBox(
                                                height: 50,
                                                child: DropdownButtonFormField<
                                                    String>(
                                                  hint:  Text(
                                                    'deptToster'.tr,
                                                    style:const TextStyle(
                                                        fontSize: 13,
                                                        fontFamily:
                                                            'Montserrat-Medium',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'Montserrat-Medium',
                                                    color: Colors.black,
                                                  ),
                                                  decoration: InputDecoration(
                                                      isDense: true,
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade400))),
                                                  value:
                                                      selectedDepartmentValue,
                                                  items: departmentViewModal
                                                      .departmentList
                                                      .map((items) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: items.id
                                                                .toString(),
                                                            child: Text(
                                                                items
                                                                    .departmentName!
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        'Montserrat-Medium')),
                                                          ))
                                                      .toList(),
                                                  onChanged:onDepartmentChangePG,

                                                  menuMaxHeight: 500,
                                                ),
                                              ),
                                              const SizedBox(height: 15),

                                              //Office
                                              RichText(
                                                text:  TextSpan(
                                                    text: 'pgOffice'.tr,
                                                    style:const TextStyle(
                                                      fontFamily:
                                                          'Montserrat-Medium',
                                                      color: Colors.black45,
                                                      fontSize: 13,
                                                    ),
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                        text: ' * ',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFb83058),
                                                            fontSize: 18),
                                                      )
                                                    ]),
                                              ),
                                              const SizedBox(height: 2),
                                              Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color:
                                                      Colors.grey.shade700),
                                                ),
                                                child: SizedBox(
                                                  height: 50,
                                                  child: Obx(
                                                        () => (getOfficeByIdViewModal.isLoading.value ==
                                                        true)
                                                        ? Row(children:  [
                                                      Text(
                                                          "selectOffice".tr)
                                                    ])
                                                        : DropdownButtonFormField<
                                                        String>(
                                                      hint:  Text(
                                                        "officeToster".tr,
                                                        style:const TextStyle(
                                                            fontSize: 13,
                                                            fontFamily:
                                                            'Montserrat-Medium',
                                                            color: Colors
                                                                .black,
                                                            fontWeight:
                                                            FontWeight
                                                                .w300),
                                                      ),
                                                      style:
                                                      const TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                        'Montserrat-Medium',
                                                        color:
                                                        Colors.black,
                                                      ),
                                                      decoration:
                                                      const InputDecoration(
                                                        isDense: true,
                                                        border: OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide
                                                                .none),
                                                      ),
                                                      value: selectedOfficeValue,
                                                      items: getOfficeByIdViewModal
                                                          .grievanceOfficeList
                                                          .map((items) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: items
                                                                .id
                                                                .toString(),
                                                            child: Text(
                                                                items.name!
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    fontSize: 14,
                                                                    fontFamily: 'Montserrat-Medium')),
                                                          ))
                                                          .toList(),
                                                      onChanged:onOfficeChangePG,
                                                      menuMaxHeight: 300,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 15),

                                              //Grievance
                                              RichText(
                                                text: TextSpan(
                                                    text: 'pgNature'.tr,
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'Montserrat-Medium',
                                                      color: Colors.black45,
                                                      fontSize: 13,
                                                    ),
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                        text: ' * ',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFb83058),
                                                            fontSize: 18),
                                                      )
                                                    ]),
                                              ),
                                              const SizedBox(height: 2),
                                              DropdownButtonFormField<String>(
                                                hint: Text(
                                                  'natureToster'.tr,
                                                  style:const  TextStyle(
                                                      fontSize: 13,
                                                      fontFamily:
                                                          'Montserrat-Medium',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      'Montserrat-Medium',
                                                  color: Colors.black,
                                                ),
                                                decoration: InputDecoration(
                                                    isDense: true,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400))),
                                                value: selectedNatureValue,
                                                items: natureViewModal
                                                    .natureList
                                                    .map((items) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: items.id
                                                              .toString(),
                                                          child: Text(
                                                              items.name!
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'Montserrat-Medium')),
                                                        ))
                                                    .toList(),
                                                onChanged: (String? nat) {
                                                  setState(() {
                                                    selectedNatureValue = nat!;
                                                    print(nat);
                                                  });
                                                },
                                                menuMaxHeight: 500,
                                              ),

                                              const SizedBox(height: 15),
                                              RichText(
                                                text: TextSpan(
                                                    text: 'pgGrievanceDetails'.tr,
                                                    style:const  TextStyle(
                                                      fontFamily:
                                                          'Montserrat-Medium',
                                                      color: Colors.black45,
                                                      fontSize: 13,
                                                    ),
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                        text: ' * ',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFb83058),
                                                            fontSize: 18),
                                                      )
                                                    ]),
                                              ),
                                              const SizedBox(height: 2),

                                              //Type here
                                              TextFormField(
                                                controller: description,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      200),
                                                ],
                                                maxLines: 4,
                                                cursorColor: Colors.grey,
                                                decoration: InputDecoration(
                                                    hintText: 'type'.tr,
                                                    hintStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Montserrat-SemiBold',
                                                      color: Colors.black,

                                                      //fontFamily: 'Montserrat'
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400))),
                                              ),
                                              //Grievance
                                              const SizedBox(height: 15),

                                              //Upload Image
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "pgUploadDoc".tr,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors
                                                            .grey.shade700),
                                                  ),
                                                  const Text(
                                                    "(Optional)",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 7),
                                              Container(
                                                height: 55,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8,
                                                          right: 8,
                                                          bottom: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      const SizedBox(width: 5),
                                                      Expanded(
                                                        child: Text(
                                                          fileName.isEmpty
                                                              ? "pgNoFile".tr
                                                              : "$fileName",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                        ),
                                                      ),
                                                      MaterialButton(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          color: const Color(0xFFb83058),
                                                          onPressed: () async {
                                                            pickFile();
                                                            imagesDoc.add(
                                                                CitizenGrievanceImage(
                                                              grievanceId: 101,
                                                              docname: "images",
                                                              docpath:
                                                                  "$fileName",
                                                              sortOrder: 0,
                                                              createdBy: 1,
                                                              modifiedBy: 0,
                                                            ));
                                                          },
                                                          child:  Text(
                                                              "pgChooseFile".tr,style: TextStyle(color: Colors.white),),)
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              const SizedBox(height: 20),

                                              //Submit Button
                                              Center(
                                                child: MaterialButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  minWidth: 280,
                                                  height: 50,
                                                  color:
                                                      const Color(0xFFb83058),
                                                  onPressed: () async {


                                                    (selectedDistrictValue == null)?toastMessage('district'.tr):
                                                    (selectedTalukaValueG == null)?toastMessage('taluka'.tr):
                                                    (selectedVillageValueG == null)?toastMessage('village'.tr):
                                                    (selectedDepartmentValue  == null)?toastMessage('deptToster'.tr):
                                                    (selectedOfficeValue == null)?toastMessage('officeToster'.tr):
                                                    (selectedNatureValue == null)?toastMessage('natureToster'.tr):
                                                    (description.text.isEmpty)?toastMessage('detailsToster'.tr):
                                                    (fileName.toString().isEmpty)?toastMessage('fileToster'.tr):
                                                   {
                                                      await postGrievanceVM.postGrievanceInfo(PostGrievanceModal(
                                                          id: 0,
                                                          grievanceNo: "",
                                                          districtId: int.parse(
                                                              selectedDistrictValue!),
                                                          talukaId: int.parse(
                                                              selectedTalukaValueG!),
                                                          stateId: 0,
                                                          villageId: int.parse(
                                                              selectedVillageValueG!),
                                                          concernDeptId: int.parse(
                                                              selectedDepartmentValue!),
                                                          concernOfficeId:
                                                              int.parse(
                                                                  selectedOfficeValue!),
                                                          natureGrievanceId:
                                                              int.parse(
                                                                  selectedNatureValue!),
                                                          grievanceDescription:
                                                              description.text,
                                                          isSelfGrievance: 1,
                                                          otherCitizenName:
                                                              "String",
                                                          otherCitizenMobileNo:
                                                              "String",
                                                          otherCitizenAddress:
                                                              "String",
                                                          createdBy: int.parse("${data.read('profileId')}"),
                                                          modifiedBy: 1,
                                                          citizenGrievanceImages:
                                                              imagesDoc)),

                                                      Get.toNamed(
                                                          "/DashBoardScreen"),
                                                    };
                                                    //snackBar(postGrievance).show(context);
                                                  },
                                                  child: Text(
                                                    "pgSubmit".tr,
                                                    style:const TextStyle(
                                                      fontFamily:
                                                          'Montserrat-Medium',
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 25),
                                            ],
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
                        // Container(
                        //   height: MediaQuery
                        //       .of(context)
                        //       .size
                        //       .height,
                        //   alignment: Alignment.bottomCenter,
                        //   padding: const EdgeInsets.only(bottom: 35),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: const [
                        //       Text(
                        //         "Powered By : ",
                        //         style: TextStyle(
                        //             fontFamily: 'Montserrat',
                        //             color: Colors.black45,
                        //             fontWeight: FontWeight.w300,
                        //             fontSize: 17),
                        //       ),
                        //       SizedBox(
                        //         height: 25,
                        //         child: Image(
                        //             image: AssetImage(
                        //               'assets/img.png',
                        //             )),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
