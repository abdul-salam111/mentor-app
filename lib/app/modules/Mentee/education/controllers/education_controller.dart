import 'package:get/get.dart';

class EducationController extends GetxController {
  var isOpen = false.obs;
  var isCertificateOpen = false.obs;
  var selectedSubject = "Select".obs;
  List<String> subjects = [
   
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
  var selectedCertification = "Select".obs;
  List<String> certifications = [
    'None',
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
