import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final oldPasswordController=TextEditingController().obs;
  final newPasswordController=TextEditingController().obs;
  final confirmPasswordController=TextEditingController().obs;
  var oldpasswordObsecure=true.obs;
  var newpasswordObsecure=true.obs;
  var confirmpasswordObsecure=true.obs;
}
