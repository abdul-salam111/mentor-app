import 'package:get/get.dart';

import '../controllers/mentee_connections_controller.dart';

class MenteeConnectionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenteeConnectionsController>(
      () => MenteeConnectionsController(),
    );
  }
}
