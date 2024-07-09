import 'package:get/get.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class SkillsController extends GetxController {
  List<String> computerScienceSkills = [
   'Communication Skills',
  'Leadership Skills',
  'Time Management',
  'Problem-Solving Abilities',
  'Decision-Making Skills',
  'Emotional Intelligence',
  'Adaptability',
  'Collaboration and Teamwork',
  'Critical Thinking',
  'Creativity and Innovation',
  'Networking Skills',
  'Presentation Skills',
  'Conflict Resolution Skills',
  'Project Management Skills',
  'Technical Skills (e.g., coding, data analysis, graphic design)',
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
