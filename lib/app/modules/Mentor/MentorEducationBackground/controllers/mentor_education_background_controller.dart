import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MentorEducationBackgroundController extends GetxController {

  var ismentorshipOpen = false.obs;

  var selectedMentorshipstyle = "Select".obs;
  List<String> mentorshipstyles = [
    "Traditional Mentorship",
    "Situational Mentorship",
    "Peer Mentorship",
    "Entrepreneurial Mentorship",
    "Life-Stage Mentorship"
  ];

   RxList<String> availabilityList = <String>[].obs;
   final aboutMe=TextEditingController().obs;
   final professionalBg=TextEditingController().obs;
  var isOpen = false.obs;
  var isDurationOpen = false.obs;

  List<String> communitcationChannels = [
    'App messaging',
    'Video Call',
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
  final yearsOfExperience=TextEditingController().obs;
  var isIndusryOpen = false.obs;
  var selectedIndustries = "Select".obs;
  List<String> industries = [
    "Information Technology (IT)",
    "Healthcare",
    "Finance and Banking",
    "Marketing and Advertising",
    "Education Development",
    "Entrepreneurship",
    "Engineering",
    "Real Estate",
    "Nonprofit and Social Services",
    "Entertainment and Media",
    "Legal Services",
    "Consulting",
    "Biotechnology and Pharmaceuticals",
    "Environmental Services",
    "Transportation and Logistics",
    "Fashion and Apparel",
    "Architecture and Design",
    "Government and Public Administration",
    "Human Resources",
    "Insurance"
  ];

  
}
