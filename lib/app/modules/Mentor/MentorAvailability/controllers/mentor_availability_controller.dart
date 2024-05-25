import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/models/mentor/createMentorRequestModel.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/models/mentor/updateMentor.dart';
import 'package:mentor_app/app/modules/Mentee/careerGoals/controllers/career_goals_controller.dart';
import 'package:mentor_app/app/modules/Mentee/skills/controllers/skills_controller.dart';
import 'package:mentor_app/app/modules/Mentor/MentorEducationBackground/controllers/mentor_education_background_controller.dart';
import 'package:mentor_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:mentor_app/app/repositories/mentorRepo.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:http/http.dart' as http;

class MentorAvailabilityController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    if (StorageServices.to.getbool('updateProfile')) {
      availabilityList.value = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .availableDays;
      selectedGender.value = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .gender;
      selectedTimeZone.value = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .timeZone;
      selectedDuration.value = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .sessionDuration;
      selectedChannles.value = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .communicationChannels;
      selectedStatus.value = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .availabilityStatus;
    }
  }

  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  RxList<String> availabilityList = <String>[].obs;
  final List<String> timezones = [
    " Eastern Time Zone (ET)",
    "Central Time Zone (CT)"
        "Mountain Time Zone (MT)",
    "Pacific Time Zone (PT)"
  ];
  var selectedTimeZone = "Select".obs;
  var isOpen = false.obs;
  List<String> durations = [
    '30 minutes',
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
  RxList<String> selectedChannles = <String>[].obs;

  var isStatusOpen = false.obs;
  List<String> availablityStatus = [
    'Accepting new mentees',
    'currently at full capacity',
    'On Hiatus',
  ];
  var selectedStatus = 'Select'.obs;
  RxString selectedGender = ''.obs;

  void setSelectedGender(String gender) {
    selectedGender.value = gender;
  }

  final signupController = Get.put(SignupController());
  final eductioncontroller = Get.put(MentorEducationBackgroundController());
  MentorRepository mentorRepository = MentorRepository();
  final skillController = Get.put(SkillsController());
  final goalController = Get.put(CareerGoalsController());
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

  Future<void> signupMentor() async {
    try {
      EasyLoading.show(status: "Creating Profile...");

      // Create the model
      CreateMentorRequestModel creatementorModel = CreateMentorRequestModel(
        fullName: signupController.nameController.value.text.toString(),
        industry: eductioncontroller.selectedIndustries.value,
        mentorshipStyle: eductioncontroller.selectedMentorshipstyle.value,
        email: signupController.emailController.value.text.toString(),
        skills: skillController.selectedSkills.join(','),
        goals: goalController.selectedGoalsList.join(','),
        communicationChannels: communitcationChannels.join(','),
        availableDays: availabilityList.join(','),
        gender: selectedGender.value,
        sessionDuration: selectedDuration.value,
        about: eductioncontroller.aboutMe.value.text.toString(),
        profilePicUrl: 'profilePicUrl',
        profBackDescription:
            eductioncontroller.professionalBg.value.text.toString(),
        availabilityStatus: selectedStatus.value,
        password: signupController.passwordController.value.text.toString(),
        yearOfExperience:
            int.parse(eductioncontroller.yearsOfExperience.value.text),
        timeZone: selectedTimeZone.value,
      );

      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://guided-by-culture-production.up.railway.app/api/mentors/create"));

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
      creatementorModel.toJson().forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Send the request and await response
      var response = await request.send();

      // Check response status code
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();

        // Decode the JSON response body
        var responseData = jsonDecode(responseBody);
        signUpUsertoFirebase(
            creatementorModel.toJson(),
            responseData['id'].toString(),
            signupController.emailController.value.text.toString(),
            signupController.passwordController.value.text.toString());
        StorageServices.to
            .setString(key: userId, value: responseData['id'].toString());
        EasyLoading.dismiss();
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

  Future signUpUsertoFirebase(var mentor, userId, email, password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user)async {
        await FirebaseFirestore.instance
            .collection('mentors')
            .doc(userId)
            .set(mentor)
            .then((value) {
          Get.offAllNamed(Routes.CONGRATULATIONS);
          Utils.snakbar(
            title: "Account Created!",
            body: "Your account is created successfully!",
          );
        });
      });
    } catch (e) {
      print(e);
    }
  }

  MentorRepository mentorRepo = MentorRepository();
  Future<void> updateMentor() async {
    try {
      EasyLoading.show(status: "Updating profile...");

      // Create the model
      UpdateMentorRequestModel updatementor = UpdateMentorRequestModel(
        fullName: eductioncontroller.nameController.value.text.toString(),
        skills: skillController.selectedSkills.join(','),
        goals: goalController.selectedGoalsList.join(','),
        communicationChannels: communitcationChannels.join(','),
        availableDays: availabilityList.join(','),
        industry: eductioncontroller.selectedIndustries.value,
        mentorshipStyle: eductioncontroller.selectedMentorshipstyle.value,
        gender: selectedGender.value,
        sessionDuration: selectedDuration.value,
        about: eductioncontroller.aboutMe.value.text.toString(),
        profilePicUrl: 'profilePicUrl',
        profBackDescription:
            eductioncontroller.professionalBg.value.text.toString(),
        availabilityStatus: selectedStatus.value,
        yearOfExperience:
            int.parse(eductioncontroller.yearsOfExperience.value.text),
        timeZone: selectedTimeZone.value,
      );

      // Create a multipart request
      var request = http.MultipartRequest(
          'PUT',
          Uri.parse(
              "https://guided-by-culture-production.up.railway.app/api/mentors/${getMentorInfoFromJson(StorageServices.to.getString(getMentorInformationsss)).id}"));

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
      updatementor.toJson().forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Send the request and await response
      var response = await request.send();

      // Check response status code
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();

        // Decode the JSON response body
        var responseData = jsonDecode(responseBody);
        updateUserInFirebase(updatementor.toJson());
        var mentordata = await mentorRepository.getmentorinformation(
            mentorEmail: getMentorInfoFromJson(
                    StorageServices.to.getString(getMentorInformationsss))
                .email);

        await StorageServices.to.setString(
            key: getMentorInformationsss,
            value: getMentorInfoToJson(mentordata));
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

  Future updateUserInFirebase(mentordata) async {
    await FirebaseFirestore.instance
        .collection('mentors')
        .doc(getMentorInfoFromJson(
                StorageServices.to.getString(getMentorInformationsss))
            .id
            .toString())
        .update(mentordata);
  }
  // Future signupMentor() async {
  //   var data = CreateMentorRequestModel(
  //     communicationChannels: communitcationChannels,
  //     about: eductioncontroller.aboutMe.value.text.toString(),
  //     fullName: signupController.nameController.value.text.toString(),
  //     email: signupController.emailController.value.text.toString(),
  //     industry: eductioncontroller.selectedIndustries.value,
  //     mentorshipStyle: eductioncontroller.selectedMentorshipstyle.value,
  //     password: signupController.passwordController.value.text.toString(),
  //     availabilityStatus: selectedStatus.value,
  //     availableDays: availabilityList,
  //     professionalBackgroundDescription:
  //         eductioncontroller.professionalBg.value.text.toString(),
  //     sessionDuration: selectedDuration.value,
  //     timeZone: selectedTimeZone.value,
  //     skills: skillController.selectedSkills,
  //     yearsOfExperience:
  //         int.parse(eductioncontroller.yearsOfExperience.value.text),
  //     gender: selectedGender.value,
  //   );
  //   if (StorageServices.to.getbool('updateProfile')) {
  //     mentorRepository.updateMentor(UpdateMentorRequestMode(
  //             communicationChannels: communitcationChannels,
  //             about: eductioncontroller.aboutMe.value.text.toString(),
  //             fullName: signupController.nameController.value.text.toString(),
  //             email: signupController.emailController.value.text.toString(),
  //             industry: eductioncontroller.selectedIndustries.value,
  //             mentorshipStyle: eductioncontroller.selectedMentorshipstyle.value,
  //             availabilityStatus: selectedStatus.value,
  //             availableDays: availabilityList,
  //             professionalBackgroundDescription:
  //                 eductioncontroller.professionalBg.value.text.toString(),
  //             sessionDuration: selectedDuration.value,
  //             timeZone: selectedTimeZone.value,
  //             skills: skillController.selectedSkills,
  //             yearsOfExperience:
  //                 int.parse(eductioncontroller.yearsOfExperience.value.text),
  //             gender: selectedGender.value,
  //             isVerified: '',
  //             profilePicUrl: '')
  //         .toJson());
  //   } else {
  //     await mentorRepository
  //         .createMentor(
  //             data.toJson(),
  //             signupController.emailController.value.text.toString(),
  //             signupController.passwordController.value.text.toString())
  //         .then((value) {});
  //   }

  //   // eductioncontroller.aboutMe.value.clear();
  //   // signupController.nameController.value.clear();
  //   // signupController.emailController.value.clear();
  //   // signupController.passwordController.value.clear();
  //   // eductioncontroller.selectedIndustries.value = "Select";
  //   // eductioncontroller.selectedMentorshipstyle.value = "Select";
  //   // availabilityList.clear();
  //   // eductioncontroller.professionalBg.value.clear();
  //   // selectedDuration.value = "Select";
  //   // selectedTimeZone.value = "Select";
  //   // eductioncontroller.yearsOfExperience.value.clear();
  //   // selectedGender.value = "";
  // }
}
