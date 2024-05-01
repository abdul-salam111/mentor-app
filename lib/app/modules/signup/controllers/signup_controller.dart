import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/resources/icons.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxString selectUserType = ''.obs;

  void setSelectUserType(String gender) {
    selectUserType.value = gender;
  }


  var accepttermsandConditions = false.obs;

 
}
