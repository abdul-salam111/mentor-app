import 'package:get/get.dart';
import 'package:mentor_app/app/models/connections/getMentorConnections.dart';
import 'package:mentor_app/app/repositories/connectionsRepo.dart';

class ConnectionsController extends GetxController {
  ConnectionsRepository connectionsRepository =ConnectionsRepository();
  Future<GetMentorConnections> getMentorConnections()async{
    return connectionsRepository.getMentorsconnections();
  }
  Future<GetMentorConnections> denyMenteeRequest()async{
    return connectionsRepository.getMentorsconnections();
  }

}
