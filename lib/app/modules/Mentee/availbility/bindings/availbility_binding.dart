import 'package:get/get.dart';

import '../controllers/availbility_controller.dart';

class AvailbilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AvailbilityController>(
      () => AvailbilityController(),
    );
  }
}
