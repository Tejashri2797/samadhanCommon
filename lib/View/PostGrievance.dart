import 'dart:convert';
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
import '../main.dart';
import 'OTPTabbar.dart';
import 'package:http/http.dart'as http;

TextEditingController description = TextEditingController();

class PostGrievance1 extends StatefulWidget {
  const PostGrievance1({Key? key}) : super(key: key);

  @override
  State<PostGrievance1> createState() => _PostGrievance1State();
}




final postGrievanceVM = Get.put(PostGrievanceVM());
var  imageLink ;
String? selectedDistrictValue;
String? selectedNatureValue;
String? selectedTalukaValueG;
String? selectedVillageValueG;
String? selectedDepartmentValue;
String? selectedOfficeValue;
List<CitizenGrievanceImage> imagesDoc = [];
int? range;

int? selectedTalukaIndex;
int? selectedVillageIndex;
int? selectedDepartmentIndex;
int? selectedOfficeIndex;
int? selectdNatureIndex;

class _PostGrievance1State extends State<PostGrievance1> {
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
        'UploadDocPath', image!.path
    ),
    );
    var response = await request.send();
    if(response.statusCode== 200){

      final res = await http.Response.fromStream(response);
      print(res.body);
      Map temp = json.decode(res.body);
      imageLink = temp['responseData'];
      print(imageLink);
      imagesDoc.add(CitizenGrievanceImage(
          grievanceId:0,
          docname: fileName,
          docpath: "$imageLink",
          modifiedBy: 1,
          createdBy: int.parse(data.read('profileId')),
          sortOrder: 1
      ));



    }


  }


  Future getImage() async {
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

    }
  }


  final talukaViewModal = Get.put(TalukaViewModal());
  final districtViewModal = Get.put(DistrictViewModal());
  final villageViewModalG = Get.put(VillageViewModal());
  final departmentViewModal = Get.put(officerDepartmentVM());
  final getOfficeByIdViewModal = Get.put(GetOfficeByIdViewModal());
  final natureViewModal = Get.put(NatureViewModal());

  void onTalukaChangePG(taluka) {
    setState(() {
      selectedTalukaValueG = taluka;

      villageViewModalG.villageList.clear();
      selectedVillageValueG = null;
      villageViewModalG.isLoading.value = true;

    });
    setState(() {
      villageViewModalG.getAllVillage(selectedTalukaIndex.toString());
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
      getOfficeByIdViewModal.getOfficeByDepartment(selectedDepartmentIndex.toString());
    });
  }

  void onOfficeChangePG(office) {
    setState(() {
      selectedOfficeValue = office;
    });
  }
  void onBackPressed() {
    setState(() {
      selectedDistrictValue = null;
      districtViewModal.isLoading.value = true;
      districtViewModal.districtList.clear();

      selectedTalukaValueG= null;
      talukaViewModal.talukaList.clear();
      talukaViewModal.isLoading.value = true;
      selectedVillageValueG = null;
      villageViewModalG.villageList.clear();
      villageViewModalG.isLoading.value = true;
      selectedDepartmentValue=null;
      departmentViewModal.departmentList.clear();
      departmentViewModal.isLoading.value = true;
      selectedNatureValue=null;
      natureViewModal.natureList.clear();
      natureViewModal.isLoading.value = true;
      selectedOfficeValue=null;
      getOfficeByIdViewModal.grievanceOfficeList.clear();
      getOfficeByIdViewModal.isLoading.value = true;



    });

  }

  @override
  void initState() {
    fToast.init(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onBackPressed();
       setState(() {
         districtViewModal.getAllDistrict();
         talukaViewModal.getAllTaluka();
         departmentViewModal.getDepartment();
         natureViewModal.getNatureGrievance();
       });
    });

    super.initState();

  }

