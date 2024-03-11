import 'package:get/get.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/data/network/baseApiServices.dart';
import 'package:mentor_app/app/data/network/networkApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/resources/apiKeys.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class AuthRepository {
  BaseApiServices networkApiService = NetworkApiService();
  Future<dynamic> signInMentee(dynamic data) async {
    try {
      dynamic response =
          await networkApiService.getPostResponse(loginMentee, data);
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
        Utils.snakbar(title: "Loggedout", body: "You have been loggedout!");
      } else {
        Utils.snakbar(title: "Faild", body: "Failed");
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
      } else {
        Utils.snakbar(title: "Faild", body: "Failed to change the password");
      }
    } catch (e) {
      Utils.snakbar(title: "Faild", body: "Failed to change the password");
    }
  }
}
