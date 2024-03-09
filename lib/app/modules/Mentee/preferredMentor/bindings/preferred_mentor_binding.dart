import 'package:get/get.dart';

import '../controllers/preferred_mentor_controller.dart';

class PreferredMentorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreferredMentorController>(
      () => PreferredMentorController(),
    );
  }
}
