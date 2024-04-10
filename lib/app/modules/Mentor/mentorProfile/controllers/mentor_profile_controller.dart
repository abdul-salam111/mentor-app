import 'package:get/get.dart';
import 'package:mentor_app/app/repositories/connectionsRepo.dart';

class MentorProfileController extends GetxController {
  ConnectionsRepository connectionsRepository=ConnectionsRepository();
  var requestSent=false.obs;
  Future<bool> createRequest(recId,recName)async{
return await connectionsRepository.createConnection(recId,recName);
  }
}
