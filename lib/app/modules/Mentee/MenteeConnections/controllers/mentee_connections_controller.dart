import 'package:get/get.dart';
import 'package:mentor_app/app/repositories/connectionsRepo.dart';

class MenteeConnectionsController extends GetxController {
  ConnectionsRepository connectionsRepository = ConnectionsRepository();
  Future getMenteesrequestSendToMentors() async {
    return connectionsRepository.getMenteeSendRequests();
  }

  Future getMenteesAccpetedConnectionsByMentors() async {
    return connectionsRepository.getMenteesAcceptedConnections();
  }

  Future cancelRequestSentByMenteeToMentor(connectionId) async {
    return connectionsRepository.cancelMenteeRequestSentToMentors(connectionId);
  }

  var index = 0.obs;
      String chatRoomId({
    required String recieverId,
    required String senderId,
  }) {
    if (recieverId[0].toLowerCase().codeUnits[0] >
        senderId[0].toLowerCase().codeUnits[0]) {
      return "$recieverId$senderId";
    } else {
      return "$senderId$recieverId";
    }
  }

  Future deleteAcceptedRequestByMentorsandSentByMentee(connectionId)async{
    return connectionsRepository.deletedAcceptedRequestByMentorsSendByMentee(connectionId);
  }
}
