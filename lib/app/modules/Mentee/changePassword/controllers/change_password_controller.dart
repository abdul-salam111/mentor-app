import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/models/getMenteeInfo.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class ChangePasswordController extends GetxController {
  final oldPasswordController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  var oldpasswordObsecure = true.obs;
  var newpasswordObsecure = true.obs;
  var confirmpasswordObsecure = true.obs;
  AuthRepository authRepository = AuthRepository();
  Future<void> changePassword() async {
    EasyLoading.show(status: "Changing password");
    authRepository
        .changeMenteePassword(
            email: getMenteeModelFromJson(
                    StorageServices.to.getString(getmenteeinfo))
                .email!,
            newpassword: confirmPasswordController.value.text.trim().toString(),
            oldpassword: oldPasswordController.value.text.trim().toString())
        .then((value) {
      EasyLoading.dismiss();

      Utils.snakbar(
          title: "Password Changed!", body: "Password Changed Successfully!");
    });
  }
}
