import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/inmeeting_screen_controller.dart';

class InmeetingScreenView extends GetView<InmeetingScreenController> {
  const InmeetingScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(inMeeting))),
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: whitecolor,
                )),
            backgroundColor: darkestBrownColor,
            centerTitle: false,
            title: Text(
              "Meeting",
              style: manoropeFontFamily(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: whitecolor),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              crossAxisAlignment: crosscenter,
              children: [
                40.heightBox,
                Text(
                  "You are in a meeting with Clara",
                  style: manoropeFontFamily(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: whitecolor),
                ),
                10.heightBox,
                Text(
                  "11 mins ago",
                  style: manoropeFontFamily(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: whitecolor),
                ),
                20.heightBox,
                CircleAvatar(
                  backgroundColor: darkBrownColor,
                  radius: 82.r,
                  child: CircleAvatar(
                    backgroundColor: darkestBrownColor,
                    radius: 80.r,
                    child: CircleAvatar(
                      radius: 75.r,
                      backgroundImage: AssetImage(mentor),
                    ),
                  ),
                ),
                10.heightBox,
                Text(
                  "Lorem ipsum dolor sit",
                  style: manoropeFontFamily(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: whitecolor),
                ),
                (MediaQuery.sizeOf(context).height / 6).heightBox,
                CircleAvatar(
                  backgroundColor: darkBrownColor,
                  radius: 40.r,
                  child: Image.asset(mic),
                ),
                50.heightBox,
                CustomButton(
                    buttonName: "End Meeting",
                    onPressed: () {},
                    textcolor: darkBrownColor,
                    loading: false,
                    backgroundColor: whitecolor,
                    rounded: true,
                    height: 42.h,
                    textSize: 14.sp,
                    width: 250.w)
              ],
            ),
          )),
    );
  }
}
