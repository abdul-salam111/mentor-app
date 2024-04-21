import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/authModels/updateMenteeProfile.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

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
    'App messaging',
    'Video Call',
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
final aboutMe=TextEditingController(text:getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).about ).obs;
  

  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedSkills.value =getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
            .skills.map((string) => string.replaceAll('"', '')).toList();
      availabilityList.value=  getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
            .availableDays.map((string) => string.replaceAll('"', '')).toList();
    selectedDuration.value=getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).sessionDuration;
  selectedChannles.value=getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
            .communicationChannels;
            
  }
   var isSkillsOpen = false.obs;
  AuthRepository authRepository=AuthRepository();
  Future updateMentee()async{
    authRepository.updateMentee(UpdateMenteeProfile(
      skills: selectedSkills.where((skill) => skill != null).cast<String>().toList(),
      communicationChannels: selectedChannles.where((selectedChannles) => selectedChannles != null).cast<String>().toList(),
      about:getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).about ,
      email: getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).email,
      availableDays: availabilityList.where((availabilityList) => availabilityList != null).cast<String>().toList(),
      education: getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).education,
      fullName: getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).fullName??"UserName",
      gender: getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).gender,
      goals: getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).goals,
      industry: getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).industry,
      mentorshipStyle: getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).mentorshipStyle,
      sessionDuration: selectedDuration.value,
      timeZone: getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).timeZone,
    
    ).toJson());
  }
}
