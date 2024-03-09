import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/images.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/get_started_controller.dart';

class GetStartedView extends GetView<GetStartedController> {
  const GetStartedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkBrownColor,
        body: Center(
          child: Padding(
            padding: pad16,
            child: Column(
              children: [
                (MediaQuery.sizeOf(context).height / 5.5).heightBox,
                Text(
                  "Lorem ipsum dolor sit amet consectetur.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                      fontSize: 22.sp,
                      color: whitecolor,
                      fontWeight: FontWeight.w600),
                ),
                30.heightBox,
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width / 1.5),
                  child: Text(
                    "Lorem ipsum dolor sit amet consectetur. At sit et ac etiam magna quis tristique.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: 12.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                20.heightBox,
                Image.asset(
                  introimage3,
                  height: 250.h,
                  width: 250.w,
                ),
                20.heightBox,
                CustomButton(
                  buttonName: "Get Started",
                  onPressed: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                  textcolor: darkBrownColor,
                  loading: false,
                  backgroundColor: whitecolor,
                  rounded: true,
                  height: 42.h,
                  textSize: 13.sp,
                  width: (MediaQuery.sizeOf(context).width / 1.2),
                )
              ],
            ),
          ),
        ));
  }
}
