import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/mentor/getBestMentorModel.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/models/mentor/getSearchedMentorsModel.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class MentorRepository {
  final firebaseauth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future signUpUsertoFirebase(var mentor, userId, email, password) async {
    try {
      await firebaseauth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        FirebaseFirestore.instance
            .collection('mentors')
            .doc(userId)
            .set(mentor);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> createMentor(dynamic data, email, password) async {
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
        StorageServices.to.setString(key: userId, value: data['id'].toString());

        signUpUsertoFirebase(data,
            StorageServices.to.getString(userId).toString(), email, password);

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
         StorageServices.to.setString(key: userId, value: data['id'].toString());
                 StorageServices.to.setString(key: userName, value: data['fullName'].toString());
        return GetMentorInfo.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Utils.snakbar(title: "Error", body: e.toString());
      throw Exception();
    }
  }

  //update mentor
  Future<void> updateMentor(dynamic data) async {
    var url = Uri.parse(
        'https://guided-by-culture-production.up.railway.app/api/mentors/${getMentorInfoFromJson(StorageServices.to.getString(getMentorInformationsss)).id}');
    var headers = {
      'Content-Type': 'application/json',
    };

    try {
      EasyLoading.show(status: "Updating Profile...");
      var response = await http.put(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // getmentorinformation(
        //     mentorEmail: getMentorInfoFromJson(
        //             StorageServices.to.getString(getMentorInformationsss))
        //         .email);
        Get.offAllNamed(Routes.NAVIGATION_BAR);
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

  Future<GetBestMentorModel> getBestMentor() async {
    try {
      final response = await http.get(Uri.parse(
          'https://guided-by-culture-production.up.railway.app/api/mentors/get-best-mentor/${getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).email}'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        Get.toNamed(Routes.MENTOR_MATCHED, arguments: data);
        return GetBestMentorModel.fromJson(data);
      } else {
        throw Exception('Failed to load mentor');
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  //search mentors
  Future<List<GetSearchedMentors>> searchMentors(
      {required String availablility,
      required String industry,
      required String search,
      required List skills}) async {
    List<GetSearchedMentors> listOfMentors = [];
    try {
      final response = await http.get(
        Uri.parse(
            'https://guided-by-culture-production.up.railway.app/api/mentors/get-mentors?availability=${availablility}&industry=${industry}&search=${search}&skills=${skills}'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var i in data) {
          listOfMentors.add(i);
        }
        return listOfMentors;
      } else {
        throw Exception('Failed to load mentors');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
