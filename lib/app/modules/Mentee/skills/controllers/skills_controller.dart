import 'package:get/get.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class SkillsController extends GetxController {
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
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if ((StorageServices.to.getbool("updateProfile") == true)) {
      selectedSkills.value = getMentorInfoFromJson(
              StorageServices.to.getString(getMentorInformationsss))
          .skills;
          
    }
  }
}
