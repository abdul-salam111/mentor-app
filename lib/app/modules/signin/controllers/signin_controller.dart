import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/authModels/loginMenteeInfo.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';
import 'package:mentor_app/app/repositories/mentorRepo.dart';
import 'package:mentor_app/app/repositories/questionsRepo.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import '../../../Utils/Utils.dart';

class SigninController extends GetxController {
  final nameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxString selectUserType = ''.obs;

  void setSelectUserType(String gender) {
    selectUserType.value = gender;
  }

  var accepttermsandConditions = false.obs;

  final firebaseauth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future firebaseLoginuser(email, password) async {
    await firebaseauth.signInWithEmailAndPassword(
        email: email, password: passwordController.value.text);
  }

  MentorRepository mentorRepository = MentorRepository();
  AuthRepository authRepository = AuthRepository();
  QuestionsRepository questionsRepository = QuestionsRepository();
  final signupcontroller = Get.put(SignupController());
  Future<void> loginUser() async {
    EasyLoading.show(status: "Signing In");

    LoginMenteeRequestModel signinModel = LoginMenteeRequestModel(
        password: passwordController.value.text,
        usernameOrEmail: nameController.value.text);

    await authRepository
        .signInUser(jsonEncode(signinModel), selectUserType)
        .then((value) async {
      await StorageServices.to
          .setString(key: usertoken, value: value['accessToken']);
      StorageServices.to
          .setString(key: selectedUserType, value: selectUserType.value);
      if (selectUserType.value == "Mentee") {
        var menteedata = await authRepository.getMenteeData(
            email: nameController.value.text.toString());
        firebaseLoginuser("mentee${nameController.value.text.toString()}",
            passwordController.value.text.toString());
        StorageServices.to.setString(
            key: getmenteeinfo, value: getMenteeInfoToJson(menteedata));
        questionsRepository.fetchQuestionCount();
      } else {
        var mentordata = await mentorRepository.getmentorinformation(
            mentorEmail: nameController.value.text.toString());
        firebaseLoginuser(nameController.value.text.toString(),
            passwordController.value.text.toString());
        StorageServices.to.setString(
            key: getMentorInformationsss,
            value: getMentorInfoToJson(mentordata));
      }
      ZegoUIKitPrebuiltCallInvitationService().init(
        appID: 501015063 /*input your AppID*/,
        appSign:
            "6b2c3129f696ea42de0450c0f8b2edd5c127a9c3fe60e103098fa680ee0fb55d" /*input your AppSign*/,
        userID: StorageServices.to.getString(selectedUserType) == "Mentee"
            ? getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                .email
            : getMentorInfoFromJson(
                    StorageServices.to.getString(getMentorInformationsss))
                .email,
        userName: StorageServices.to.getString(userName).isEmpty
            ? "Username"
            : StorageServices.to.getString(userName),
        plugins: [ZegoUIKitSignalingPlugin()],
      );

      EasyLoading.dismiss();
      Get.offAllNamed(Routes.NAVIGATION_BAR);
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      Utils.snakbar(title: "Failed to Search", body: error.toString());
    });
  }

  // List<String> scopes = <String>[
  //   'email',
  // ];

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
