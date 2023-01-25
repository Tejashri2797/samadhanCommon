import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:samadhan/Modal/officerPostGrievanceModal.dart';
import 'package:samadhan/View_mdal/officerPostGrievanceVM.dart';
import '../Utility/snack_bar.dart';
import '../View_mdal/getDepartmentVmgriev.dart';
import '../View_mdal/getNatureVmgriev.dart';
import '../View_mdal/getOfficeVmgriev.dart';
import '../View_mdal/getTalukaVmgriev.dart';
import '../View_mdal/getVillageVmgriev.dart';
import '../View_mdal/getdistrictVmgriev.dart';


String? selectedDistrictValue;
String? selectedDistrictValue1;

String? selectedTalukaValue;
String? selectedTalukaValue1;

String? selectedVillageValue;
String? selectedVillageValue1;

String? selectedDepartmentValue;
String? selectedDepartmentValue1;

String? selectedOfficeValue;
String? selectedOfficeValue1;

String? selectedNatureValue;
String? selectedNatureValue1;

final districtViewModal = Get.put(DistrictViewModal());
final talukaViewModal = Get.put(TalukaViewModalOfficer());
final villageViewModal = Get.put(VillageViewModal());
final departmentViewModal = Get.put(OfficerDepartment());
final officeViewModal = Get.put(OfficeViewModal());
final natureViewModal = Get.put(OfficerNatureViewModal());
final postGrievanceVM1 =Get.put(PostGrievanceVM1());
TextEditingController grievanceDetails = TextEditingController();

TextEditingController description = TextEditingController();
TextEditingController description1 = TextEditingController();
TextEditingController postname = TextEditingController();
TextEditingController postmobile = TextEditingController();
TextEditingController postaddress = TextEditingController();

List<OfficerPostGrievanceModal> citizenGrievanceImagess = [];
List<OfficerCitizenGrievanceImage> postImageList = [];
List<OfficerCitizenGrievanceImage> postImageList1 = [];
class PostGrievanceScreen extends StatefulWidget {
  const PostGrievanceScreen({Key? key}) : super(key: key);

  @override
  State<PostGrievanceScreen> createState() => _PostGrievanceScreenState();
}

class _PostGrievanceScreenState extends State<PostGrievanceScreen> {
  File? image;
  String fileName = '';
  Uint8List? imgBytes;

