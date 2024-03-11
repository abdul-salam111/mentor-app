import 'package:get/get.dart';

import '../controllers/inmeeting_screen_controller.dart';

class InmeetingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InmeetingScreenController>(
      () => InmeetingScreenController(),
    );
  }
}
