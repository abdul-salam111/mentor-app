import 'package:get/get.dart';

import '../controllers/mentor_matched_controller.dart';

class MentorMatchedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentorMatchedController>(
      () => MentorMatchedController(),
    );
  }
}
