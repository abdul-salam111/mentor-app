import 'package:get/get.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/repositories/mentorRepo.dart';

class MentorProfileInformationController extends GetxController {
 MentorRepository mentorRepository=MentorRepository();
  Future<GetMentorInfo> getOthersMentorsProfile(String email){
   return mentorRepository.getOtherMentors(mentorEmail: email);
  }
}
