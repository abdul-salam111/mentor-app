import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';

class ForgetPasswordController extends GetxController {
  final emailcontroller = TextEditingController().obs;
  AuthRepository authRepository = AuthRepository();
  Future sendOtp() async {
    await authRepository.forgetPassword(
        email: emailcontroller.value.text.toString());
        
  }
}
