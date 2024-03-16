import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/models/getMenteeInfo.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class HomeController extends GetxController {
  AuthRepository authRepository = AuthRepository();
  Future<void> logoutUser() async {
    EasyLoading.show(status: "Logging out");
    authRepository.logoutUser().then((value) {
     
    });
  }

  final passwordController = TextEditingController().obs;
  var passwordObsecure = true.obs;
  Future<void> deleteMentee() async {
    EasyLoading.show(status: "Logging out");
    authRepository.deleteMenteeAccount(data: {
      "password": passwordController.value.text.toString(),
      "usernameOrEmail":
          getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
              .email
    }).then((value) {
      EasyLoading.dismiss();
    });
  }
}
