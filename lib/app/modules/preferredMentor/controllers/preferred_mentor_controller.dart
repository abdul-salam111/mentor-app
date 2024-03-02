import 'package:get/get.dart';

class PreferredMentorController extends GetxController {


  var isIndusryOpen=false.obs;
    RxList<String> selectedIndustries = <String>[].obs;
List<String> industries = [
  'Information Technology (IT)',
  'Healthcare',
  'Finance',
  'Education',
  'Manufacturing',
  'Retail',
  'Hospitality',
  'Transportation',
  'Entertainment',
  'Agriculture',
  'Real Estate',
  'Construction',
  'Energy',
  'Telecommunications',
  'Media',
  'Automotive',
  'Aerospace',
  'Pharmaceutical',
  'Biotechnology',
  'Environmental',
  // Add more industries as needed
];

   RxString selectedGender = ''.obs;

  void setSelectedGender(String gender) {
    selectedGender.value = gender;
  }
  var isOpen=false.obs;
  var isCertificateOpen=false.obs;
    RxList<String> selectedSkills = <String>[].obs;
  List<String> computerScienceSkills = [
    'Select Education',
    'App Development',
    'Data Structures',
    'Algorithms',
    'Web Development',
    'Machine Learning',
    'Database Management',
    'Cybersecurity',
    'Networking',
    'Operating Systems',
    'Cloud Computing',
    'Software Engineering',
    'Artificial Intelligence',
  ];

  RxString selectedGoal = 'Select Education'.obs;

  void setSelectedGoal(String goal) {
    selectedGoal.value = goal;
  }
}
