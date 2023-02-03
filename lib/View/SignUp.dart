import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Utility/CommonString.dart';
import '../Utility/signup_controller.dart';
import '../View_mdal/otp_viewmodal.dart';
import '../View_mdal/signup_validation.dart';
import '../main.dart';
import 'LoginAndSignUp.dart';



final validationViewModal = Get.put(AllValidation());
final otpViewModal = Get.put(OTPViewModal());

GlobalKey<FormState> formkey = GlobalKey<FormState>();

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController disController =TextEditingController();
TextEditingController talController =TextEditingController();
TextEditingController villageController =TextEditingController();

String? selectedDistrictValue;
String? selectedTalukaValue;
String? selectedVillageValue;
int id = 1;
int userTypeId = 5;
int deviceTypeId = 1;
String talSelected = "1";
int? count;

int? selectedTalukaRange;
int? selectedVillageRange;
int? signupFlag;
class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

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
      villageViewModal.getAllVillage(selectedTalukaRange.toString());


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
        () =>
           ModalProgressHUD(
             inAsyncCall:   (districtViewModal.isLoading.value == true &&
                   talukaViewModal.isLoading.value == true

               ),
             color: Colors.black26,

             progressIndicator:  Container(
               decoration: BoxDecoration(
                   color: Colors.black87,
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

              child: NotificationListener<OverscrollIndicatorNotification>(
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
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: userName,
                                validator: validationViewModal.nameValidator,
                                style: const TextStyle(
                                    fontFamily: 'Montserrat-Black',fontWeight: FontWeight.w500,fontSize: 16),
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(

                                  isDense: true,
                                  hintText: 'userName'.tr,
                                  alignLabelWithHint: true,
                                  hintStyle: const TextStyle(
                                      fontFamily: 'Montserrat-Black',
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    letterSpacing: 0.2
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFb83058), width: 1.0),
                                    borderRadius: BorderRadius.circular(5),
                                  ),

                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: SvgPicture.asset(
                                      'assets/Profile.svg',
                                      fit: BoxFit.scaleDown,
                                      height: 6,
                                      width: 6,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: usermobileNo,
                                validator: validationViewModal.mobileValidator,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                    fontFamily: 'Montserrat-Black',fontWeight: FontWeight.w500, height: 1),
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'mobile'.tr,
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat-Black',
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      letterSpacing: 0.2
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFb83058), width: 1.0),
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
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [

                                    SvgPicture.asset(
                                      'assets/District.svg',
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 54,
                                      width: MediaQuery.of(context).size.width / 1.7,
                                      child:DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField2(
                                          isExpanded: true,
                                          hint:  Text(
                                            'district'.tr,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontFamily: 'Montserrat-Black'
                                            ),
                                          ),
                                          value: selectedDistrictValue,
                                          items: districtViewModal.districtList
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
                                                        'Montserrat-Black',
                                                        fontSize: 15)),
                                              ))
                                              .toList(),
                                          onChanged: (String? dist) => setState(() {
                                            selectedDistrictValue = dist!;
                                            print(selectedDistrictValue);
                                          }),
                                          dropdownDecoration: BoxDecoration(
                                              border: Border.all(color: Colors.black54)
                                          ),
                                          buttonHeight: 40,
                                          buttonWidth: MediaQuery.of(context).size.width,
                                          itemHeight: 45,
                                          dropdownDirection: DropdownDirection.left,
                                          searchController: disController,

                                          dropdownMaxHeight: MediaQuery.of(context).size.height/2 ,
                                          dropdownWidth: MediaQuery.of(context).size.height/2.7 ,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            filled: true,
                                              fillColor: Colors.white
                                          ),

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
                                                        controller: disController,
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
                                              disController.clear();
                                            }
                                          },
                                        ),
                                      )

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
                                    color:Colors.white),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(width:5),
                                    SvgPicture.asset(
                                      'assets/District.svg',
                                      height: 20,
                                    ),
                                    SizedBox(width: 20,),
                                    SizedBox(
                                      height: 54,
                                      width:
                                          MediaQuery.of(context).size.width / 1.9,
                                      child:
                                      DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField2(
                                          dropdownPadding: EdgeInsets.only(left: 10),
                                          isExpanded: true,
                                          hint:
                                              Text(
                                                'taluka'.tr,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color:Colors.black,
                                                    fontFamily: 'Montserrat-Black'
                                                ),

                                          ),
                                            value: selectedTalukaValue,
                                            items: talukaViewModal.talukaList
                                                .map((item) =>
                                                DropdownMenuItem<String>(
                                                  onTap: (){
                                                    selectedTalukaRange=item.id;
                                                  },
                                                  value:item.taluka.toString(),
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
                                                          fontSize: 15,
                                                          fontFamily:
                                                          'Montserrat-Black')),
                                                ))
                                                .toList(),
                                            onChanged: onTalukaChange,
                                            decoration: InputDecoration(
                                              border: InputBorder.none
                                            ),

                                            dropdownDecoration: BoxDecoration(
                                              border: Border.all(color: Colors.black54)
                                          ),
                                          buttonHeight: 40,
                                         // buttonWidth: MediaQuery.of(context).size.width,
                                          itemHeight: 45,

                                          searchController: talController,
                                          scrollbarAlwaysShow: true,
                                          dropdownMaxHeight: MediaQuery.of(context).size.height/2 ,
                                          dropdownDirection: DropdownDirection.left,
                                          dropdownWidth: MediaQuery.of(context).size.height/2.8 ,

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
                                                        controller: talController,
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
                                            return (items.value.toString().isCaseInsensitiveContainsAny(selectedTaluka));
                                          },

                                          onMenuStateChange: (isOpen) {
                                            if (!isOpen) {
                                              talController.clear();
                                            }
                                          },
                                        ),
                                      ),


                                    ),
                                    const SizedBox(width: 15),
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
                                            color: Colors.white),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const SizedBox(width: 5),
                                            SvgPicture.asset(
                                              'assets/District.svg',
                                              height: 20,
                                            ),
                                            SizedBox(width: 17,),
                                            SizedBox(
                                              height: 54,
                                              width:
                                                  MediaQuery.of(context).size.width / 1.83,
                                              child: Obx(()=>(villageViewModal.isLoading.value == true)?
                                              Row(

                                                  children:
                                              [
                                                Text("signUpVillage".tr,style:
                                                const TextStyle(color: Colors.black,
                                                  fontFamily:"Montserat-Black"
                                                ),),
                                                Spacer(),
                                                Icon(Icons.arrow_drop_down),
                                              SizedBox(width: 10,)],
                                              )
                                                :
                                              DropdownButtonFormField2(

                                                decoration: const InputDecoration(
                                                  contentPadding: EdgeInsets.all(5),
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
                                                      fontFamily: 'Montserrat-Black'
                                                  ),
                                                ),

                                                value: selectedVillageValue,
                                                items: villageViewModal.villageList
                                                    .map((items) =>
                                                    DropdownMenuItem<String>(
                                                      onTap: (){
                                                        selectedVillageRange=items.id;
                                                      },
                                                      value: items.village.toString(),
                                                      child: (langSelection =="Marathi" || selectedLanguage == "Marathi")?
                                                      Text(
                                                          items.m_Village!.toString(),
                                                          style: const TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                              'Montserrat-Medium')): Text(
                                                          items.village!.toString(),
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                              fontFamily:
                                                              'Montserrat-Black')),
                                                    ))
                                                    .toList(),
                                                onChanged: onVillageChange,

                                                dropdownDecoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black54)
                                                ),
                                                buttonHeight: 40,
                                                buttonWidth: MediaQuery.of(context).size.width,
                                                itemHeight: 45,

                                                dropdownMaxHeight: MediaQuery.of(context).size.height/2 ,
                                                dropdownDirection: DropdownDirection.left,
                                                dropdownWidth: MediaQuery.of(context).size.height/2.7 ,
                                                dropdownPadding: EdgeInsets.only(left: 9),




                                                searchController: villageController,

                                                searchInnerWidget: Padding(
                                                  padding: const EdgeInsets.only(
                                                    top: 8,
                                                    bottom: 4,
                                                    right: 8,
                                                    left: 8,
                                                  ),
                                                  child: Center(
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
                                                                controller: villageController,
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
                                                ),
                                                searchMatchFn: (items, selectedVillage) {
                                                  return (items.value.toString().isCaseInsensitiveContainsAny(selectedVillage));
                                                },

                                                onMenuStateChange: (isOpen) {
                                                  if (!isOpen) {
                                                    villageController.clear();
                                                  }
                                                },
                                              ),


                                              ),
                                            ),
                                            SizedBox(width: 5,)
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
                                  fillColor: Colors.white,
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
      ),
    );
  }
}
