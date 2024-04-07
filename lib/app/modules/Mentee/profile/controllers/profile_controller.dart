import 'package:get/get.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
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
  


  void onInit() {
    // TODO: implement onInit
    super.onInit();

   
  }
}
