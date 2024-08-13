import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

import '../../../../models/mentor/getMentorInfor.dart';

class MentorEducationBackgroundController extends GetxController {
  final nameController = TextEditingController().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (StorageServices.to.getbool('updateProfile')) {
      aboutMe.value.text = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .about;
      professionalBg.value.text = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .professionalBackgroundDescription;
      selectedIndustries.value = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .industry;
      selectedMentorshipstyle.value = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .mentorshipStyle;
      yearsOfExperience.value.text = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .yearsOfExperience
          .toString();
      nameController.value.text = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .fullName
          .toString();
    }
  }

  var ismentorshipOpen = false.obs;

  var selectedMentorshipstyle = "Select".obs;
  List<String> mentorshipstyles = [
    "Traditional Mentorship",
    "Situational Mentorship",
    "Peer Mentorship",
    "Entrepreneurial Mentorship",
    "Life-Stage Mentorship"
  ];
  List<String> mentorshipImages = [
    "assets/icons/traditional.jpg",
    "assets/icons/Situational Mentorship icons.png",
    "assets/icons/Peer Mentorship .png",
    "assets/icons/Peer Mentorship .png",
    "assets/icons/Life-Stage Mentorship.png"
  ];

  RxList<String> availabilityList = <String>[].obs;
  final aboutMe = TextEditingController().obs;
  final professionalBg = TextEditingController().obs;
  var isOpen = false.obs;
  var isDurationOpen = false.obs;

  List<String> communitcationChannels = [
    'In App Messaging',
    'In App Video Calling',
    'Phone Call'
  ];
  List<String> selectedChannles = <String>[].obs;

  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  final List<String> timezones = [
    'UTC',
    'America/New_York',
    'America/Los_Angeles',
    'Europe/London',
    'Europe/Paris',
    'Asia/Tokyo',
    'Australia/Sydney',
    'Pacific/Honolulu',
    'America/Chicago',
    'America/Denver',
    'America/Phoenix',
    'America/Anchorage',
    'Europe/Berlin',
    'Asia/Shanghai',
    'Asia/Dubai',
    'Australia/Melbourne',
    'Africa/Johannesburg',
    'Pacific/Auckland',
    'Asia/Kolkata',
    'Europe/Moscow',
  ];
  var selectedTimeZone = "Select".obs;
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

  var isLoading = false.obs;
  var selectedDuration = 'Select'.obs;

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

  final yearsOfExperience = TextEditingController().obs;
  final sessionHourlyRate = TextEditingController().obs;
  var isIndusryOpen = false.obs;
  var selectedIndustries = "Select".obs;
  List<String> industries = [
    "Information Technology (IT)",
    "Healthcare",
    "Entrepreneurship",
    "Marketing and Advertising",
    "Biotechnology and Pharmaceuticals",
    "Nonprofit and Social Services",
    "Engineering",
    "Finance and Banking",
    // "Education Development",
    // "Real Estate",
    // "Entertainment and Media",
    // "Legal Services",
    // "Consulting",
    // "Environmental Services",
    // "Transportation and Logistics",
    // "Fashion and Apparel",
    // "Architecture and Design",
    // "Government and Public Administration",
    // "Human Resources",
    // "Insurance"
  ];
}
