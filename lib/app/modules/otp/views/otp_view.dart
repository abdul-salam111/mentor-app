import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/commonWidgets/commonTextfield.dart';
import 'package:mentor_app/app/commonWidgets/poppinsFont.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../commonWidgets/elevatedButton.dart';
import '../../../resources/icons.dart';
import '../../../resources/images.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pad20,
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  logo2,
                  width: 180.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
              ),
              40.heightBox,
              Center(
                child: Text(
                  "Enter Otp",
                  style: poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: blackcolor),
                ),
              ),
              40.heightBox,
              commonTextField(
                  icon: emailicon,
                  hinttext: "Otp",
                  textEditingController: controller.otpController.value),
              20.heightBox,
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  buttonName: "Verify",
                  onPressed: () {
                    Get.toNamed(Routes.CREATE_NEW_PASSWORD);
                  },
                  backgroundColor: darkBrownColor,
                  textSize: 15.sp,
                  textcolor: whitecolor,
                  width: 130.w,
                  height: 35.h,
                  loading: false,
                  rounded: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