  Future uploadFileOrDocs()async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(
        'http://samadhan-api.mahamining.com/samadhan/documents/UplodFile')
    );

    request.fields['FolderName'] = 'Rohan';
    request.fields['DocumentType'] = 'jpg';
    request.files.add(await http.MultipartFile.fromPath(
        'UploadDocPath',
        image!.path
    ),
    );
    var response = await request.send();
    if(response.statusCode== 200){

      setState(() {

      });
    }

    print(response.stream);
    print(response.statusCode);
    final res = await http.Response.fromStream(response);
    print(res.body);
    final bytes = File(image!.path).readAsBytesSync();

    // String base64Image =  "data:image/jpg;base64,"+base64Encode(bytes);
    // base64.normalize(base64Image);
    // print("img_pan : $base64Image");

  }


  Future getImage() async {
    File imagefile = File(image.toString());

    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      fileName = result.files.first.name;
      image = File(result.files.single.path ?? "");
      var t = await image?.readAsBytes();
      imgBytes = Uint8List.fromList(t!);
      String base64string = base64.encode(t);
      base64.decode(base64string);
      print(base64string);
      setState(() {
        setState(() {});
      });
      postImageList.add(OfficerCitizenGrievanceImage(
          grievanceId: 113,
          docname: fileName,
          docpath: image.toString(),
          modifiedBy: 1,
          createdBy: 1,
          sortOrder: 1
      ));
    }
  }
  Future getImage1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      fileName = result.files.first.name;
      image = File(result.files.single.path ?? "");
      var t = await image?.readAsBytes();
      imgBytes = Uint8List.fromList(t!);
      setState(() {
        setState(() {});
      });
      postImageList1.add(OfficerCitizenGrievanceImage(
          grievanceId: 113,
          docname: fileName,
          docpath: image.toString(),
          modifiedBy: 1,
          createdBy: 1,
          sortOrder: 1
      ));
    }
  }

  String self = 'Self';
  String other = 'Others';
  String groupVal = 'Self';

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast.init(context);

    selectedDistrictValue = null;
    districtViewModal.districtList.clear();
    districtViewModal.isLoading.value = true;
    // districtViewModal.getAllDistrict();

    selectedTalukaValue = null;
    talukaViewModal.talukaList.clear();
    talukaViewModal.isLoading.value = true;
    // talukaViewModal.getAllTaluka();

    selectedVillageValue = null;
    villageViewModal.villageList.clear();
    villageViewModal.isLoading.value = true;

    selectedDepartmentValue = null;
    departmentViewModal.departmentList.clear();
    departmentViewModal.isLoading.value = true;
    // departmentViewModal.getAllDepartment();

    selectedOfficeValue = null;
    officeViewModal.officeList.clear();
    officeViewModal.isLoading.value = true;

    selectedNatureValue = null;
    natureViewModal.natureList.clear();
    natureViewModal.isLoading.value = true;

}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => (
                districtViewModal.isLoading.value == true &&
                talukaViewModal.isLoading.value == true &&
                villageViewModal.isLoading.value == true &&
                departmentViewModal.isLoading.value == true &&
                officeViewModal.isLoading.value == true &&
                natureViewModal.isLoading.value == true
        )? const Center(child: CircularProgressIndicator(color: Color(0xFFb83058)))
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
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new),
                          color: Colors.white,
                        ),
                        const Text(
                          "Post Grievance",
                          style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.w200),
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
                              height: MediaQuery.of(context).size.height / 1.28,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.white,
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20,top: 15),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Transform.scale(
                                                  scale: 1.2,

                                                  child: Radio(
                                                      activeColor: const Color(0xFFb83058),
                                                      value: self,
                                                      groupValue: groupVal,
                                                      onChanged: (value){
                                                        setState(() {
                                                          groupVal = value.toString();

                                                          selectedDistrictValue = null;
                                                          districtViewModal.districtList.clear();
                                                          districtViewModal.isLoading.value = true;
                                                          districtViewModal.getAllDistrict();

                                                          selectedTalukaValue = null;
                                                          talukaViewModal.talukaList.clear();
                                                          talukaViewModal.isLoading.value = true;
                                                          talukaViewModal.getAllTaluka();

                                                          selectedVillageValue = null;
                                                          villageViewModal.villageList.clear();
                                                          villageViewModal.isLoading.value = true;

                                                          selectedDepartmentValue = null;
                                                          departmentViewModal.departmentList.clear();
                                                          departmentViewModal.isLoading.value = true;
                                                          departmentViewModal.getAllDepartment();

                                                          selectedOfficeValue = null;
                                                          officeViewModal.officeList.clear();
                                                          officeViewModal.isLoading.value = true;

                                                          selectedNatureValue = null;
                                                          // villageViewModal.villageList.clear();
                                                          // villageViewModal.isLoading.value = true;

                                                          description.clear();
                                                          postImageList.clear();

                                                        });
                                                      }
                                                  ),
                                                ),
                                                Text(
                                                  self,
                                                  style: const TextStyle(fontFamily: 'Montserrat-Regular',fontSize: 17),
                                                ),
                                              ],
                                            ),

                                            Row(
                                              children: [
                                                Transform.scale(
                                                  scale: 1.2,
                                                  child: Radio(
                                                      activeColor: const Color(0xFFb83058),
                                                      value: other,
                                                      groupValue: groupVal,
                                                      onChanged: (value){
                                                        setState(() {
                                                          groupVal = value.toString();
                                                          selectedDistrictValue1 = null;
                                                          districtViewModal.districtList.clear();
                                                          districtViewModal.isLoading.value = true;
                                                          districtViewModal.getAllDistrict();

                                                          selectedTalukaValue1 = null;
                                                          talukaViewModal.talukaList.clear();
                                                          talukaViewModal.isLoading.value = true;
                                                          talukaViewModal.getAllTaluka();

                                                          selectedVillageValue1 = null;
                                                          villageViewModal.villageList.clear();
                                                          villageViewModal.isLoading.value = true;

                                                          selectedDepartmentValue1 = null;
                                                          departmentViewModal.departmentList.clear();
                                                          departmentViewModal.isLoading.value = true;
                                                          departmentViewModal.getAllDepartment();

                                                          selectedOfficeValue1 = null;
                                                          officeViewModal.officeList.clear();
                                                          officeViewModal.isLoading.value = true;

                                                          selectedNatureValue1 = null;
                                                          natureViewModal.natureList.clear();
                                                          natureViewModal.isLoading.value = true;
                                                          natureViewModal.getNatureGrievance();

                                                          description1.clear();
                                                          postImageList1.clear();
                                                        });
                                                      }
                                                  ),
                                                ),
                                                Text(
                                                  other,
                                                  style: const TextStyle(fontFamily: 'Montserrat-Regular',fontSize: 17),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height/1.5,
                                            decoration: const BoxDecoration(
                                            ),
                                            child:
                                             groupVal == self ?
                                            SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 20),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 10),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'District',
                                                          style: TextStyle(
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
                                                      child: DropdownButtonFormField<String>(
                                                        hint: const Text(
                                                          'Select District',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: 'Montserrat-Medium',
                                                              color: Colors.black,
                                                              fontWeight: FontWeight
                                                                  .w300),
                                                        ),
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontFamily: 'Montserrat-Medium',
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w300),
                                                        decoration: const InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)
                                                            )
                                                        ),
                                                        value: selectedDistrictValue,
                                                        items: districtViewModal
                                                            .districtList
                                                            .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id.toString(),
                                                              child: Text(
                                                                  items.district
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontFamily:
                                                                      'Montserrat-Medium',
                                                                      fontSize: 14)),
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
                                                    const SizedBox(height: 5),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Taluka',
                                                          style: TextStyle(
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

                                                    SizedBox(height: 50,
                                                      child: DropdownButtonFormField<String>(
                                                        alignment: Alignment.topCenter,
                                                        //validator: validationViewModal.districtValidator!,
                                                        hint: const Text(
                                                          'Select Taluka',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: 'Montserrat-Medium',
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w300),
                                                        ),
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontFamily: 'Montserrat',
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w300),
                                                        decoration: const InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey),
                                                            ),
                                                        ),
                                                        value: selectedTalukaValue,
                                                        items: talukaViewModal.talukaList
                                                            .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id.toString(),
                                                              child: Text(
                                                                  items.taluka!.toString(),
                                                                  style: const TextStyle(
                                                                      fontSize: 14,
                                                                      fontFamily:
                                                                      'Montserrat-Medium')),
                                                            ))
                                                            .toList(),
                                                        onChanged: (String? tal) =>
                                                            setState(() {
                                                              selectedTalukaValue = tal!;
                                                              villageViewModal.villageList
                                                                  .clear();
                                                              selectedVillageValue = null;
                                                              villageViewModal.isLoading
                                                                  .value = true;
                                                              setState(() {
                                                                villageViewModal
                                                                    .getAllVillage(
                                                                    selectedTalukaValue!);
                                                              });
                                                              print(selectedTalukaValue);
                                                            }),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),

                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Village',
                                                          style: TextStyle(
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
                                                    const SizedBox(height: 5),
                                                    SizedBox(height: 50,
                                                      child: DropdownButtonFormField<String>(
                                                        hint: const Text(
                                                          'Select Village',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: 'Montserrat-Medium',
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w300),
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: 'Montserrat-Medium',
                                                          color: Colors.black,
                                                        ),
                                                        decoration: const InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)
                                                            )
                                                        ),
                                                        value: selectedVillageValue,
                                                        items: villageViewModal.villageList
                                                            .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id.toString(),
                                                              child: Text(
                                                                  items.village!.toString(),
                                                                  style: const TextStyle(
                                                                      fontSize: 14,
                                                                      fontFamily:
                                                                      'Montserrat-Medium')),
                                                            ))
                                                            .toList(),
                                                        onChanged: (String? vil) {
                                                          setState(() {
                                                            selectedVillageValue = vil!;
                                                            print(selectedVillageValue);
                                                          });
                                                        },
                                                        menuMaxHeight: 300,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),


                                                    const SizedBox(height: 7),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Department',
                                                          style: TextStyle(
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
                                                    const SizedBox(height: 5),
                                                    SizedBox(
                                                      height: 50,
                                                      child: DropdownButtonFormField<
                                                          String>(
                                                        hint: const Text(
                                                          'Select Department',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: 'Montserrat-Medium',
                                                              color: Colors.black,
                                                              fontWeight: FontWeight
                                                                  .w300),
                                                        ),
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontFamily: 'Montserrat-Medium',
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w300),
                                                        decoration: InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(5)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey.shade400))),
                                                        value: selectedDepartmentValue,
                                                        items: departmentViewModal
                                                            .departmentList
                                                            .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id.toString(),
                                                              child: Text(
                                                                  items.departmentName!
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontFamily:
                                                                      'Montserrat-Medium',
                                                                      fontSize: 14)),
                                                            ))
                                                            .toList(),
                                                        onChanged: (String? dept) {
                                                          setState(() {
                                                            selectedDepartmentValue =
                                                            dept!;
                                                            officeViewModal.officeList.clear();
                                                            selectedOfficeValue = null;
                                                            officeViewModal.isLoading.value = true;
                                                            setState(() {
                                                              officeViewModal.getOfficeDropDown(
                                                                  selectedDepartmentValue!);
                                                            });
                                                            print(
                                                                selectedDepartmentValue);
                                                          });
                                                        },
                                                        menuMaxHeight: 300,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Office',
                                                          style: TextStyle(
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
                                                    const SizedBox(height: 5),
                                                    SizedBox(height : 50,
                                                       child: DropdownButtonFormField<String>(
                                                        hint: const Text(
                                                          'Select Office',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: 'Montserrat-Medium',
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w300),
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: 'Montserrat-Medium',
                                                          color: Colors.black,
                                                        ),
                                                        decoration: const InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)
                                                            )
                                                        ),
                                                        value: selectedOfficeValue,
                                                        items: officeViewModal.officeList
                                                            .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id.toString(),
                                                              child: Text(
                                                                  items.name!.toString(),
                                                                  style: const TextStyle(
                                                                      fontSize: 14,
                                                                      fontFamily:
                                                                      'Montserrat-Medium')),
                                                            ))
                                                            .toList(),
                                                        onChanged: (String? off) {
                                                          setState(() {
                                                            selectedOfficeValue = off!;
                                                            print(selectedOfficeValue);
                                                          });
                                                        },
                                                        menuMaxHeight: 300,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Nature of Grievance',
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight
                                                                  .w300),
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
                                                    const SizedBox(height: 5),
                                                    SizedBox(
                                                      height: 50,
                                                      child: DropdownButtonFormField<
                                                          String>(
                                                        hint: const Text(
                                                          'Select Grievance',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: 'Montserrat-Medium',
                                                              color: Colors.black,
                                                              fontWeight: FontWeight
                                                                  .w300),
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: 'Montserrat-Medium',
                                                          color: Colors.black,
                                                        ),
                                                        decoration: InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(5)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey.shade400))),
                                                        value: selectedNatureValue,
                                                        items: natureViewModal.natureList
                                                            .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id.toString(),
                                                              child: Text(
                                                                  items.name!.toString(),
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
                                                    ),
                                                    const SizedBox(height: 15),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Greivance Details',
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w300),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: ' * ',
                                                              style: TextStyle(
                                                                  color: Color(0xFFb83058),
                                                                  fontSize: 18),
                                                            )
                                                          ]),
                                                    ),
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
                                                          hintText: 'Type Here',
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(8)),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey.shade400))),
                                                    ), //Grievance
                                                    const SizedBox(height: 15),

                                                    //Upload Image
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Upload Image/ Document",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.grey.shade700),
                                                        ),
                                                        const Text(
                                                          "(Optional)",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w300,
                                                              color: Colors.grey),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 7),
                                                    Container(
                                                      height: 55,
                                                      width:
                                                      MediaQuery.of(context).size.width,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey),
                                                          borderRadius:
                                                          BorderRadius.circular(8)),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(
                                                            top: 8, right: 8, bottom: 8),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            const SizedBox(width: 5),
                                                            Expanded(
                                                              child: Text(
                                                                fileName.isEmpty
                                                                    ? "No File Choosen"
                                                                    : "$fileName",
                                                                style: const TextStyle(
                                                                    fontSize: 12),
                                                              ),
                                                            ),
                                                            MaterialButton(
                                                                shape:
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      8),
                                                                ),
                                                                color: Colors.grey.shade200,
                                                                onPressed: () {
                                                                  getImage();
                                                                },
                                                                child: const Text(
                                                                    "Choose File"))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.all(5.0),
                                                      child: Text(
                                                        "Files must be less than 2 MB. \n Allowed file types: png jpg jpeg.",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 11),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),

                                                    //Submit Button
                                                    Center(
                                                      child: MaterialButton(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(8)),
                                                        minWidth: double.infinity,
                                                        height: 50,
                                                        color: const Color(0xFFb83058),
                                                        onPressed: () {WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                                            if(groupVal == self) {
                                                            (selectedDistrictValue == null)?toastMessage("Please Select District"):
                                                            (selectedTalukaValue == null)?toastMessage("Please Select Taluka"):
                                                            (selectedVillageValue == null)?toastMessage("Please Select Village"):
                                                            (selectedDepartmentValue == null)?toastMessage("Please Select Department"):
                                                            (selectedOfficeValue == null)?toastMessage("Please Select Office"):
                                                            (selectedNatureValue == null)?toastMessage("Please Select Nature"):
                                                            (description.text == "")?toastMessage("Enter Grievance Details"):
                                                            (fileName.toString().isEmpty)?toastMessage("Select Image"):{
                                                              postGrievanceVM1.postGrievanceInfo1(OfficerPostGrievanceModal(
                                                              id: 0,
                                                              districtId: int.parse(selectedDistrictValue!),
                                                              talukaId: int.parse(selectedTalukaValue!),
                                                              stateId: 0,
                                                              villageId: int.parse(selectedVillageValue!),
                                                              concernDeptId: int.parse(selectedDepartmentValue!),
                                                              concernOfficeId: int.parse(selectedOfficeValue!),
                                                              natureGrievanceId: int.parse(selectedNatureValue!),
                                                              grievanceDescription: description.text,
                                                              isSelfGrievance: 0,
                                                              otherCitizenName: "String",
                                                              otherCitizenMobileNo: "String",
                                                              otherCitizenAddress: "String",
                                                              createdBy: 1,
                                                              modifiedBy: 1,
                                                              citizenGrievanceImages: postImageList,
                                                              grievanceNo: "",
                                                            ),),
                                                          uploadFileOrDocs(),
                                                           Get.toNamed('/OfficerDashboard'),
                                                          toastMessage("Grievance Posted Successfully"),

                                                          };
                                                           }

                                                        },
                                                        );},
                                                        child: const Text(
                                                          "Submit",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 25),
                                                  ],
                                                ),
                                              ),
                                            ):
                                             SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 20),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Name',
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w300),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: ' * ',
                                                              style: TextStyle(
                                                                  color: Color(0xFFb83058),
                                                                  fontSize: 18),
                                                            )
                                                          ]),
                                                    ),
                                                    const SizedBox(height: 7),
                                                    TextFormField(
                                                      controller: postname,
                                                      style: const TextStyle(fontFamily: 'Montserrat-Regular', height: 1),
                                                      cursorColor: Colors.grey,
                                                      decoration: InputDecoration(
                                                        isDense: true,
                                                        hintText: 'Enter Name',
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide(
                                                              color: Color(0xFFb83058), width: 2.0),
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),

                                                      ),
                                                    ),
                                                    const SizedBox(height: 15),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Mobile',
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w300),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: ' * ',
                                                              style: TextStyle(
                                                                  color: Color(0xFFb83058),
                                                                  fontSize: 18),
                                                            )
                                                          ]),
                                                    ),
                                                    const SizedBox(height: 7),
                                                    TextFormField(
                                                      controller: postmobile,
                                                      keyboardType:TextInputType.number,
                                                      style:
                                                      const TextStyle(fontFamily: 'Montserrat-Regular', height: 1),
                                                      cursorColor: Colors.grey,
                                                      decoration: InputDecoration(
                                                        isDense: true,
                                                        hintText: 'Enter Mobile',
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide(
                                                              color: Color(0xFFb83058), width: 2.0),
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),

                                                      ),
                                                    ),
                                                    const SizedBox(height: 15),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Address',
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w300),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: ' * ',
                                                              style: TextStyle(
                                                                  color: Color(0xFFb83058),
                                                                  fontSize: 18),
                                                            )
                                                          ]),
                                                    ),
                                                    const SizedBox(height: 7),
                                                    TextFormField(
                                                      controller: postaddress,
                                                      style: const TextStyle(fontFamily: 'Montserrat-Regular', height: 1),
                                                      cursorColor: Colors.grey,
                                                      decoration: InputDecoration(
                                                        isDense: true,
                                                        hintText: 'Enter Address',
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide(
                                                              color: Color(0xFFb83058), width: 2.0),
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),

                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'District',
                                                          style: TextStyle(
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
                                                      child: DropdownButtonFormField<String>(
                                                        hint: const Text(
                                                          'Select District',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: 'Montserrat-Medium',
                                                              color: Colors.black,
                                                              fontWeight: FontWeight
                                                                  .w300),
                                                        ),
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontFamily: 'Montserrat-Medium',
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w300),
                                                        decoration: const InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)
                                                            )
                                                        ),
                                                        value: selectedDistrictValue1,
                                                        items: districtViewModal
                                                            .districtList
                                                            .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id.toString(),
                                                              child: Text(
                                                                  items.district
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontFamily:
                                                                      'Montserrat-Medium',
                                                                      fontSize: 14)),
                                                            ))
                                                            .toList(),
                                                        onChanged: (String? dist) =>
                                                            setState(() {
                                                              selectedDistrictValue1 =
                                                              dist!;
                                                              print(
                                                                  selectedDistrictValue1);
                                                            }),
                                                        menuMaxHeight: 300,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Taluka',
                                                          style: TextStyle(
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

                                                    SizedBox(height: 50,
                                                      child: DropdownButtonFormField<String>(
                                                        alignment: Alignment.topCenter,
                                                        //validator: validationViewModal.districtValidator!,
                                                        hint: const Text(
                                                          'Select Taluka',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: 'Montserrat-Medium',
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w300),
                                                        ),
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontFamily: 'Montserrat',
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w300),
                                                        decoration: const InputDecoration(
                                                          isDense: true,
                                                          border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.grey)),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors.grey),
                                                          ),
                                                        ),
                                                        value: selectedTalukaValue1,
                                                        items: talukaViewModal.talukaList
                                                            .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id.toString(),
                                                              child: Text(
                                                                  items.taluka!.toString(),
                                                                  style: const TextStyle(
                                                                      fontSize: 14,
                                                                      fontFamily:
                                                                      'Montserrat-Medium')),
                                                            ))
                                                            .toList(),
                                                        onChanged: (String? tal) =>
                                                            setState(() {
                                                              selectedTalukaValue1 = tal!;
                                                              villageViewModal.villageList
                                                                  .clear();
                                                              selectedVillageValue1 = null;
                                                              villageViewModal.isLoading
                                                                  .value = true;
                                                              setState(() {
                                                                villageViewModal
                                                                    .getAllVillage(
                                                                    selectedTalukaValue1!);
                                                              });
                                                              print(selectedTalukaValue1);
                                                            }),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),

                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Village',
                                                          style: TextStyle(
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
                                                    const SizedBox(height: 5),
                                                    SizedBox(height: 50,
                                                      child: DropdownButtonFormField<String>(
                                                        hint: const Text(
                                                          'Select Village',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: 'Montserrat-Medium',
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w300),
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: 'Montserrat-Medium',
                                                          color: Colors.black,
                                                        ),
                                                        decoration: const InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)
                                                            )
                                                        ),
                                                        value: selectedVillageValue1,
                                                        items: villageViewModal.villageList
                                                            .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id.toString(),
                                                              child: Text(
                                                                  items.village!.toString(),
                                                                  style: const TextStyle(
                                                                      fontSize: 14,
                                                                      fontFamily:
                                                                      'Montserrat-Medium')),
                                                            ))
                                                            .toList(),
                                                        onChanged: (String? vil) {
                                                          setState(() {
                                                            selectedVillageValue1 = vil!;
                                                            print(selectedVillageValue1);
                                                          });
                                                        },
                                                        menuMaxHeight: 300,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),


                                                    const SizedBox(height: 7),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Department',
                                                          style: TextStyle(
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
                                                    const SizedBox(height: 5),
                                                    SizedBox(
                                                      height: 50,
                                                      child: DropdownButtonFormField<
                                                          String>(
                                                        hint: const Text(
                                                          'Select Department',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: 'Montserrat-Medium',
                                                              color: Colors.black,
                                                              fontWeight: FontWeight
                                                                  .w300),
                                                        ),
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontFamily: 'Montserrat-Medium',
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w300),
                                                        decoration: InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(5)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey.shade400))),
                                                        value: selectedDepartmentValue1,
                                                        items: departmentViewModal
                                                            .departmentList
                                                            .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id.toString(),
                                                              child: Text(
                                                                  items.departmentName!
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontFamily:
                                                                      'Montserrat-Medium',
                                                                      fontSize: 14)),
                                                            ))
                                                            .toList(),
                                                        onChanged: (String? dept) {
                                                          setState(() {
                                                            selectedDepartmentValue1 =
                                                            dept!;
                                                            officeViewModal.officeList.clear();
                                                            selectedOfficeValue1 = null;
                                                            officeViewModal.isLoading.value = true;
                                                            setState(() {
                                                              officeViewModal.getOfficeDropDown(
                                                                  selectedDepartmentValue1!);
                                                            });
                                                            print(
                                                                selectedDepartmentValue1);
                                                          });
                                                        },
                                                        menuMaxHeight: 300,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Office',
                                                          style: TextStyle(
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
                                                    const SizedBox(height: 5),
                                                    SizedBox(height : 50,
                                                      child: DropdownButtonFormField<String>(
                                                        hint: const Text(
                                                          'Select Office',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: 'Montserrat-Medium',
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w300),
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: 'Montserrat-Medium',
                                                          color: Colors.black,
                                                        ),
                                                        decoration: const InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.grey)
                                                            )
                                                        ),
                                                        value: selectedOfficeValue1,
                                                        items: officeViewModal.officeList
                                                            .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id.toString(),
                                                              child: Text(
                                                                  items.name!.toString(),
                                                                  style: const TextStyle(
                                                                      fontSize: 14,
                                                                      fontFamily:
                                                                      'Montserrat-Medium')),
                                                            ))
                                                            .toList(),
                                                        onChanged: (String? off) {
                                                          setState(() {
                                                            selectedOfficeValue1 = off!;
                                                            print(selectedOfficeValue1);
                                                          });
                                                        },
                                                        menuMaxHeight: 300,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    RichText(
                                                      text: const TextSpan(
                                                          text: 'Nature of Grievance',
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight
                                                                  .w300),
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
                                                    const SizedBox(height: 5),
                                                    SizedBox(
                                                      height: 50,
                                                      child: DropdownButtonFormField<
                                                          String>(
                                                        hint: const Text(
                                                          'Select Grievance',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: 'Montserrat-Medium',
                                                              color: Colors.black,
                                                              fontWeight: FontWeight
                                                                  .w300),
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: 'Montserrat-Medium',
                                                          color: Colors.black,
                                                        ),
                                                        decoration: InputDecoration(
                                                            isDense: true,
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(5)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey.shade400))),
                                                        value: selectedNatureValue1,
                                                        items: natureViewModal.natureList
                                                            .map((items) =>
                                                            DropdownMenuItem<String>(
                                                              value: items.id.toString(),
                                                              child: Text(
                                                                  items.name!.toString(),
                                                                  style: const TextStyle(
                                                                      fontSize: 14,
                                                                      fontFamily:
                                                                      'Montserrat-Medium')),
                                                            ))
                                                            .toList(),
                                                        onChanged: (String? nat) {
                                                          setState(() {
                                                            selectedNatureValue1 = nat!;
                                                            print(nat);
                                                          });
                                                        },
                                                        menuMaxHeight: 500,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 15),
                                                    //Type here
                                                    TextFormField(
                                                      controller: description1,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(
                                                            200),
                                                      ],
                                                      maxLines: 4,
                                                      cursorColor: Colors.grey,
                                                      decoration: InputDecoration(
                                                          hintText: 'Type Here',
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(8)),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey.shade400))),
                                                    ), //Grievance
                                                    const SizedBox(height: 15),

                                                    //Upload Image
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Upload Image/ Document",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.grey.shade700),
                                                        ),
                                                        const Text(
                                                          "(Optional)",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w300,
                                                              color: Colors.grey),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 7),
                                                    Container(
                                                      height: 55,
                                                      width:
                                                      MediaQuery.of(context).size.width,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey),
                                                          borderRadius:
                                                          BorderRadius.circular(8)),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(
                                                            top: 8, right: 8, bottom: 8),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            const SizedBox(width: 5),
                                                            Expanded(
                                                              child: Text(
                                                                fileName.isEmpty
                                                                    ? "No File Choosen"
                                                                    : fileName,
                                                                style: const TextStyle(
                                                                    fontSize: 12),
                                                              ),
                                                            ),
                                                            MaterialButton(
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(8),
                                                                ),
                                                                color: Colors.grey.shade200,
                                                                onPressed: () {
                                                                  getImage1();
                                                                },
                                                                child: const Text(
                                                                    "Choose File"))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.all(5.0),
                                                      child: Text(
                                                        "Files must be less than 2 MB. \n Allowed file types: png jpg jpeg.",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 11),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),

                                                    //Submit Button
                                                    Center(
                                                      child: MaterialButton(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(8)),
                                                        minWidth: double.infinity,
                                                        height: 50,
                                                        color: const Color(0xFFb83058),
                                                        onPressed: ()
                                                          {
                                                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                                          if(groupVal == other) {(postname.text == "")?toastMessage("Enter Name"):
                                                          (postmobile.text == "")?toastMessage("Enter Mobile Number"):
                                                          (postaddress.text == "")?toastMessage("Enter Address"):
                                                          (selectedDistrictValue1 == null)?toastMessage("Please Select District"):
                                                          (selectedTalukaValue1 == null)?toastMessage("Please Select Taluka"):
                                                          (selectedVillageValue1 == null)?toastMessage("Please Select Village"):
                                                          (selectedDepartmentValue1 == null)?toastMessage("Please Select Department"):
                                                          (selectedOfficeValue1 == null)?toastMessage("Please Select Office"):
                                                          (selectedNatureValue1 == null)?toastMessage("Please Select Nature"):
                                                          (description1.text == "")?toastMessage("Enter Grievance Details"):
                                                          (fileName.toString().isEmpty)?toastMessage("Select Image"):{
                                                          postGrievanceVM1.postGrievanceInfo1(OfficerPostGrievanceModal(
                                                          id: 0,
                                                          districtId: int.parse(selectedDistrictValue1!),
                                                          talukaId: int.parse(selectedTalukaValue1!),
                                                          stateId: 0,
                                                          villageId: int.parse(selectedVillageValue1!),
                                                          concernDeptId: int.parse(selectedDepartmentValue1!),
                                                          concernOfficeId: int.parse(selectedOfficeValue1!),
                                                          natureGrievanceId: int.parse(selectedNatureValue1!),
                                                          grievanceDescription: description1.text,
                                                          isSelfGrievance: 1,
                                                          otherCitizenName: postname.text,
                                                          otherCitizenMobileNo: postmobile.text,
                                                          otherCitizenAddress: postaddress.text,
                                                          createdBy: 1,
                                                          modifiedBy: 1,
                                                          citizenGrievanceImages: postImageList1,
                                                          grievanceNo: "",
                                                          ),),
                                                          uploadFileOrDocs(),
                                                           Get.toNamed('/DashBoardScreen'),
                                                          toastMessage("Grievance Posted Successfully"),
                                                          };
                                                          }
                                                          }
                                                          );},
                                                        child: const Text(
                                                          "Submit",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 18),
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
      ),
    );
  }
}


// Other sathi ahe
// {
// if(groupVal == other) {
// postGrievanceVM1.postGrievanceInfo1(PostGrievanceModal(
// id: 0,
// districtId: int.parse(selectedDistrictValue1!),
// talukaId: int.parse(selectedTalukaValue1!),
// stateId: 0,
// villageId: int.parse(selectedVillageValue1!),
// concernDeptId: int.parse(selectedDepartmentValue1!),
// concernOfficeId: int.parse(selectedOfficeValue1!),
// natureGrievanceId: int.parse(selectedNatureValue1!),
// grievanceDescription: description1.text,
// isSelfGrievance: 1,
// otherCitizenName: postname.text,
// otherCitizenMobileNo: postmobile.text,
// otherCitizenAddress: postaddress.text,
// createdBy: 1,
// modifiedBy: 1,
// citizenGrievanceImages: postImageList1,
// grievanceNo: "",
// ));
// }
// uploadFileOrDocs();
//
// Get.toNamed('/DashBoardScreen');
// },
