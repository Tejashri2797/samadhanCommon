
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Modal/UpdateProfileModal.dart';
import '../Utility/CommonString.dart';
import '../Utility/snack_bar.dart';
import '../View_mdal/ProfileVM.dart';
import '../View_mdal/UpdateProfileVM.dart';
import '../View_mdal/district_viewmodal.dart';
import '../View_mdal/signup_validation.dart';
import '../View_mdal/taluka_viewmodal.dart';
import '../View_mdal/vilaage_viewmoda.dart';
import '../main.dart';
import 'OTPTabbar.dart';




class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => UpdateProfileState();
}




/*TextEditingController updateName = TextEditingController(text: profileName);
TextEditingController updateNumber=TextEditingController(text:MobileNumber);
TextEditingController updateEmail=TextEditingController(text:Email);*/
TextEditingController? updateName;
TextEditingController? updateNumber;
TextEditingController? updateEmail;

String? updateDistrictValue;
String? updateTalukaValue;
String? updateVillageValue;
bool talukaChange = false;
bool villageChange = false;


class UpdateProfileState extends State<UpdateProfile> {
  final profileVM= Get.put(ProfileVM());
  final districtViewModalUP = Get.put(DistrictViewModal());
  final talukaViewModal = Get.put(TalukaViewModal());
  final villageViewModal = Get.put(VillageViewModal());
  final validationViewModal = Get.put(AllValidation());
  final updateProfileVM = Get.put(UpdateProfileVM());
  @override
  void initState() {
    // TODO: implement initState
    fToast.init(context);
    setState(()  {
      updateName = TextEditingController(text: profileName);
      updateNumber = TextEditingController(text: MobileNumber);
       updateEmail = TextEditingController(text: Email);


      districtViewModalUP.getAllDistrict();
      talukaViewModal.getAllTaluka();
      villageViewModal.getAllVillage(updateTalukaId.toString());

    });
    super.initState();

  }
  void onTalukaChange(taluka) {
    setState(() {
     updateTalukaValue = taluka;
     print(updateTalukaValue);
     talukaChange = true;


      villageViewModal.villageList.clear();
      updateVillageValue=null;
      villageViewModal.isLoading.value = true;

    });
    setState(() {
      villageViewModal.getAllVillage(updateTalukaValue!);



    });
  }


