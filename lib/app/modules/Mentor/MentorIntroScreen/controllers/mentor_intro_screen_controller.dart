import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/routes/app_pages.dart';

class MentorIntroScreenController extends GetxController {
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
      Get.toNamed(Routes.CAREER_GOALS);
    }
  }
  final emailcontroller=TextEditingController().obs;
}
