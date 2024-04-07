import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentor_app/app/models/authModels/createMenteeModel.dart';
import 'package:mentor_app/app/modules/Mentee/careerGoals/controllers/career_goals_controller.dart';
import 'package:mentor_app/app/modules/Mentee/education/controllers/education_controller.dart';
import 'package:mentor_app/app/modules/Mentee/preferredMentor/controllers/preferred_mentor_controller.dart';
import 'package:mentor_app/app/modules/Mentee/skills/controllers/skills_controller.dart';
import 'package:mentor_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:mentor_app/app/resources/apiKeys.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

import '../../../../Utils/Utils.dart';

class AvailbilityController extends GetxController {
  var careerGoalsController = Get.put(CareerGoalsController());
  var skillsController = Get.put(SkillsController());
  var educationController = Get.put(EducationController());
  var preferredMentorController = Get.put(PreferredMentorController());
  var signUpController = Get.put(SignupController());

  RxList<String> availabilityList = <String>[].obs;
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

  Future<void> createMentee() async {
  try {
    EasyLoading.show(status: "Creating Profile...");

    // Gather data from controllers and other sources
    String fullName = signUpController.nameController.value.text.toString();
    List<String> goals = careerGoalsController.selectedGoalsList;
    List<String> skills = skillsController.selectedSkills;
    String education = educationController.selectedSubject.value;
    String industry = preferredMentorController.selectedIndustries.value;
    String mentorshipStyle = preferredMentorController.selectedMentorshipstyle.value;
    String email = signUpController.emailController.value.text;
    String gender = preferredMentorController.selectedGender.value;
    String sessionDuration = selectedDuration.value;
    String about = preferredMentorController.aboutMe.value.text.toString();
    List<String> communicationChannels = selectedChannles;
    String password = signUpController.passwordController.value.text;
    List<String> availableDays = availabilityList;
    String timeZone = selectedTimeZone.value;

    // Create the model
    CreateMenteeRequestModel createMenteeModel = CreateMenteeRequestModel(
      fullName: fullName,
      goals: goals,
      skills: skills,
      education: education,
      industry: industry,
      mentorshipStyle: mentorshipStyle,
      email: email,
      gender: gender,
      sessionDuration: sessionDuration,
      about: about,
      communicationChannels: communicationChannels,
      password: password,
      availableDays: availableDays,
      timeZone: timeZone,
    );

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(createMenteeUrl));

    // Add profile picture file to the request
    var profilePicStream = http.ByteStream(imageFile.value!.openRead());
    var profilePicLength = await imageFile.value!.length();
    var profilePicMultipartFile = http.MultipartFile(
      'profilePicUrl',
      profilePicStream,
      profilePicLength,
      filename: imageFile.value!.path.split('/').last,
    );
    request.files.add(profilePicMultipartFile);

    // Add form fields from the model
    createMenteeModel.toJson().forEach((key, value) {
      request.fields[key] = value.toString();
    });

    // Send the request and await response
    var response = await request.send();

    // Check response status code
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      clearTextfields();
      Get.offAndToNamed(Routes.CONGRATULATIONS);
      Utils.snakbar(
        title: "Account Created!",
        body: "Your account is created successfully!",
      );
    } else {
      EasyLoading.dismiss();
      Utils.snakbar(
        title: "Failed!",
        body: "Failed to create Account!",
      );
    }
  } catch (e) {
    print(e);
    Utils.snakbar(
      title: "Failed",
      body: "Failed to create Account because! $e",
    );
    EasyLoading.dismiss();
  }
}

  clearTextfields() {
    signUpController.nameController.value.clear();
    signUpController.emailController.value.clear();
    signUpController.passwordController.value.clear();
    careerGoalsController.selectedGoalsList.clear();
    skillsController.selectedSkills.clear();
    educationController.selectedCertification.value = "Select";
    educationController.selectedSubject.value = "Select";
    preferredMentorController.aboutMe.value.clear();
    preferredMentorController.selectedGender.value = "";
    preferredMentorController.selectedIndustries.value = "Select";
    preferredMentorController.selectedMentorshipstyle.value = "Select";
    imageFile.value = null;
    selectedChannles.clear();
    selectedDuration.value = "Select";
    selectedTimeZone.value = "Select";
    availabilityList.clear();
  }
}
