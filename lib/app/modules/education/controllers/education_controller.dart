import 'package:get/get.dart';

class EducationController extends GetxController {
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
