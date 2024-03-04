import 'package:get/get.dart';

class SkillsController extends GetxController {
  List<String> computerScienceSkills = [
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
  RxList<String> selectedSkills = <String>[].obs;
}
