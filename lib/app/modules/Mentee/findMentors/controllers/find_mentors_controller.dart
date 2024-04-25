import 'package:get/get.dart';
import 'package:mentor_app/app/repositories/mentorRepo.dart';

import '../../../../models/mentor/getSearchedMentorsModel.dart';

class FindMentorsController extends GetxController {
    MentorRepository mentorRepository = MentorRepository();
  Future<dynamic> searchMentors(
      {required String availablility,
      required String industry,
      required String search,
      required List skills}) async {
    return mentorRepository.searchMentors(
        availablility: availablility,
        industry: industry,
        search: search,
        skills: skills);
  }
   var isIndusryOpen = false.obs;
  var selectedIndustries = "Information Technology (IT)".obs;
   var isSkillsOpen = false.obs;
   var searchQuery=''.obs;

  List<String> computerScienceSkills = [
    'Leadership',
    'Communication',
    'Team Collaboration',
    'Time Management',
    'Decision Making',
    'Project Management',
    "Networking strategies",
    "Presentation Skills",
    "Negotiation",
    "Adaptability",
    "Creativity",
    "Innovation",
    "Conflict Resolution",
    "Technical Proficiency",
    "Financial Literacy",
    "Marketing Strategy",
    "Sales Techniques",
    "Customer Service",
    "Data Analysis",
    "Entrepreneurship"
  ];
  RxList<String> selectedSkills = <String>[].obs;
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


}
