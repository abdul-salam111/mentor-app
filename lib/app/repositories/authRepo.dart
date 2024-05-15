import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/data/network/baseApiServices.dart';
import 'package:mentor_app/app/data/network/networkApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/resources/apiKeys.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class AuthRepository {
  BaseApiServices networkApiService = NetworkApiService();
  Future<dynamic> signInUser(dynamic data, userType) async {
    try {
      dynamic response = await networkApiService.getPostResponse(
          userType == "Mentee" ? loginMentee : loginMentor, data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    var url = Uri.parse(
        'https://guided-by-culture-production.up.railway.app/api/auth/logout');

    // Make the POST request
    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
        },
      );

      if (response.statusCode == 200) {
        Utils.snakbar(title: "", body: "You have been logged out");
        EasyLoading.dismiss();
        ZegoUIKitPrebuiltCallInvitationService().uninit();
        StorageServices.to.remove(usertoken);
        StorageServices.to.remove(selectedUserType);
        StorageServices.to.remove('updateProfile');
        await FirebaseAuth.instance.signOut();
        Get.offAllNamed(Routes.SIGNIN);
      } else {
        Utils.snakbar(title: "Faild", body: "Failed to log out!");
      }
    } catch (e) {
      Utils.snakbar(title: "Faild", body: "Failed");
    }
  }

  Future<void> changeMenteePassword(
      {required String email,
      required String newpassword,
      required String oldpassword}) async {
    var url = Uri.parse(
        'https://guided-by-culture-production.up.railway.app/api/mentee/change-password?email=$email&newPassword=$newpassword&oldPassword=$oldpassword');

    // Make the POST request
    try {
      var response = await http.patch(
        url,
        headers: <String, String>{
          "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
        },
      );

      if (response.statusCode == 200) {
        Get.back();
        Utils.snakbar(
            title: "Password changed",
            body: "Your password is successfully changed");
      } else {
        if (response.body ==
            "java.lang.IllegalArgumentException: Incorrect old password") {
          Utils.snakbar(
              title: "Incorrect Password", body: "Old password is incorrect");
        }
      }
    } catch (e) {
      print(e);
      if (e == "java.lang.IllegalArgumentException: Incorrect old password") {
        Utils.snakbar(
            title: "Incorrecr Password", body: "Old password is incorrect");
      }
    }
  }

  Future<void> deleteMenteeAccount({
    required dynamic data,
  }) async {
    var url = Uri.parse(
        'https://guided-by-culture-production.up.railway.app/api/mentee/deactivateAccount');

    // Make the POST request
    try {
      var response = await http.delete(url,
          headers: <String, String>{
            "Content-Type": "application/json",
            "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
          },
          body: jsonEncode(data));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data['messageStatus'] !=
            "java.lang.IllegalArgumentException: Incorrect password") {
          StorageServices.to.remove(usertoken);
          StorageServices.to.remove(getmenteeinfo);
          Utils.snakbar(
              title: "Account deleted!",
              body: "Your account has been deleted!");
          Get.offAllNamed(Routes.SIGNIN);
        } else {
          Utils.snakbar(title: "error", body: "Password is incorrect!");
        }
      } else {
        print(response.body);
        Utils.snakbar(title: "Failed", body: "Failed to delete account");
      }
    } catch (e) {
      print(data);
      Utils.snakbar(title: "Failed", body: "Failed to delete account");
    }
  }

  Future<GetMenteeInfo> getMenteeData({
    required String email,
  }) async {
    var url = Uri.parse(
        'https://guided-by-culture-production.up.railway.app/api/mentee/get-by-email?email=$email');

    // Make the POST request
    try {
      var response = await http.get(
        url,
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        StorageServices.to.setString(key: userId, value: data['id'].toString());
        StorageServices.to
            .setString(key: userName, value: data['fullName'].toString());

        return GetMenteeInfo.fromJson(data);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> forgetPassword({
    required String email,
  }) async {
    var url = Uri.parse(
        'https://guided-by-culture-production.up.railway.app/api/forgot-password/$email');

    // Make the POST request
    try {
      EasyLoading.show(status: "sending otp");
      var response = await http.post(
        url,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        Utils.snakbar(
            title: "Email sent",
            body: " A one-time passcode will be sent to your email.");
        Get.toNamed(Routes.OTP);
      } else {
        Utils.snakbar(title: "Not found", body: "Email not found.");
        EasyLoading.dismiss();

        throw Exception();
      }
    } catch (e) {
      EasyLoading.dismiss();
      throw Exception();
    }
  }

//verify otp
  Future<void> verifyOtp({
    required String otp,
  }) async {
    var url = Uri.parse(
        'https://guided-by-culture-production.up.railway.app/api/match-otp');
    Map<String, dynamic> payload = {
      "email":
          getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
              .email,
      "id":
          getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).id,
      "otp": otp,
    };
    print(payload);

    // Make the POST request
    try {
      EasyLoading.show(status: "sending otp");
      var response = await http.post(url, body: jsonEncode(payload), headers: {
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        EasyLoading.dismiss();

        Get.toNamed(Routes.CREATE_NEW_PASSWORD);
      } else {
        EasyLoading.dismiss();

        throw Exception();
      }
    } catch (e) {
      EasyLoading.dismiss();

      Utils.snakbar(title: "Failed", body: e.toString());
      throw Exception();
    }
  }

  //Create New password
  Future<void> createNewPassword({
    required String password,
  }) async {
    var url = Uri.parse(
        'https://guided-by-culture-production.up.railway.app/api/new-password?password=$password');
    Map<String, dynamic> payload = {
      "email":
          getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
              .email,
      "id":
          getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).id,
      "otp": StorageServices.to.getString("otp"),
    };

    // Make the POST request
    try {
      EasyLoading.show(status: "sending otp");
      var response = await http.put(url, body: jsonEncode(payload), headers: {
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        Utils.snakbar(
            title: "Password Changed",
            body: "Your password has been changed successfully!");

        Get.toNamed(Routes.SIGNIN);
      } else {
        EasyLoading.dismiss();
        print(response.body);
        throw Exception();
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);

      Utils.snakbar(title: "Failed", body: e.toString());
      throw Exception();
    }
  }

  //update mentee
  Future<void> updateMentee(Map<String, dynamic> data) async {
    final String apiUrl =
        'https://guided-by-culture-production.up.railway.app/api/mentee/update/${StorageServices.to.getString(userId)}';

    try {
      EasyLoading.show(status: "Updating profile...");
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        print(response.body);
        getMenteeData(
            email: getMenteeInfoFromJson(
                    StorageServices.to.getString(getmenteeinfo))
                .email);
        Utils.snakbar(title: "Updated", body: "Profile Updated");
      } else {
        EasyLoading.dismiss();
      }
    } catch (error) {
      EasyLoading.dismiss();
    }
  }
}
