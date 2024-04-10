import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
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

  //get mentor infor
  //post question replies
  Future<GetMentorInfo> getmentorinformation(
      {required String mentorEmail}) async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://guided-by-culture-production.up.railway.app/api/mentors/$mentorEmail'),
          headers: {
            "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
          });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GetMentorInfo.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Utils.snakbar(title: "Error", body: e.toString());
      throw Exception();
    }
  }
}
