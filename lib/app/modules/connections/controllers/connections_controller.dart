import 'package:get/get.dart';
import 'package:mentor_app/app/repositories/connectionsRepo.dart';

class ConnectionsController extends GetxController {
  ConnectionsRepository connectionsRepository = ConnectionsRepository();
  Future acceptConnections(recId) async {
    return connectionsRepository.acceptConnectionRequest(recId);
  }

  Future<bool> cancelMenteeRequestSentToMentors(connectionId) async {
    return connectionsRepository.cancelMenteeRequestSentToMentors(connectionId);
  }

  Future getMentorRecievedRequest() async {
    return connectionsRepository.getMentorRecievedConnectionRequest();
  }

  Future getMentorAcceptedConnections() async {
    return connectionsRepository.getMentorsAcceptedConnections();
  }
    Future deleteAcceptedMentorRequest(connectionId) async {
    return connectionsRepository.deleteAcceptedRequestSentByMentee(connectionId);
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
}
