import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/data/network/baseApiServices.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/resources/apiKeys.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class MentorRepository {

  Future<void> createMentor(dynamic data) async {
    var url = Uri.parse(
        'https://guided-by-culture-production.up.railway.app/api/mentors/create');
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    try {
      EasyLoading.show(status: "Creating Account");
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // StorageServices.to.setString(
        //     key: getMentorInformation,
        //     value: getMentorInformationModelToJson(data));
        Get.offAllNamed(Routes.CONGRATULATIONS);
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        throw Exception();
      }
    } catch (error) {
       EasyLoading.dismiss();
      throw Exception();
    }
  }
}
