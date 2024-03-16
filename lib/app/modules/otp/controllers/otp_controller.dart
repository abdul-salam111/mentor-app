import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';

class OtpController extends GetxController {
  final otpController=TextEditingController().obs;
   AuthRepository authRepository=AuthRepository();
  Future sendOtp({required String otp})async{
     await authRepository.verifyOtp(otp: otp);
  }
}
