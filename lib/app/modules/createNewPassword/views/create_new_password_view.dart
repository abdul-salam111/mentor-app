import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/poppinsFont.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../commonWidgets/manoropeFontFamily.dart';
import '../../../resources/images.dart';
import '../controllers/create_new_password_controller.dart';

class CreateNewPasswordView extends GetView<CreateNewPasswordController> {
  const CreateNewPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: pad20,
          child: Column(
            crossAxisAlignment: crosstart,
            children: [
              Center(
                child: Image.asset(
                  logo2,
                  width: 180.w,
                  height: 130.h,
                  fit: BoxFit.cover,
                ),
              ),
              40.heightBox,
              Center(
                child: Text(
                  "Create New Password",
                  style: poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: blackcolor),
                ),
              ),
              40.heightBox,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "New Password",
                  style: manoropeFontFamily(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff656466)),
                ),
              ),
              10.heightBox,
              Obx(
                () => TextField(
                  style: manoropeFontFamily(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff656466)),
                  obscureText: controller.passwordObsecure.value,
                  controller: controller.newPasswordController.value,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            controller.passwordObsecure.value =
                                !controller.passwordObsecure.value;
                          },
                          child: Icon(
                            controller.passwordObsecure.value
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
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Confirm Password",
                  style: manoropeFontFamily(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff656466)),
                ),
              ),
              10.heightBox,
              Obx(
                () => TextField(
                  style: manoropeFontFamily(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff656466)),
                  obscureText: controller.confirmObsecure.value,
                  controller: controller.confirmPasswordController.value,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            controller.confirmObsecure.value =
                                !controller.confirmObsecure.value;
                          },
                          child: Icon(
                            controller.confirmObsecure.value
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
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  buttonName: "Confirm",
                  onPressed: () {
                    AuthRepository authRepository = AuthRepository();
                    if (controller.confirmPasswordController.value.text.isNotEmpty &&
                        controller
                            .confirmPasswordController.value.text.isNotEmpty &&
                        controller.confirmPasswordController.value.text ==
                            controller.confirmPasswordController.value.text) {
                      authRepository.createNewPassword(
                          password: controller
                              .confirmPasswordController.value.text
                              .toString());
                    } else if (controller
                            .confirmPasswordController.value.text !=
                        controller.confirmPasswordController.value.text) {
                      Utils.snakbar(
                          title: "Passwords not matching",
                          body: "Please make sure to match the passwords");
                    }
                    else {
                      Utils.snakbar(
                          title: "Empty Feilds",
                          body: "Fields are requried");
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
