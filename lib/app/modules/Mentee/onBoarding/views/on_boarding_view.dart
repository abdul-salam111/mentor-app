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
              signupcontroller.selectUserType.value=='Mentee'?'Goals and Expectations':'The Mission',
              signupcontroller.selectUserType.value=='Mentee'? "Lorem ipsum dolor sit amet consectetur. Congue massa ullamcorper in non diam quis leo diam. Elit non proin lectus eget at nunc nibh sit arcu. Lectus ut ut mauris nullam. Sed.":"Our mission is simple: We are empowering individuals from underrepresented communities by facilitating connections between industry professionals (mentors) and aspiring individuals (mentees), to foster mentorship, guidance, and career opportunities",
              introimage1,
              "Next",
              
              "1/3",10),
         
          OnboardingPage(
              signupcontroller.selectUserType.value=='Mentee'?  "Mentor Matching":"Connect. Cultivate. \nElevate.",
              signupcontroller.selectUserType.value=='Mentee'?  "Lorem ipsum dolor sit amet consectetur. Congue massa ullamcorper in non diam quis leo diam. Elit non proin lectus eget at nunc nibh sit arcu. Lectus ut ut mauris nullam. Sed.":"In today's competitive world, we recognize that not everyone has access to the same opportunities. That's why we're here—to level the playing field and empower you to achieve your goals. ",
              introimage2,
              signupcontroller.selectUserType.value=='Mentee'? "Complete Profile":"Get Started",
              "2/3",0),
        
        ],
      ),
    );
  }
}