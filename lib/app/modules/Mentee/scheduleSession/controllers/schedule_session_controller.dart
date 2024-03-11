import 'package:get/get.dart';

class ScheduleSessionController extends GetxController {
  var isOpen=false.obs;
  var isCertificateOpen=false.obs;
    RxList<String> selectedSkills = <String>[].obs;
    var selectedIndex=0.obs;
    var selectedIndexOfTime=0.obs;
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

}
