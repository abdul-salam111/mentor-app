import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/images.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../commonWidgets/elevatedButton.dart';
import '../controllers/congratulations_controller.dart';

class CongratulationsView extends GetView<CongratulationsController> {
  const CongratulationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
  
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Align(
                //   alignment: Alignment.topRight,
                //   child: TextButton(
                //       onPressed: () {
                //         Get.offAllNamed(Routes.SIGNIN);
                //       },
                //       child: Text(
                //         "Skip",
                //         style: manoropeFontFamily(
                //             fontSize: 14,
                //             fontWeight: FontWeight.w500,
                //             color: blackcolor),
                //       )),
                // ),
                20.heightBox,
                height > 772
                    ? Image.asset(
                        congratulationimage,
                        width: 210.w,
                        height: 210.h,
                      )
                    : Image.asset(
                        congratulationimage,
                        width: 170.w,
                        height: 170.h,
                      ),
                20.heightBox,
                Padding(
                  padding: pad18,
                  child: Column(
                    children: [
                      20.heightBox,
                      Text(
                        "Account created successfully",
                        style: manoropeFontFamily(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: blackcolor),
                        textAlign: TextAlign.center,
                      ),
                      30.heightBox,
                      Text(
                        "Welcome to the Guided By Culture Community!",
                        style: manoropeFontFamily(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: blackcolor),
                        textAlign: TextAlign.center,
                      ),
                      100.heightBox,
                      CustomButton(
                          buttonName: "Sign in using your new account ",
                          onPressed: () {
                            Get.offAllNamed(Routes.SIGNIN);
                          },
                          textcolor: whitecolor,
                          loading: false,
                          backgroundColor: darkBrownColor,
                          rounded: true,
                          height: 37.h,
                          textSize: 16,
                          width: 300.w),
                      70.heightBox,
                    ],
                  )
                      .box
                      .white
                      .width(double.infinity)
                      .padding(pad12)
                      .roundedLg
                      .shadowSm
                      .make(),
                ),
              ],
            ),
          ),
          height > 772
              ? Positioned(
                  top: 0.394.sh,
                  left: MediaQuery.sizeOf(context).width / 2.35,
                  child: Image.asset(
                    introScreenRoundedIcon,
                    height: 50,
                    width: 50,
                  ))
              :       height <= 772? Positioned(
                  top: 0.36.sh,
                  left: MediaQuery.sizeOf(context).width / 2.35,
                  child: Image.asset(
                    introScreenRoundedIcon,
                    height: 50,
                    width: 50,
                  )):
               Positioned(
                  top: 0.46.sh,
                  left: MediaQuery.sizeOf(context).width / 2.35,
                  child: Image.asset(
                    introScreenRoundedIcon,
                    height: 50,
                    width: 50,
                  )),
        ],
      ),
    )));
  }
}
