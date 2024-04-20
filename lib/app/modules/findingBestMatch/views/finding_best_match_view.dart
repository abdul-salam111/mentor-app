import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/finding_best_match_controller.dart';
import 'circularWidget.dart';

class FindingBestMatchView extends GetView<FindingBestMatchController> {
  const FindingBestMatchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.findingBestMentor();
    return Scaffold(
        body: Column(
      children: [
        40.heightBox,
         Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Text(
                    "Cancel",
                    style: manoropeFontFamily(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: blackcolor),
                  ),
                ),
              )),
        const LoginAssets(),
     
        Text(
          "Finding Best Match for you",
          style: manoropeFontFamily(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: darkBrownColor),
        ),
        Text(
          "Hold tight.",
          style: manoropeFontFamily(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: darkBrownColor),
        ),
        100.heightBox
      ],
    ));
  }
}
