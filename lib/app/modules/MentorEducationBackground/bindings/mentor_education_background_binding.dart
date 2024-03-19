import 'package:get/get.dart';

import '../controllers/mentor_education_background_controller.dart';

class MentorEducationBackgroundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentorEducationBackgroundController>(
      () => MentorEducationBackgroundController(),
    );
  }
}
