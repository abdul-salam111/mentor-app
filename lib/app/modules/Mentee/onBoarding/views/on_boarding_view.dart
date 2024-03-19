import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/modules/Mentee/onBoarding/views/screens.dart';
import 'package:mentor_app/app/modules/signup/controllers/signup_controller.dart';

import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/images.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnboardingController> {
  final OnboardingController controller = Get.put(OnboardingController());
final signupcontroller=Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: [
          OnboardingPage(
              signupcontroller.selectUserType.value=='Mentee'?'Goals and Expectations':'verification process',
              "Lorem ipsum dolor sit amet consectetur. Congue massa ullamcorper in non diam quis leo diam. Elit non proin lectus eget at nunc nibh sit arcu. Lectus ut ut mauris nullam. Sed.",
              introimage1,
              "Next",
              "1/3"),
         
          OnboardingPage(
              signupcontroller.selectUserType.value=='Mentee'?  "Mentor Matching":"Connects mission",
              "Lorem ipsum dolor sit amet consectetur. Congue massa ullamcorper in non diam quis leo diam. Elit non proin lectus eget at nunc nibh sit arcu. Lectus ut ut mauris nullam. Sed.",
              introimage2,
              signupcontroller.selectUserType.value=='Mentee'? "Complete Profile":"Get Started",
              "2/3"),
           OnboardingPage(
              signupcontroller.selectUserType.value=='Mentee'? "Mentor Matching": "Mentee Matching",
              "Lorem ipsum dolor sit amet consectetur. Congue massa ullamcorper in non diam quis leo diam. Elit non proin lectus eget at nunc nibh sit arcu. Lectus ut ut mauris nullam. Sed.",
              introimage1,
              "Next",
              "3/3"),
        ],
      ),
    );
  }
}