import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentor_app/app/models/getMenteeInfo.dart';
import 'package:mentor_app/app/models/signInModel.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';
import 'package:mentor_app/app/repositories/questionsRepo.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../../Utils/Utils.dart';

class SigninController extends GetxController {
  final nameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  AuthRepository authRepository = AuthRepository();
  QuestionsRepository questionsRepository = QuestionsRepository();
  Future<void> loginMentee() async {
    EasyLoading.show(status: "Signing In");

    SigninModel signinModel = SigninModel(
        password: passwordController.value.text,
        usernameOrEmail: nameController.value.text);

    await authRepository
        .signInMentee(jsonEncode(signinModel))
        .then((value) async {
//code for call
      await StorageServices.to
          .setString(key: usertoken, value: value['accessToken']);
      EasyLoading.dismiss();
      var menteedata = await authRepository.getMenteeData(
          email: nameController.value.text.toString());
      StorageServices.to.setString(
          key: getmenteeinfo, value: getMenteeInfoToJson(menteedata));
      questionsRepository.fetchQuestionCount();
      Get.offAllNamed(Routes.NAVIGATION_BAR);
      ZegoUIKitPrebuiltCallInvitationService().init(
        appID: 2109043297 /*input your AppID*/,
        appSign:
            "3bbeed7104952626f4b5f8a30d0089e9442d9a05872113beb24d457d91498fdb" /*input your AppSign*/,
        userID: nameController.value.text,
        userName:
            getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                    .fullName ??
                "Abdul Salam",
        plugins: [ZegoUIKitSignalingPlugin()],
      );
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      Utils.snakbar(title: "Failed to Search", body: error.toString());
    });
  }

  List<String> scopes = <String>[
    'email',
  ];

  // GoogleSignIn googleSignIn = GoogleSignIn();
  // Future<void> handleSignIn() async {
  //   try {
  //     await googleSignIn.signIn().then((value) {
  //       if (value != null) {
  //         StorageServices.to
  //             .setBool(key: isUserLoggedinWithGoogle, value: true);

  //         Get.offAndToNamed(Routes.ON_BOARDING);
  //       } else {
  //         print('Sign-in process did not complete successfully.');
  //       }
  //     });
  //   } catch (error) {
  //     print('Error occurred during sign-in: $error');
  //   }
  // }
}
