import 'package:get/get.dart';

import '../controllers/career_goals_controller.dart';

class CareerGoalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CareerGoalsController>(
      () => CareerGoalsController(),
    );
  }
}
