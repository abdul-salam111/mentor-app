import 'package:get/get.dart';

class PreferredMentorController extends GetxController {
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

  RxString selectedGender = ''.obs;

  void setSelectedGender(String gender) {
    selectedGender.value = gender;
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

  RxString selectedGoal = 'Select Education'.obs;

  void setSelectedGoal(String goal) {
    selectedGoal.value = goal;
  }
}
