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
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

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
    try {
      await firebaseauth.signInWithEmailAndPassword(
          email: email, password: passwordController.value.text);
    } catch (e) {
      print('::: Failed to firebaseLoginuser');
    }
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

    print('::: signinModel.toJson()${signinModel.toJson()}');

    await authRepository
        .signInUser(jsonEncode(signinModel), selectUserType)
        .then((value) async {
      print('::: 1');
      await StorageServices.to
          .setString(key: usertoken, value: value['accessToken']);
      print('::: 2');

      StorageServices.to
          .setString(key: selectedUserType, value: selectUserType.value);
      print('::: 3');

      if (selectUserType.value == "Mentee") {
        print('::: 4');

        var menteedata = await authRepository.getMenteeData(
            email: nameController.value.text.toString());
        firebaseLoginuser("mentee${nameController.value.text.toString()}",
            passwordController.value.text.toString());
        StorageServices.to.setString(
            key: getmenteeinfo, value: getMenteeInfoToJson(menteedata));
        questionsRepository.fetchQuestionCount();
      } else {
        print('::: 5');

        var mentordata = await mentorRepository.getmentorinformation(
            mentorEmail: nameController.value.text.toString());
print(':::: login ka time pa ${mentordata}');
        firebaseLoginuser(nameController.value.text.toString(),
            passwordController.value.text.toString());
        print('::: 6');

        StorageServices.to.setString(
            key: getMentorInformationsss,
            value: getMentorInfoToJson(mentordata));
        print('::: 7');
      }
      ZegoUIKitPrebuiltCallInvitationService().init(
        appID:ZegoCloudConfig.appId,
        //  555496812 /*input your AppID*/,
        appSign:ZegoCloudConfig.appSign,
            // "fd93f89ac4205aa5b7ebbdb386693b6de38e8f153bb41cfcc283cad5565e86b0" /*input your AppSign*/,
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
      print('::: 8');

      EasyLoading.dismiss();
      Get.offAllNamed(Routes.NAVIGATION_BAR);
    }).onError((error, stackTrace) {
      print('::: 10');

      EasyLoading.dismiss();
      print('::: exception ${error.toString()}');
      Utils.snakbar(title: "", body: error.toString());
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
