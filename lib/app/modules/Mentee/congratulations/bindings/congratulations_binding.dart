import 'package:get/get.dart';

import '../controllers/congratulations_controller.dart';

class CongratulationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CongratulationsController>(
      () => CongratulationsController(),
    );
  }
}
