import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:mentor_app/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  final controller = Get.put(SignupController());
  var pageController = PageController();
  var currentIndex = 0.obs;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void goToNextPage() {
    if (currentIndex.value < 2) {
      currentIndex.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      if (controller.selectUserType.value == 'Mentee') {
        Get.toNamed(Routes.CAREER_GOALS);
      }
      else{
        Get.toNamed(Routes.CAREER_GOALS);
      }
    }
  }
}
