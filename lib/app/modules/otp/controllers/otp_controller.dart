import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';
import 'package:mentor_app/app/storage/storage.dart';

class OtpController extends GetxController {
  final otpController=TextEditingController().obs;
   AuthRepository authRepository=AuthRepository();
  Future sendOtp({required String otp})async{
     await authRepository.verifyOtp(otp: otp);
  }
   Future resendOtp()async{
     await authRepository.forgetPassword(email: StorageServices.to.getString('forgetEmail').trim());
  }

}
