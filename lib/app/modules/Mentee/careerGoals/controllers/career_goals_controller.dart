import 'package:get/get.dart';


class CareerGoalsController extends GetxController {
  List<String> goalsList = [
    'Career Advancement',
    'Skill Development',
    'Industry Transition',
    'Entrepreneurship Guidance',
    'Networking Opportunities',
    'Leadership Development',
    'Work-Life Balance',
    'Personal Branding',
    'Confidence Building',
    'Job Search Support',
    // 'Workplace Communication',
    'Diversity and Inclusion Awareness',
    'Financial Planning and Management',
    'Professional Certification Guidance',
    // 'Workforce Adaptability Skills',
  ];
  RxList<String> selectedGoalsList = <String>[].obs;
 
}
