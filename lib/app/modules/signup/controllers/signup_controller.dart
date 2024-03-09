import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
 final nameController=TextEditingController().obs;
 final emailController=TextEditingController().obs;
 final passwordController=TextEditingController().obs;
  RxString selectUserType = ''.obs;

  void setSelectUserType(String gender) {
    selectUserType.value = gender;
  }
  var accepttermsandConditions=false.obs;
}
