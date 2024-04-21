import 'package:get/get.dart';
import 'package:mentor_app/app/models/connections/getMenteeConnections.dart';
import 'package:mentor_app/app/models/connections/getMentorConnections.dart';
import 'package:mentor_app/app/repositories/connectionsRepo.dart';

class MenteeConnectionsController extends GetxController {
  ConnectionsRepository connectionsRepository =ConnectionsRepository();
  Future<GetMenteeConnections> getMenteeConnections()async{
    return connectionsRepository.getMenteeConnections();
  }
  // Future<GetMentorConnections> denyMenteeRequest()async{
  //   return connectionsRepository.getMentorsconnections();
  // }
}
