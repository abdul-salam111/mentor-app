import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/modules/Mentee/onBoarding/views/screens.dart';

import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/images.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnboardingController> {
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: [
          OnboardingPage(
              "Goals and Expectations",
              "Lorem ipsum dolor sit amet consectetur. Congue massa ullamcorper in non diam quis leo diam. Elit non proin lectus eget at nunc nibh sit arcu. Lectus ut ut mauris nullam. Sed.",
              introimage1,
              "Next",
              "1/3"),
         
          OnboardingPage(
              "Mentor Matching",
              "Lorem ipsum dolor sit amet consectetur. Congue massa ullamcorper in non diam quis leo diam. Elit non proin lectus eget at nunc nibh sit arcu. Lectus ut ut mauris nullam. Sed.",
              introimage2,
              "Complete Profile",
              "2/3"),
           OnboardingPage(
              "Mentor Matching",
              "Lorem ipsum dolor sit amet consectetur. Congue massa ullamcorper in non diam quis leo diam. Elit non proin lectus eget at nunc nibh sit arcu. Lectus ut ut mauris nullam. Sed.",
              introimage1,
              "Next",
              "3/3"),
        ],
      ),
    );
  }
}