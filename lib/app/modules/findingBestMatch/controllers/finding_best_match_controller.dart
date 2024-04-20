import 'package:get/get.dart';
import 'package:mentor_app/app/repositories/mentorRepo.dart';

class FindingBestMatchController extends GetxController {

  MentorRepository mentorRepository = MentorRepository();
  Future findingBestMentor() async {
    mentorRepository.getBestMentor();
  }
}
