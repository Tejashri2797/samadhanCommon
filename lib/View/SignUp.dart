import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:samadhan/Modal/village_modal.dart';
import 'package:samadhan/View_mdal/district_viewmodal.dart';

import '../Modal/taluka_modal.dart';
import '../Utility/signup_controller.dart';
import '../View_mdal/otp_viewmodal.dart';
import '../View_mdal/signup_validation.dart';
import '../View_mdal/taluka_viewmodal.dart';
import '../View_mdal/vilaage_viewmoda.dart';

final districtViewModal = Get.put(DistrictViewModal());
final talukaViewModal = Get.put(TalukaViewModal());
final villageViewModal = Get.put(VillageViewModal());
final validationViewModal = Get.put(AllValidation());
final otpViewModal = Get.put(OTPViewModal());

GlobalKey<FormState> formkey = GlobalKey<FormState>();

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}


String? selectedDistrictValue;
String? selectedTalukaValue;
String? selectedVillageValue;
int id = 1;
int userTypeId = 0;
int deviceTypeId = 1;
String talSelected = "1";
int? count;
int? signupFlag;
class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    talukaViewModal.talukaList.clear();
    districtViewModal.districtList.clear();
    districtViewModal.isLoading.value=true;
    talukaViewModal.isLoading.value=true;
    villageViewModal.villageList.clear();
    villageViewModal.isLoading.value = true;
     talukaViewModal.getAllTaluka();
     districtViewModal.getAllDistrict();
     selectedDistrictValue=null;
     selectedTalukaValue= null;
     selectedVillageValue= null;



  }


  void onTalukaChange(taluka) {
    setState(() {
      selectedTalukaValue = taluka;
      villageViewModal.villageList.clear();
      selectedVillageValue=null;
      villageViewModal.isLoading.value = true;

    });
    setState(() {
      villageViewModal.getAllVillage(selectedTalukaValue!);


    });
 }


  void onVillageChange(village){
    setState(() {
      selectedVillageValue=village;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => (districtViewModal.isLoading.value == true &&
                talukaViewModal.isLoading.value == true
           // && villageViewModal.isLoading.value == true

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
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: const BoxDecoration(color: Colors.white,
                      // borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        // BoxShadow(
                        //   color: Colors.black45,
                        //   blurRadius: 6,
                        // )
                      ]),
                  child: Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          //shrinkWrap: true,
                          //scrollDirection: Axis.vertical,

                          children: [
                            TextFormField(
                              controller: userName,
                              validator: validationViewModal.nameValidator,
                              style: const TextStyle(
                                  fontFamily: 'Montserrat', height: 1),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'userName'.tr,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFb83058), width: 2.0),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                prefixIcon: SvgPicture.asset(
                                  'assets/Profile.svg',
                                  fit: BoxFit.scaleDown,
                                  height: 5,
                                  width: 5,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: usermobileNo,
                              validator: validationViewModal.mobileValidator,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontFamily: 'Montserrat', height: 1),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'mobile'.tr,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFb83058), width: 2.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: const Icon(
                                  Icons.local_phone_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              height: 54,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: Colors.grey.shade700),
                                  color: Colors.grey.shade100),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(width: 7),
                                  SvgPicture.asset(
                                    'assets/District.svg',
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 54,
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: DropdownButtonFormField<String>(
                                      hint:  Text(
                                        'district'.tr,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Montserrat-Medium',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Montserrat-Medium',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300),
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        // hintText: 'Osmanabad',
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                      value: selectedDistrictValue,
                                      items: districtViewModal.districtList
                                          .map((items) =>
                                              DropdownMenuItem<String>(
                                                value: items.id.toString(),
                                                child: Text(
                                                    items.district.toString(),
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            'Montserrat-Medium',
                                                        fontSize: 14)),
                                              ))
                                          .toList(),
                                      onChanged: (String? dist) => setState(() {
                                        selectedDistrictValue = dist!;
                                        print(selectedDistrictValue);
                                      }),
                                      menuMaxHeight: 300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              height: 54,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: Colors.grey.shade700),
                                  color: Colors.grey.shade100),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(width: 7),
                                  SvgPicture.asset(
                                    'assets/District.svg',
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 54,
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: DropdownButtonFormField<String>(
                                      alignment: Alignment.topCenter,
                                      //validator: validationViewModal.districtValidator!,
                                      hint:  Text(
                                        'taluka'.tr,
                                        style:const TextStyle(
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
                                            borderSide: BorderSide.none),
                                      ),
                                      value: selectedTalukaValue,
                                      items: talukaViewModal.talukaList
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value:item.id.toString(),
                                                child: Text(
                                                    item.taluka!.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'Montserrat-Medium')),
                                              ))
                                          .toList(),
                                      onChanged: onTalukaChange


                                      ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                           Container(
                                      height: 54,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border:
                                              Border.all(color: Colors.grey.shade700),
                                          color: Colors.grey.shade100),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const SizedBox(width: 7),
                                          SvgPicture.asset(
                                            'assets/District.svg',
                                            height: 20,
                                          ),
                                          SizedBox(
                                            height: 54,
                                            width:
                                                MediaQuery.of(context).size.width / 1.5,
                                            child: Obx(()=>(villageViewModal.isLoading.value == true)?Row(children:[Text("    Select Village")] )
                                              : DropdownButtonFormField<String>(
                                                hint:  Text(
                                                  'village'.tr,
                                                  style:const TextStyle(
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
                                                      borderSide: BorderSide.none),
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
                                                onChanged: onVillageChange,


                                                menuMaxHeight: 300,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),


                             ),


                            const SizedBox(height: 15),
                            TextFormField(
                              controller: email,
                              validator: validationViewModal.emailValidator,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  fontFamily: 'Montserrat', height: 1),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'email'.tr,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFb83058), width: 2.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: SvgPicture.asset(
                                  'assets/email.svg',
                                  fit: BoxFit.scaleDown,
                                  height: 5,
                                  width: 5,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
