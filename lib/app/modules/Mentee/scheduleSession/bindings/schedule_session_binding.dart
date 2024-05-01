import 'package:get/get.dart';

import '../controllers/schedule_session_controller.dart';

class ScheduleSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ScheduleSessionController>(
      ScheduleSessionController(),
    );
  }
}
