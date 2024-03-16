import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/poppinsFont.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/images.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../commonWidgets/commonTextfield.dart';
import '../../../resources/colors.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);
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
                  "Forget Password",
                  style: poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: blackcolor),
                ),
              ),
              40.heightBox,
              commonTextField(
                  icon: emailicon,
                  hinttext: "Email",
                  textEditingController: controller.emailcontroller.value),
              20.heightBox,
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  buttonName: "Send OTP",
                  onPressed: () {
                    if (controller.emailcontroller.value.text.isNotEmpty) {
                      controller.sendOtp();
                    } else {
                      Utils.snakbar(
                          title: "Email", body: "Enter email please.");
                    }
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
