import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  final newPasswordController=TextEditingController().obs;
  final confirmPasswordController=TextEditingController().obs;
  var passwordObsecure=true.obs;
  var confirmObsecure=true.obs;
}
