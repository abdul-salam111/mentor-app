import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentor_app/app/models/createMenteeModel.dart';
import 'package:mentor_app/app/models/getMenteeInfo.dart';
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
      String selectedGoals =
          '"${careerGoalsController.selectedGoalsList.join(',')}"';
      String selectedSkills = '"${skillsController.selectedSkills.join(',')}"';
      String selectedChannels = '"${selectedChannles.join(',')}"';
      String availbility = '"${availabilityList.join(',')}"';

      CreateMenteeModel createMenteeModel = CreateMenteeModel(
        goals: selectedGoals,
        skills: selectedSkills,
        education: educationController.selectedSubject.value,
        industry: preferredMentorController.selectedIndustries.value,
        mentorshipStyle:
            preferredMentorController.selectedMentorshipstyle.value,
        email: signUpController.emailController.value.text,
        gender: preferredMentorController.selectedGender.value,
        sessionDuration: selectedDuration.value,
        about: preferredMentorController.aboutMe.value.text,
        communicationChannels: selectedChannels,
        password: signUpController.passwordController.value.text,
        availableDays: availbility,
        timeZone: selectedTimeZone.value,
      );
      isLoading = true.obs;
      var request = http.MultipartRequest('POST', Uri.parse(createMenteeUrl));
      var profilePicStream = http.ByteStream(imageFile.value!.openRead());
      var profilePicLength = await imageFile.value!.length();
      var profilePicMultipartFile = http.MultipartFile(
        'profilePicUrl',
        profilePicStream,
        profilePicLength,
        filename: imageFile.value!.path.split('/').last,
      );
      request.files.add(profilePicMultipartFile);
      createMenteeModel.toJson().forEach((key, value) {
        request.fields[key] = value;
      });
      var response = await request.send();
      

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
       
        Get.offAndToNamed(Routes.CONGRATULATIONS);
        Utils.snakbar(
            title: "Account Created!",
            body: "Your account is created Successfull!");
      } else {
      //  var data=getMenteeModelFromJson(StorageServices.to.getString(getmenteeinfo));
      
      
        EasyLoading.dismiss();
        Utils.snakbar(
            title: "Failed!", body: "Failed to create Account!");
      }
    } catch (e) {
      // Handle any errors that occur during the process
      Utils.snakbar(title: "Failed", body: "Failed to create Account becuase! $e");
      EasyLoading.dismiss(); // Dismiss loading indicator if it's still shown
    }
  }
}
