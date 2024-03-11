import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/images.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBrownColor,
      body: Center(
          child: Image.asset(
        mainlogo,
        width: 250.w,
        height: 250.h,
      )),
    );
  }
}
