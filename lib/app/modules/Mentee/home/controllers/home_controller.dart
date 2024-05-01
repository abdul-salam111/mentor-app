import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/mentor/getSearchedMentorsModel.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';
import 'package:mentor_app/app/repositories/meetingsController.dart';
import 'package:mentor_app/app/repositories/mentorRepo.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class HomeController extends GetxController {
   var isIndusryOpen = false.obs;
  var selectedIndustries = "Information Technology (IT)".obs;
   var isSkillsOpen = false.obs;

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
  RxList<String> selectedSkills = <String>[].obs;
  List<String> industries = [
    'Information Technology (IT)',
    'Healthcare',
    'Finance',
    'Education',
    'Manufacturing',
    'Retail',
    'Hospitality',
    'Transportation',
    'Entertainment',
    'Agriculture',
    'Real Estate',
    'Construction',
    'Energy',
    'Telecommunications',
    'Media',
    'Automotive',
    'Aerospace',
    'Pharmaceutical',
    'Biotechnology',
    'Environmental',
    // Add more industries as needed
  ];


  MentorRepository mentorRepository = MentorRepository();
  Future<dynamic> searchMentors(
      {required String availablility,
      required String industry,
      required String search,
      required List skills}) async {
    return mentorRepository.searchMentors(
        availablility: availablility,
        industry: industry,
        search: search,
        skills: skills);
  }

  AuthRepository authRepository = AuthRepository();
  Future<void> logoutUser() async {
    EasyLoading.show(status: "Logging out");
    authRepository.logoutUser();
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

    MeetingRepository meetingRepository = MeetingRepository();
  Future fetchMenteeScheduledMeetings() async {
    return await meetingRepository.fetchMenteesMeetings();
  }

  Future cancelMeetingByMentee(meetingId, name) async {
    return await meetingRepository
        .cancelMeetingByMentee(meetingId, name)
        .then((value) {
      meetingRepository.fetchMenteesMeetings();
    });
  }
  Future fetchMentorScheduledMeetings() async {
    return await meetingRepository.fetchMentorsMeetings();
  }

  Future cancelMentorsMeetingsWithMentee(meetingId, name) async {
    return await meetingRepository
        .cancelMeetingByMentee(meetingId, name)
        .then((value) {
      meetingRepository.fetchMenteesMeetings();
    });
  }
}
