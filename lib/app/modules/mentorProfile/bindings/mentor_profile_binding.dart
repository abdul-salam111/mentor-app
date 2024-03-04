import 'package:get/get.dart';

import '../controllers/mentor_profile_controller.dart';

class MentorProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentorProfileController>(
      () => MentorProfileController(),
    );
  }
}
