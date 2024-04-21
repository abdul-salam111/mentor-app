import 'package:get/get.dart';

class ChatsController extends GetxController {
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
