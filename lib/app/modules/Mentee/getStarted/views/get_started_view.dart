import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/images.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/storage.dart';
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
                (MediaQuery.sizeOf(context).height / 7).heightBox,
                Text(
                  "Welcome to the Guided By Culture Community!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                      fontSize: 22.sp,
                      color: whitecolor,
                      fontWeight: FontWeight.w600),
                ),
                30.heightBox,
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width / 1.2),
                  child: Text(
                    "Join our diverse and inclusive community dedicated to empowering individuals like you. Whether you're a mentor ready to share wisdom or a mentee seeking guidance, you've found your place here. Connect. Cultivate. Elevate. Welcome aboard.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: 14.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Image.asset(
                  introimage3,
                  height: 250.h,
                  width: 250.w,
                ),
                20.heightBox,
                CustomButton(
                  buttonName: "Get Started",
                  onPressed: () {
                    Get.toNamed(Routes.SIGNIN);
                    StorageServices.to.setBool(key: "getStartedSeen", value: true);
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
