import 'package:get/get.dart';

import '../controllers/meeting_details_controller.dart';

class MeetingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetingDetailsController>(
      () => MeetingDetailsController(),
    );
  }
}
