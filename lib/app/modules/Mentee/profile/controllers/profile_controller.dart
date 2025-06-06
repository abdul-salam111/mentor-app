import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/authModels/updateMenteeProfile.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';
import 'package:mentor_app/app/repositories/mentorRepo.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  RxList<String?> availabilityList = RxList<String?>();
  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  List<String> durations = [
    '1 hour',
    '1 hour 30 minutes',
    '2 hours',
    '2 hours 30 minutes',
    '3 hours',
    '3 hours 30 minutes',
    '4 hours',
    '4 hours 30 minutes',
    '5 hours',
    '5 hours 30 minutes',
    '6 hours',
  ];
  var selectedDuration = 'Select'.obs;
  var isDurationOpen = false.obs;
  List<String> communitcationChannels = [
    'In App Messaging',
    'In App Video Calling',
    'Phone Call'
  ];
  RxList<String?> selectedChannles = RxList<String?>();

  List<String> computerScienceSkills = [
    'Leadership',
    'Communication',
    'Team Collaboration',
    'Time Management',
    'Decision Making',
    'Project Management',
    "Networking strategies",
    "Presentation Skills",
    "Negotiation",
    "Adaptability",
    "Creativity",
    "Innovation",
    "Conflict Resolution",
    "Technical Proficiency",
    "Financial Literacy",
    "Marketing Strategy",
    "Sales Techniques",
    "Customer Service",
    "Data Analysis",
    "Entrepreneurship"
  ];
  RxList<String?> selectedSkills = RxList<String?>();
  final aboutMe = TextEditingController(
          text:
              getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                  .about)
      .obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController.value.text =
        getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
            .fullName;
    selectedSkills.value =
        getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
            .skills
            .map((string) => string.replaceAll('"', ''))
            .toList();
    availabilityList.value =
        getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
            .availableDays
            .map((string) => string.replaceAll('"', ''))
            .toList();
    selectedDuration.value =
        getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
            .sessionDuration;
    selectedChannles.value =
        getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
            .communicationChannels;
  }

  var isSkillsOpen = false.obs;
  Rx<XFile?> imageFile = Rx<XFile?>(null);
  Future<void> pickImage() async {
    try {
      final imagePicker = ImagePicker();
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imageFile.value = pickedFile;
      }
    } catch (e) {
      // Handle image picker errors
      print('Error picking image: $e');
    }
  }

  final nameController = TextEditingController().obs;
  MentorRepository mentorRepo = MentorRepository();
  AuthRepository authRepository = AuthRepository();
  Future<void> updateMentee() async {
    try {
      print('::: 1');
      EasyLoading.show(status: "Updating profile...");

      // Create the model
      UpdateMenteeProfile updatementee = UpdateMenteeProfile(
        fullName: nameController.value.text.isNotEmpty
            ? nameController.value.text
            : getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                .fullName,
        skills: selectedSkills.join(','),
        goals:
            getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                .goals
                .join(','),
        communicationChannels: selectedChannles.join(','),
        availableDays: availabilityList.join(','),
        menteeId: int.parse(StorageServices.to.getString(userId)),
        industry:
            getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                .industry,
        mentorshipStyle:
            getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                .mentorshipStyle,
        profilePicUrl: imageFile.value != null ? 'profile pic' : '',
        gender:
            getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                .gender,
        sessionDuration: selectedDuration.value,
        about: aboutMe.value.text.isNotEmpty
            ? aboutMe.value.text
            : getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                .about,
        timeZone:
            getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                .timeZone,
      );

      print('::: 2');

      // Create a multipart request
      var request = http.MultipartRequest(
        'PUT',

        // Uri.parse("https://guided-by-culture-production.up.railway.app/api/mentee/update/1"),
        Uri.parse(
            "https://guided-by-culture-production.up.railway.app/api/mentee/update/${StorageServices.to.getString(userId)}"),
      );

      print('::: 3');

      // Add profile picture file to the request if selected
      if (imageFile.value != null) {
        print('::: 4');

        var profilePicStream = http.ByteStream(imageFile.value!.openRead());
        var profilePicLength = await imageFile.value!.length();
        var profilePicMultipartFile = http.MultipartFile(
          'profilePicUrl',
          profilePicStream,
          profilePicLength,
          filename: imageFile.value!.path.split('/').last,
        );
        request.files.add(profilePicMultipartFile);
        print('::: 5');
      }

      // Add form fields from the model
      updatementee.toJson().forEach((key, value) {
        print('::: 6');
        if (value != null) {
          request.fields[key] = value.toString();
        }else{
          print(';::: $key is $value');
        }
      });

      print('::: 7');
      print('::: request fields: ${request.fields}');
      print('::: request files: ${request.files}');

      // Send the request and await response
      var response = await request.send();
      print('::: 8');

      // Handle the response
      String responseBody = await response.stream.bytesToString();
      print('::: response status code ${response.statusCode}');
      print('::: response body $responseBody');
      print('::: response request ${response.request}');

      if (response.statusCode == 200) {
        var responseData = jsonDecode(responseBody);

        // Update Firebase user data
        updateUserInFirebase(updatementee.toJson());

        // Fetch updated mentee data
        var data = await authRepository.getMenteeData(
          email:
              getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                  .email,
        );

        // Reset imageFile value and update storage
        imageFile.value = null;
        await StorageServices.to.setString(
          key: getmenteeinfo,
          value: getMenteeInfoToJson(data),
        );

        EasyLoading.dismiss();
        Get.offAllNamed(Routes.NAVIGATION_BAR);
        StorageServices.to.remove('updateProfile');

        Utils.snakbar(
          title: "Account updated!",
          body: "Your account is updated successfully!",
        );
      } else {
        EasyLoading.dismiss();
        Utils.snakbar(
          title: "Failed!",
          body: "Failed to update Account!",
        );
      }
    } catch (e) {
      EasyLoading.dismiss();
      Utils.snakbar(
        title: "Failed",
        body: "Failed to update Account because: $e",
      );
    }
  }

  Future updateUserInFirebase(mentordata) async {
    await FirebaseFirestore.instance
        .collection('mentees')
        .doc(getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
            .id
            .toString())
        .update(mentordata);
  }
}