bool postGrievance = false;

  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBackPressed();
        Get.back();
        return false;
      },
      child: SafeArea(
          child: Scaffold(
        body: Obx(
          () =>
              ModalProgressHUD(
              inAsyncCall: (districtViewModal.isLoading.value == true &&
                talukaViewModal.isLoading.value == true &&
                departmentViewModal.isLoading.value == true &&
                natureViewModal.isLoading.value== true  || postGrievance == true
            ) ,
                progressIndicator:  Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
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
                child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowIndicator();
                      return true;
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2.6,
                          color: const Color(0xFFb83058),
                          child:  Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                 onBackPressed();
                                  Get.back();
                                },
                                icon: const Icon(Icons.arrow_back_ios_new),
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:5,top:13.0),
                                child: Text(
                                  "postGrievance".tr,
                                  style:const  TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height /13,left: 10,right: 10,bottom: 10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height ,
                            width: MediaQuery.of(context).size.width ,
                            child: Container(
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
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField2(

                                              decoration: InputDecoration(

                                                fillColor: Colors.white,
                                                  filled: true,

                                                  contentPadding: const EdgeInsets.all(10),
                                                  border: OutlineInputBorder(

                                                    borderRadius: BorderRadius.circular(7),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.black45),

                                                    borderRadius: BorderRadius.circular(7),
                                                  )),

                                              isExpanded: true,
                                              hint:  Text(
                                                'district'.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color:Colors.black,
                                                    fontFamily: 'Montserrat-Medium'
                                                ),
                                              ),
                                              value: selectedDistrictValue,
                                              items:districtViewModal
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
                                                            fontFamily: 'Montserrat-Medium',
                                                            fontSize: 14,
                                                      )),
                                                  ))
                                                  .toList(),
                                              onChanged: (String? dist) =>
                                                  setState(() {
                                                    selectedDistrictValue =
                                                    dist!;
                                                    print(
                                                        selectedDistrictValue);
                                                  }),
                                              dropdownDecoration: BoxDecoration(
                                                  border: Border.all(color: Colors.black54),
                                                
                                              ),
                                              buttonHeight: 40,
                                              dropdownOverButton: true,
                                              buttonWidth: MediaQuery.of(context).size.width,
                                              itemHeight: 45,
                                              dropdownMaxHeight:MediaQuery.of(context).size.height/0.6 ,

                                              searchController: textEditingController,

                                              searchInnerWidget: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 4,
                                                  right: 8,
                                                  left: 8,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                     Text(  'district'.tr,
                                                        style: const TextStyle(
                                                            color:  Color(0xFFb83058),
                                                            fontSize: 18,
                                                            fontFamily:
                                                            'Montserrat-Medium')),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        const Expanded(
                                                            flex: 1,
                                                            child: Icon(Icons.search,color: Colors.black45,size: 25,)),
                                                        Expanded(
                                                          flex: 4,
                                                          child: TextFormField(
                                                            controller: textEditingController,
                                                            decoration: const InputDecoration(
                                                              isDense: true,
                                                              contentPadding: EdgeInsets.symmetric(
                                                                horizontal: 10,
                                                                vertical: 8,
                                                              ),

                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              searchMatchFn: (items, selectedTaluka) {
                                                return (items.value.toString().contains(selectedTaluka));
                                              },

                                              onMenuStateChange: (isOpen) {
                                                if (!isOpen) {
                                                  textEditingController.clear();
                                                }
                                              },
                                            ),
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
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField2(

                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                  contentPadding: const EdgeInsets.all(10),
                                                border: OutlineInputBorder(

                                                  borderRadius: BorderRadius.circular(7),
                                                ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.black45),

                                                borderRadius: BorderRadius.circular(7),
                                              )),

                                              isExpanded: true,
                                              hint:  Text(
                                                'taluka'.tr,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color:Colors.black,
                                                  fontFamily: 'Montserrat-Medium'
                                                ),
                                              ),
                                              value: selectedTalukaValueG,
                                              items: talukaViewModal.talukaList
                                                  .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    onTap: (){
                                                      setState(() {
                                                        selectedTalukaIndex= item.id;

                                                      });
                                                    },
                                                    value:item.taluka.toString(),
                                                    child:
                                                    (langSelection =="Marathi" || selectedLanguage == "Marathi")?
                                                    Text(
                                                        item.m_Taluka!.toString(),
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontFamily:
                                                            'Montserrat-Medium'))
                                                        :Text(
                                                        item.taluka!.toString(),
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontFamily:
                                                            'Montserrat-Medium')),
                                                  ))
                                                  .toList(),
                                              dropdownDecoration: BoxDecoration(
                                                border: Border.all(color: Colors.black54)
                                              ),
                                              onChanged: onTalukaChangePG,
                                              buttonHeight: 40,
                                              buttonWidth: MediaQuery.of(context).size.width,
                                              itemHeight: 45,
                                              dropdownMaxHeight: MediaQuery.of(context).size.height ,
                                              searchController: textEditingController,

                                              searchInnerWidget: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 4,
                                                  right: 8,
                                                  left: 8,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                     Text('taluka'.tr,
                                                  style: const TextStyle(
                                                    color:  Color(0xFFb83058),
                                                      fontSize: 18,
                                                      fontFamily:
                                                      'Montserrat-Medium')),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                   mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        const Expanded(
                                                            flex: 1,
                                                            child: Icon(Icons.search,color: Colors.black45,size: 25,)),
                                                        Expanded(
                                                          flex: 4,
                                                          child: TextFormField(
                                                            controller: textEditingController,
                                                            decoration: const InputDecoration(
                                                              isDense: true,
                                                              contentPadding: EdgeInsets.symmetric(
                                                                horizontal: 10,
                                                                vertical: 8,
                                                              ),

                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),


                                              searchMatchFn: (items, selectedTaluka) {
                                                return (items.value.toString().toLowerCase().startsWith(selectedTaluka.toLowerCase()));
                                              },

                                              onMenuStateChange: (isOpen) {
                                                if (!isOpen) {
                                                  textEditingController.clear();
                                                }
                                              },
                                            ),
                                          ),
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
                                                  :
                                              DropdownButtonFormField2(


                                                decoration:
                                                const InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding: EdgeInsets.all(10),
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide
                                                          .none),
                                                ),

                                                isExpanded: true,
                                                hint:  Text(
                                                  'village'.tr,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color:Colors.black,
                                                      fontFamily: 'Montserrat-Medium'
                                                  ),
                                                ),
                                                value:
                                                selectedVillageValueG,
                                                items: villageViewModalG
                                                    .villageList
                                                    .map((items) =>
                                                    DropdownMenuItem<
                                                        String>(
                                                      onTap: (){
                                                        selectedVillageIndex=items.id;
                                                      },
                                                      value: items.village.toString(),
                                                      child: (langSelection =="Marathi" || selectedLanguage == "Marathi")?
                                                      Text(
                                                          items
                                                              .m_Village!
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 14,
                                                              fontFamily: 'Montserrat-Medium')): Text(
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
                                                dropdownDecoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black54)
                                                ),
                                                buttonHeight: 40,
                                                buttonWidth: MediaQuery.of(context).size.width,
                                                itemHeight: 45,

                                                dropdownMaxHeight: MediaQuery.of(context).size.height/2 ,




                                                searchController: textEditingController,

                                                searchInnerWidget: Padding(
                                                  padding: const EdgeInsets.only(
                                                    top: 8,
                                                    bottom: 4,
                                                    right: 8,
                                                    left: 8,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text('Select Village',
                                                          style: TextStyle(
                                                              color:  Color(0xFFb83058),
                                                              fontSize: 18,
                                                              fontFamily:
                                                              'Montserrat-Medium')),
                                                      const SizedBox(height: 10,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          const Expanded(
                                                              flex: 1,
                                                              child: Icon(Icons.search,color: Colors.black45,size: 25,)),
                                                          Expanded(
                                                            flex: 4,
                                                            child: TextFormField(

                                                              controller: textEditingController,
                                                              decoration: const InputDecoration(

                                                                isDense: true,
                                                                contentPadding: EdgeInsets.symmetric(
                                                                  horizontal: 10,
                                                                  vertical: 8,
                                                                ),

                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                searchMatchFn: (items, selectedVillage) {
                                                  return (items.value.toString().toLowerCase().startsWith(selectedVillage.toLowerCase()));
                                                },

                                                onMenuStateChange: (isOpen) {
                                                  if (!isOpen) {
                                                    textEditingController.clear();
                                                  }
                                                },
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
                                          child:

                                          DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField2(

                                              decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                  filled: true,
                                                  contentPadding: const EdgeInsets.all(10),
                                                  border: OutlineInputBorder(

                                                    borderRadius: BorderRadius.circular(7),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.black45),

                                                    borderRadius: BorderRadius.circular(7),
                                                  )),

                                              isExpanded: true,
                                              hint:  Text(
                                                'deptToster'.tr,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color:Colors.black,
                                                    fontFamily: 'Montserrat-Medium'
                                                ),
                                              ),
                                              value:
                                              selectedDepartmentValue,
                                              items: departmentViewModal
                                                  .departmentList
                                                  .map((items) =>
                                                  DropdownMenuItem<
                                                      String>(
                                                    onTap: (){
                                                      selectedDepartmentIndex=items.id;
                                                    },
                                                    value: items.departmentName.toString(),
                                                    child:(langSelection =="Marathi" || selectedLanguage == "Marathi")?
                                                    Text(
                                                        items
                                                            .m_DepartmentName!
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize:
                                                            14,
                                                            fontFamily:
                                                            'Montserrat-Medium')):
                                                    Text(
                                                        items
                                                            .departmentName!
                                                            .toString(),
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                            fontSize:
                                                            15,
                                                            fontFamily:
                                                            'Montserrat-Medium')),
                                                  ))
                                                  .toList(),
                                              onChanged:onDepartmentChangePG,
                                              dropdownDecoration: BoxDecoration(
                                                  border: Border.all(color: Colors.black54)
                                              ),

                                              buttonHeight: 40,

                                              buttonWidth: MediaQuery.of(context).size.width,
                                              itemHeight: 45,
                                              dropdownMaxHeight: MediaQuery.of(context).size.height/1.4,
                                              searchController: textEditingController,

                                              searchInnerWidget: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 4,
                                                  right: 8,
                                                  left: 8,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                   Text('deptToster'.tr,
                                                        style: const TextStyle(
                                                            color:  Color(0xFFb83058),
                                                            fontSize: 18,
                                                            fontFamily:
                                                            'Montserrat-Medium')),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        const Expanded(
                                                            flex: 1,
                                                            child: Icon(Icons.search,color: Colors.black45,size: 25,)),
                                                        Expanded(
                                                          flex: 4,
                                                          child: TextFormField(
                                                            controller: textEditingController,
                                                            decoration: const InputDecoration(
                                                              isDense: true,
                                                              contentPadding: EdgeInsets.symmetric(
                                                                horizontal: 10,
                                                                vertical: 8,
                                                              ),

                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              searchMatchFn: (items, selectedTaluka) {
                                                return (items.value.toString().toLowerCase().startsWith(selectedTaluka.toLowerCase()));
                                              },

                                              onMenuStateChange: (isOpen) {
                                                if (!isOpen) {
                                                  textEditingController.clear();
                                                }
                                              },
                                            ),
                                          )

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
                                                  :
                                                  DropdownButtonFormField2(


                                                    decoration:
                                                    const InputDecoration(
                                                      contentPadding: EdgeInsets.all(10),
                                                      isDense: true,
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                          BorderSide
                                                              .none),
                                                    ),

                                                    isExpanded: true,
                                                    hint:  Text(
                                                      "pgOffice".tr,
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color:Colors.black,
                                                          fontFamily: 'Montserrat-Medium'
                                                      ),
                                                    ),
                                                    value: selectedOfficeValue,
                                                    items: getOfficeByIdViewModal
                                                        .grievanceOfficeList
                                                        .map((items) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          onTap: (){
                                                            selectedOfficeIndex=items.id;
                                                          },
                                                          value: items
                                                              .name
                                                              .toString(),
                                                          child:(langSelection =="Marathi" || selectedLanguage == "Marathi")?
                                                          Text(
                                                              items.m_OfficeName!
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontFamily: 'Montserrat-Medium')):
                                                          Text(
                                                              items.name!
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontFamily: 'Montserrat-Medium')),
                                                        ))
                                                        .toList(),
                                                    onChanged:onOfficeChangePG,
                                                    dropdownDecoration: BoxDecoration(
                                                        border: Border.all(color: Colors.black54)
                                                    ),
                                                    buttonHeight: 40,
                                                    buttonWidth: MediaQuery.of(context).size.width,
                                                    itemHeight: 45,

                                                    dropdownMaxHeight: MediaQuery.of(context).size.height/2 ,




                                                    searchController: textEditingController,

                                                    searchInnerWidget: Padding(
                                                      padding: const EdgeInsets.only(
                                                        top: 8,
                                                        bottom: 4,
                                                        right: 8,
                                                        left: 8,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                           Text("selectOffice".tr,
                                                              style: const TextStyle(
                                                                  color:  Color(0xFFb83058),
                                                                  fontSize: 18,
                                                                  fontFamily:
                                                                  'Montserrat-Medium')),
                                                          const SizedBox(height: 10,),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              const Expanded(
                                                                  flex: 1,
                                                                  child: Icon(Icons.search,color: Colors.black45,size: 25,)),
                                                              Expanded(
                                                                flex: 4,
                                                                child: TextFormField(
                                                                  controller: textEditingController,
                                                                  decoration: const InputDecoration(
                                                                    isDense: true,
                                                                    contentPadding: EdgeInsets.symmetric(
                                                                      horizontal: 10,
                                                                      vertical: 8,
                                                                    ),

                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    searchMatchFn: (items, selectedOffice) {
                                                      return (items.value.toString().toLowerCase().startsWith(selectedOffice.toLowerCase()));
                                                    },

                                                    onMenuStateChange: (isOpen) {
                                                      if (!isOpen) {
                                                        textEditingController.clear();
                                                      }
                                                    },
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
                                        DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField2(
                                            scrollbarAlwaysShow: true,



                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,

                                                contentPadding: const EdgeInsets.all(10),
                                                border: OutlineInputBorder(

                                                  borderRadius: BorderRadius.circular(7),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.black45),

                                                  borderRadius: BorderRadius.circular(7),
                                                )),



                                            isExpanded: true,
                                            hint:  Text(
                                                'natureToster'.tr,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color:Colors.black,
                                                  fontFamily: 'Montserrat-Medium'
                                              ),
                                            ),
                                            value: selectedNatureValue,
                                            items: natureViewModal
                                                .natureList
                                                .map((items) =>
                                                DropdownMenuItem<
                                                    String>(
                                                  onTap: (){
                                                    selectdNatureIndex=items.id;
                                                  },
                                                  value: items.name
                                                      .toString(),
                                                  child:(langSelection =="Marathi" || selectedLanguage == "Marathi")?
                                                  Text(
                                                      items.m_Name!
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontFamily:
                                                          'Montserrat-Medium')):
                                                  Text(
                                                      items.name!
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 15,
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
                                            dropdownDecoration: BoxDecoration(
                                                border: Border.all(color: Colors.black54)
                                            ),
                                            buttonHeight: 40,
                                            buttonWidth: MediaQuery.of(context).size.width,
                                            itemHeight: 45,
                                            dropdownMaxHeight: 700,
                                            searchController: textEditingController,
                                            dropdownPadding: EdgeInsets.only(left: 15),

                                            searchInnerWidget: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8,
                                                bottom: 4,
                                                right: 8,
                                                left: 8,
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                   Text('natureToster'.tr,
                                                      style: TextStyle(
                                                          color:  Color(0xFFb83058),
                                                          fontSize: 18,
                                                          fontFamily:
                                                          'Montserrat-Medium')),
                                                  const SizedBox(height: 10,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      const Expanded(
                                                          flex: 1,
                                                          child: Icon(Icons.search,color: Colors.black45,size: 25,)),
                                                      Expanded(
                                                        flex: 4,
                                                        child: TextFormField(
                                                          controller: textEditingController,
                                                          decoration: const InputDecoration(
                                                            isDense: true,
                                                            contentPadding: EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 8,
                                                            ),

                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            searchMatchFn: (items, selectedNature) {
                                              return (items.value.toString().toLowerCase().startsWith(selectedNature.toLowerCase()));
                                            },

                                            onMenuStateChange: (isOpen) {
                                              if (!isOpen) {
                                                textEditingController.clear();
                                              }
                                            },
                                          ),
                                        ),
                                        /*DropdownButtonFormField<String>(
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
                                                    child:(langSelection =="Marathi" || selectedLanguage == "Marathi")?
                                                    Text(
                                                        items.m_Name!
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Montserrat-Medium')):
                                                    Text(
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
                                        ),*/

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
                                                      getImage();
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
                                              setState(() {
                                                postGrievance =true;
                                              });

                                              if(selectedDistrictValue == null) {
                                                toastMessage(
                                                    'district'.tr);
                                              }else if (selectedTalukaValueG == null) {
                                                toastMessage('taluka'.tr);
                                              }
                                              else if (selectedVillageValueG == null) {
                                                toastMessage('village'.tr);
                                              }
                                              else if (selectedDepartmentValue  == null) {
                                                toastMessage('deptToster'.tr);
                                              }
                                              else if  (selectedOfficeValue == null) {
                                                toastMessage('officeToster'.tr);
                                              }
                                              else if (selectedNatureValue == null) {
                                                toastMessage('natureToster'.tr);
                                              }
                                              else if  (description.text.isEmpty) {
                                                toastMessage('detailsToster'.tr);
                                              }
                                              else if  (fileName.toString().isEmpty) {
                                                toastMessage('Please choose file');
                                              }
                                              else{
                                                await uploadFileOrDocs();
                                                await postGrievanceVM.postGrievanceInfo(PostGrievanceModal());
                                                imagesDoc.clear();
                                               onBackPressed();
                                                Get.back();
                                                //snackBar(postGrievance).show(context);
                                            }
                                              setState(() {
                                                postGrievance = false;
                                              });
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
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
        ),
      )),
    );
  }
}
