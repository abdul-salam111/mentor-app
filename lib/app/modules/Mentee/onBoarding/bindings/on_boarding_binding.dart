import 'package:get/get.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OnboardingController>(
     OnboardingController(),
    );
  }
}