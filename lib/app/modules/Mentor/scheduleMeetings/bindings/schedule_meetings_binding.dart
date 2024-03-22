import 'package:get/get.dart';

import '../controllers/schedule_meetings_controller.dart';

class ScheduleMeetingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleMeetingsController>(
      () => ScheduleMeetingsController(),
    );
  }
}
