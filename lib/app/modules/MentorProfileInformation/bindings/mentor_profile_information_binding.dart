import 'package:get/get.dart';

import '../controllers/mentor_profile_information_controller.dart';

class MentorProfileInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MentorProfileInformationController>(
      () => MentorProfileInformationController(),
    );
  }
}
