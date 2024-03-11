import 'package:get/get.dart';

import '../controllers/mentor_intro_screen_controller.dart';

class MentorIntroScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentorIntroScreenController>(
      () => MentorIntroScreenController(),
    );
  }
}
