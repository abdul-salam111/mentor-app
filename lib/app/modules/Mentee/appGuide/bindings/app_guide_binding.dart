import 'package:get/get.dart';

import '../controllers/app_guide_controller.dart';

class AppGuideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppGuideController>(
      () => AppGuideController(),
    );
  }
}
