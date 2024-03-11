import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: whitecolor,
        appBar: AppBar(
          backgroundColor: whitecolor,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Security',
            style: GoogleFonts.manrope(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff656466)),
          ),
          centerTitle: false,
        ),
        body: Padding(
          padding: pad20,
          child: Column(
            crossAxisAlignment: crosstart,
            children: [
              20.heightBox,
              Text(
                "Old password",
                style: manoropeFontFamily(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff656466)),
              ),
              10.heightBox,
              Obx(
                () => TextField(
                  style: manoropeFontFamily(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff656466)),
                  obscureText: controller.oldpasswordObsecure.value,
                  controller: controller.oldPasswordController.value,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            controller.oldpasswordObsecure.value =
                                !controller.oldpasswordObsecure.value;
                          },
                          child: Icon(
                            controller.oldpasswordObsecure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xff656466),
                          )),
                      hintText: "***********",
                      contentPadding: const EdgeInsets.only(left: 20, top: 12),
                      hintStyle: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff656466))),
                )
                    .box
                    .roundedLg
                    .clip(Clip.antiAlias)
                    .color(const Color(0xffEFEFEF))
                    .make(),
              ),
              20.heightBox,
              Text(
                "New password",
                style: manoropeFontFamily(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff656466)),
              ),
              10.heightBox,
              Obx(
                () => TextField(
                  style: manoropeFontFamily(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff656466)),
                  obscureText: controller.newpasswordObsecure.value,
                  controller: controller.newPasswordController.value,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            controller.newpasswordObsecure.value =
                                !controller.newpasswordObsecure.value;
                          },
                          child: Icon(
                            controller.newpasswordObsecure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xff656466),
                          )),
                      hintText: "***********",
                      contentPadding: const EdgeInsets.only(left: 20, top: 12),
                      hintStyle: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff656466))),
                )
                    .box
                    .roundedLg
                    .clip(Clip.antiAlias)
                    .color(const Color(0xffEFEFEF))
                    .make(),
              ),
              20.heightBox,
              Text(
                "Confirm password",
                style: manoropeFontFamily(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff656466)),
              ),
              10.heightBox,
              Obx(
                () => TextField(
                  style: manoropeFontFamily(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff656466)),
                  obscureText: controller.confirmpasswordObsecure.value,
                  controller: controller.confirmPasswordController.value,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            controller.confirmpasswordObsecure.value =
                                !controller.confirmpasswordObsecure.value;
                          },
                          child: Icon(
                            controller.confirmpasswordObsecure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xff656466),
                          )),
                      hintText: "***********",
                      contentPadding: const EdgeInsets.only(left: 20, top: 12),
                      hintStyle: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff656466))),
                )
                    .box
                    .roundedLg
                    .clip(Clip.antiAlias)
                    .color(const Color(0xffEFEFEF))
                    .make(),
              ),
              30.heightBox,
              Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                      buttonName: "Save",
                      onPressed: () {
                        if (controller.newPasswordController.value.text !=
                            controller.confirmPasswordController.value.text) {
                          Utils.snakbar(
                              title: "Password not same!",
                              body: "Passwords not matching.");
                        } else if (controller
                                .newPasswordController.value.text.isEmpty ||
                            controller
                                .oldPasswordController.value.text.isEmpty ||
                            controller
                                .confirmPasswordController.value.text.isEmpty) {
                          Utils.snakbar(
                              title: "Feilds required!",
                              body: "Please fill all fields.");
                        } else {
                          controller.changePassword();
                        }
                      },
                      textcolor: whitecolor,
                      loading: false,
                      backgroundColor: darkBrownColor,
                      rounded: false,
                      height: 35.h,
                      textSize: 12.sp,
                      width: 120.w))
            ],
          ),
        ));
  }
}
