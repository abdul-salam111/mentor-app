import 'package:get/get.dart';

import '../controllers/mentor_availability_controller.dart';

class MentorAvailabilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentorAvailabilityController>(
      () => MentorAvailabilityController(),
    );
  }
}
