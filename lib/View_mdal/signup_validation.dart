import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AllValidation extends GetxController{

  String? nameValidator(String? value){
    Pattern pattern = '[a-zA-Z]';
    RegExp nameRegex = new RegExp(pattern.toString());

    if(value!.trim().isEmpty) return '*Required';
    if(!nameRegex.hasMatch(value)){
      return 'Enter a valid Name';
    }
    return null;
  }




  String? mobileValidator(String? value){
    Pattern pattern = r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
    RegExp mobileRegex = RegExp(pattern.toString());

    if(value!.trim().isEmpty) return '*Required';
    if(!mobileRegex.hasMatch(value!)){
      return 'Enter a valid Mobile No';
    }
    return null;
  }

  String? emailValidator(String? value){
    Pattern pattern =  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp emailRegex = RegExp(pattern.toString());
    if(value!.trim().isEmpty) return '*Required';
    if(!emailRegex.hasMatch(value!)){
      return 'Enter a  email like abc@xyz.com';
    }
    return null;

  }

  String? districtValidator(String? value){

    if(value== null) return '*Required';

    return null;
  }

  String? mobileValidator1(String? value){
    Pattern pattern = r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
    RegExp mobileRegex = RegExp(pattern.toString());

    if(value!.trim().isEmpty) return '*Required';
    if(!mobileRegex.hasMatch(value!)){
      return 'Enter a valid Mobile No';
    }
    return null;
  }


}