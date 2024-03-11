import 'package:get/get.dart';

class CareerGoalsController extends GetxController {
  List<String> goalsList = [
    'Become a software engineer',
    'Learn web development',
    'Master data science',
    'Become proficient in mobile app development',
    'Get certified in cybersecurity',
    'Learn machine learning and AI',
    'Become an expert in cloud computing',
    'Master database management',
    'Learn networking fundamentals',
    'Specialize in operating systems',
    'Become proficient in game development',
    'Explore robotics and automation',
  ];
  RxList<String> selectedGoalsList = <String>[].obs;
}