  void onVillageChange(village){
    setState(() {
      villageChange =true;
      updateVillageValue=null;
      updateVillageValue=village;

    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
       setState(() {
         districtViewModalUP.districtList.clear();
         districtViewModalUP.isLoading.value = true;
         talukaViewModal.talukaList.clear();
         talukaViewModal.isLoading.value = true;
         villageViewModal.isLoading.value=true;
       });
       Timer(const Duration(seconds: 1), () {
         Get.back();
       });

        return false;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body:  Obx(
                  () =>
                ModalProgressHUD(
                  color: Colors.black,
                  inAsyncCall:  (districtViewModalUP.isLoading.value  &&
                talukaViewModal.isLoading.value &&
                villageViewModal.isLoading.value
            ) ,
            progressIndicator: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20)),
              height: 130,
              width: 130,
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: const [
                  CircularProgressIndicator(
                    color: Color(0xFFb83058),
                  ),
                  Text(
                    "Please wait",
                    style: TextStyle(
                        color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
                    child: Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height/2.5,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xFFb83058),
                ),
                Padding(
                    padding:  EdgeInsets.only(
                        left: MediaQuery.of(context).size.width/15,right: MediaQuery.of(context).size.width/15,top: MediaQuery.of(context).size.height/5
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height/1.3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            // blurStyle:BlurStyle.outer,
                            blurRadius: 3,

                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top:50),
                        child: ListView(
                          children: [

                                TextFormField(
                                  controller: updateName,
                                  validator: validationViewModal.nameValidator,
                                 selectionControls: MaterialTextSelectionControls(),


                                // updateName.selection = TextSelection.fromPosition(TextPosition(offset: updateName.text.length));


                                  style: const TextStyle(
                                      fontFamily: 'Montserrat', height: 1),

                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: profileName,
                                    hintStyle: TextStyle(color: Colors.black),
                                    filled: false,
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
                                  controller: updateNumber,
                                  validator: validationViewModal.mobileValidator,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                      fontFamily: 'Montserrat', height: 1),
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: MobileNumber,
                                    hintStyle: TextStyle(color: Colors.black),
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
                                 ),
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
                                        district!,
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
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                      value: updateDistrictValue,
                                      items: districtViewModalUP.districtList
                                          .map((items) =>
                                          DropdownMenuItem<String>(
                                            value: items.id.toString(),
                                            child: (langSelection =="Marathi" || selectedLanguage == "Marathi")?Text(
                                                items.m_District.toString(),
                                                style: const TextStyle(
                                                    fontFamily:
                                                    'Montserrat-Medium',
                                                    fontSize: 14)):Text(
                                                items.district.toString(),
                                                style: const TextStyle(
                                                    fontFamily:
                                                    'Montserrat-Medium',
                                                    fontSize: 14)),
                                          ))
                                          .toList(),
                                      onChanged: (String? dist) => setState(() {
                                        updateDistrictValue = dist!;

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
                                  ),
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
                                          taluka!,
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
                                        value: updateTalukaValue,
                                        items: talukaViewModal.talukaList
                                            .map((item) =>
                                            DropdownMenuItem<String>(
                                              value:item.id.toString(),
                                              child:
                                              (langSelection =="Marathi" || selectedLanguage == "Marathi")?
                                              Text(
                                                  item.m_Taluka!.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                      'Montserrat-Medium'))
                                                  :Text(
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
                                  Border.all(color: Colors.grey.shade700),),
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
                                    child: Obx(()=>(villageViewModal.isLoading.value == true)?Row(children:[Text("   ${village!}")] )
                                        : DropdownButtonFormField<String>(
                                      hint:  (talukaChange==true)?
                                      const Text(
                                        '   Select Village',
                                        style:TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Montserrat-Medium',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ): Text(
                                        village!,
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
                                      value: updateVillageValue,
                                      items: villageViewModal.villageList
                                          .map((items) =>
                                          DropdownMenuItem<String>(
                                            value: items.id.toString(),
                                            child: (langSelection =="Marathi" || selectedLanguage == "Marathi")?
                                            Text(
                                                items.m_Village!.toString(),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                    'Montserrat-Medium')): Text(
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
                              controller: updateEmail,
                              validator: validationViewModal.emailValidator,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  fontFamily: 'Montserrat', height: 1),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: Email,
                                hintStyle: TextStyle(color: Colors.black),
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
                            Row(

                              children: [
                                MaterialButton(
                                  height: 40,
                                  minWidth: MediaQuery.of(context).size.width/2.7,
                                  color: Color(0xFFb83058),
                                   onPressed: (){
                                     setState(() {
                                       updateDistrictValue =null;
                                       updateTalukaValue = null;
                                       updateVillageValue= null;
                                       districtViewModalUP.districtList.clear();
                                       districtViewModalUP.isLoading.value = true;
                                       talukaViewModal.talukaList.clear();
                                       talukaViewModal.isLoading.value = true;
                                       villageViewModal.isLoading.value=true;
                                     });
                                     Timer(const Duration(seconds: 1), () {
                                       Get.back();
                                     });
                                   },
                                    child: const Text('Cancel',style: TextStyle(
                                        fontFamily: 'Montserrat-Medium',fontSize: 15,color: Colors.white),)
                                ),
                                SizedBox(width: 13,),
                                MaterialButton(
                                  height: 40, minWidth: MediaQuery.of(context).size.width/2.7,
                                   color: Color(0xFFb83058),
                                    onPressed: () async {
                                      await updateProfileVM.updateUser(UpdateProfileModalClass());
                                      profileVM.profileDetails.clear();
                                      profileVM.isLoading.value = true;
                                      await profileVM.getDetails("${data.read('profileId')}");

                                      Timer(const Duration(seconds: 1), () {
                                        Get.back();
                                      });
                                      setState(() {
                                        updateDistrictValue =null;
                                        updateTalukaValue = null;
                                        updateVillageValue = null;
                                        districtViewModalUP.districtList.clear();
                                        districtViewModalUP.isLoading.value = true;
                                        talukaViewModal.talukaList.clear();
                                        talukaViewModal.isLoading.value = true;
                                        villageViewModal.isLoading.value= true;


                                      });

                                    },
                                    child: const Text('Update',style: TextStyle(
                                        fontFamily: 'Montserrat-Medium',fontSize: 15,color: Colors.white),)
                                ),
                              ],
                            )



                          ],
                        ),
                      ),
                    ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height/6.2,
                    left: MediaQuery.of(context).size.width/2.4,
                    child: CircleAvatar(
                      radius: 36,
                      child: SvgPicture.asset('assets/Profile Colorful.svg',),

                    ),
                ),
                Positioned(
                    top: 50,
                    left: 20,
                    child: Row(
                      children: [
                        InkWell(
                            onTap:(){
                              setState(() {
                                updateDistrictValue =null;
                                updateTalukaValue = null;
                                updateVillageValue= null;
                                districtViewModalUP.districtList.clear();
                                districtViewModalUP.isLoading.value = true;
                                talukaViewModal.talukaList.clear();
                                talukaViewModal.isLoading.value = true;
                                villageViewModal.isLoading.value=true;
                              });
                              Timer(const Duration(seconds: 1), () {
                                Get.back();
                              });

                            },
                            child: const Icon(Icons.arrow_back_ios_sharp,size: 25, color:Colors.white,)),
                        SizedBox(width: MediaQuery.of(context).size.width/25,),
                        Text('profile'.tr,style:  const TextStyle(
                            color:Colors.white,
                            fontSize: 20,
                            fontFamily: 'Montserrat'
                        ),)
                      ],
                    ),
                )
              ],
            ),
                  ),
          )
      ),
    );
  }
}
