import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/on_boarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String buttonName;
  final String? image;
  final String? pageno;
  final int heightpageno;

  OnboardingPage(
      this.title, this.description, this.image, this.buttonName, this.pageno,this.heightpageno);

  @override
  Widget build(BuildContext context) {
    
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        OnboardingController controller = Get.find();
        controller.goToNextPage();
      },
      child: Stack(
        children: [
          Container(
            color: whitecolor,
            child: Column(
              mainAxisAlignment: mainbetween,
              children: [
                const Spacer(),
                Image.asset(
                  image!,
                  height: 200.h,
                  width: 300.w,
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: pad18,
                  child: Column(
                    children: [
                      20.heightBox,
                      Text(
                        title,
                        style: GoogleFonts.manrope(
                            fontSize: 22.sp, fontWeight: FontWeight.w600),
                               textAlign: TextAlign.center,
                      ),
                      30.heightBox,
                      SizedBox(
                        height:  MediaQuery.sizeOf(context).height/5.5,
                        child: Text(
                          description,
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: darkGreyColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  (heightpageno).heightBox,
                      Text(
                        pageno!,
                        style: GoogleFonts.manrope(
                            color: lightBrownColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      20.heightBox,
                      CustomButton(
                          buttonName: buttonName,
                          onPressed: () {
                            OnboardingController controller = Get.find();
                            controller.goToNextPage();
                          },
                          textcolor: whitecolor,
                          loading: false,
                          backgroundColor: darkBrownColor,
                          rounded: true,
                          height: 37.h,
                          textSize: 16,
                          width: 300.w),
                      50.heightBox,
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
                10.heightBox,
              ],
            ),
          ),
          // height > 772
          //     ? Positioned(
          //         top: 0.55.sh,
          //         left: MediaQuery.sizeOf(context).width / 2.35,
          //         child: Image.asset(
          //           introScreenRoundedIcon,
          //           height: 50,
          //           width: 50,
          //         ))
          //     : Positioned(
          //         top: 0.43.sh,
          //         left: MediaQuery.sizeOf(context).width / 2.35,
          //         child: Image.asset(
          //           introScreenRoundedIcon,
          //             height: 50,
          //           width: 50,
          //         )),
        ],
      ),
    );
  }
}