import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationController extends GetxController {
  var isOpen = false.obs;
  var isCertificateOpen = false.obs;
  var selectedSubject = "Select".obs;
  List<String> subjects = [
    'High School Diploma/GED',
    "Associate's Degree",
    "Bachelor's Degree",
    "Master's Degree",
    "Doctorate/Ph.D.",
    'Professional Certification',
    'Vocational/Trade School',
    'Some College/No Degree',
  ];
  // var selectedCertification = "Select".obs;
  // List<String> certifications = [
  //   'None',
  //   'App Development',
  //   'Data Structures',
  //   'Algorithms',
  //   'Web Development',
  //   'Machine Learning',
  //   'Database Management',
  //   'Cybersecurity',
  //   'Networking',
  //   'Operating Systems',
  //   'Cloud Computing',
  //   'Software Engineering',
  //   'Artificial Intelligence',
  // ];
  final certificationController=TextEditingController().obs;
}
