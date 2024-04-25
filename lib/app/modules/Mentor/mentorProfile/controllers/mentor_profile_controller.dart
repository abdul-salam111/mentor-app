import 'package:get/get.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/repositories/connectionsRepo.dart';
import 'package:mentor_app/app/repositories/mentorRepo.dart';

class MentorProfileController extends GetxController {
  ConnectionsRepository connectionsRepository = ConnectionsRepository();
  var requestSent = false.obs;
  Future<bool> sendConnectionRequest(recId, recName) async {
    return await connectionsRepository.sendConnectionRequest(recId, recName);
  }
   Future<bool> cancelMenteeRequestSentToMentors(connectionId) async {
    return await connectionsRepository.cancelMenteeRequestSentToMentors(connectionId);
  }
  MentorRepository mentorRepository=MentorRepository();
  Future<GetMentorInfo> getOthersMentorsProfile(String email){
   return mentorRepository.getOtherMentors(mentorEmail: email);
  }
}
