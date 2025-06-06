import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

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
    'In App Messaging',
    'Phone Call',
    'In App Video Calling',
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
    " Eastern Time Zone (EST)",
    "Central Time Zone (CST)",
    "Mountain Time Zone (MST)",
    "Pacific Time Zone (PST)"
  ];

  var selectedTimeZone = "Select".obs;

  List<String> durations = [
    '30 minutes',
    '45 minutes',
    '1 hour',
    '1.5 hour',
    '2 hours',
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

      // Create the model
      CreateMenteeRequestModel createMenteeModel = CreateMenteeRequestModel(
        fullName: signUpController.nameController.value.text.toString(),
        goals: careerGoalsController.selectedGoalsList.join(','),
        skills: skillsController.selectedSkills.join(','),
        education: educationController.selectedSubject.value,
        industry: preferredMentorController.selectedMentorshipstyle.value,
        mentorshipStyle:
            preferredMentorController.selectedMentorshipstyle.value,
        email: signUpController.emailController.value.text,
        gender: preferredMentorController.selectedGender.value,
        sessionDuration: selectedDuration.value,
        about: preferredMentorController.aboutMe.value.text.toString(),
        profilePicUrl: '',
        communicationChannels: selectedChannles.join(','),
        password: signUpController.passwordController.value.text.toString(),
        availableDays: availabilityList.join(','),
        timeZone: selectedTimeZone.value,
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
        String responseBody = await response.stream.bytesToString();
        CreateMenteeRequestModel createMenteeModel2 = CreateMenteeRequestModel(
          fullName: signUpController.nameController.value.text.toString(),
          goals: careerGoalsController.selectedGoalsList.join(','),
          skills: skillsController.selectedSkills.join(','),
          education: educationController.selectedSubject.value,
          industry: preferredMentorController.selectedMentorshipstyle.value,
          mentorshipStyle:
              preferredMentorController.selectedMentorshipstyle.value,
          email: "mentee${signUpController.emailController.value.text}",
          gender: preferredMentorController.selectedGender.value,
          sessionDuration: selectedDuration.value,
          about: preferredMentorController.aboutMe.value.text.toString(),
          profilePicUrl: '',
          communicationChannels: selectedChannles.join(','),
          password: signUpController.passwordController.value.text.toString(),
          availableDays: availabilityList.join(','),
          timeZone: selectedTimeZone.value,
        );
        // Decode the JSON response body

        var responseData = jsonDecode(responseBody);
        signUpUsertoFirebase(
            createMenteeModel2.toJson(), responseData['id'].toString());
        StorageServices.to
            .setString(key: userId, value: responseData['id'].toString());
        EasyLoading.dismiss();
        clearTextfields();
      } else {
        EasyLoading.dismiss();
        Utils.snakbar(
          title: "Failed!",
          body: "Failed to create Account!",
        );
      }
    } catch (e) {
      Utils.snakbar(
        title: "Failed",
        body: "Failed to create Account because! $e",
      );
      EasyLoading.dismiss();
    }
  }

  final firebaseauth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future signUpUsertoFirebase(var menteemodel, userId) async {
    try {
      await firebaseauth
          .createUserWithEmailAndPassword(
              email: "meentee${signUpController.emailController.value.text}",
              password:
                  signUpController.passwordController.value.text.toString())
          .then((user) async {
        await FirebaseFirestore.instance
            .collection('mentees')
            .doc(userId)
            .set(menteemodel);
        Utils.snakbar(
          title: "Account Created!",
          body: "Your account is created successfully!",
        );
        Get.offAndToNamed(Routes.CONGRATULATIONS);
      });
    } catch (e) {
      print(e);
    }
  }

  clearTextfields() {
    signUpController.nameController.value.clear();
    signUpController.emailController.value.clear();
    signUpController.passwordController.value.clear();
    careerGoalsController.selectedGoalsList.clear();
    skillsController.selectedSkills.clear();
    educationController.certificationController.value.text = "Select";
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
