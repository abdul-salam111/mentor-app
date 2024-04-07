import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mentor_app/app/models/mentor/createMentorRequestModel.dart';
import 'package:mentor_app/app/modules/Mentee/skills/controllers/skills_controller.dart';
import 'package:mentor_app/app/modules/Mentor/MentorEducationBackground/controllers/mentor_education_background_controller.dart';
import 'package:mentor_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:mentor_app/app/repositories/mentorRepo.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class MentorAvailabilityController extends GetxController {
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
  var isOpen = false.obs;
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
  List<String> selectedChannles = <String>[].obs;

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

  Future signupMentor() async {
    await mentorRepository
        .createMentor(CreateMentorRequestModel(
      communicationChannels: communitcationChannels,
      about: eductioncontroller.aboutMe.value.text.toString(),
      fullName: signupController.nameController.value.text.toString(),
      email: signupController.emailController.value.text.toString(),
      industry: eductioncontroller.selectedIndustries.value,
      mentorshipStyle: eductioncontroller.selectedMentorshipstyle.value,
      password: signupController.passwordController.value.text.toString(),
      availabilityStatus: selectedStatus.value,
      availableDays: availabilityList,
      professionalBackgroundDescription:
          eductioncontroller.professionalBg.value.text.toString(),
      sessionDuration: selectedDuration.value,
      timeZone: selectedTimeZone.value,
      skills: skillController.selectedSkills,
      yearsOfExperience:
          int.parse(eductioncontroller.yearsOfExperience.value.text),
      gender: selectedGender.value,
    ).toJson())
        .then((value) {
      StorageServices.to.setString(
          key: selectedUserType, value: signupController.selectUserType.value);
      eductioncontroller.aboutMe.value.clear();
      signupController.nameController.value.clear();
      signupController.emailController.value.clear();
      signupController.passwordController.value.clear();
      eductioncontroller.selectedIndustries.value = "Select";
      eductioncontroller.selectedMentorshipstyle.value = "Select";
      availabilityList.clear();
      eductioncontroller.professionalBg.value.clear();
      selectedDuration.value = "Select";
      selectedTimeZone.value = "Select";
      eductioncontroller.yearsOfExperience.value.clear();
      selectedGender.value = "";
    });
  }
}
