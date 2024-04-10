import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/commonWidgets/commonTextfield.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/poppinsFont.dart';
import 'package:mentor_app/app/modules/signin/controllers/signin_controller.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/images.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                logo2,
                width: 180.w,
                height: 140.h,
                fit: BoxFit.cover,
              ),
            ),
            40.heightBox,
            Center(
              child: Text(
                "Welcome",
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
                textEditingController: controller.nameController.value),
            20.heightBox,
            commonTextField(
                obscureText: true,
                icon: passwordicon,
                hinttext: "Password",
                textEditingController: controller.passwordController.value),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.FORGET_PASSWORD);
                    },
                    child: const Text(
                      "Forget Password",
                      style: TextStyle(color: darkBrownColor),
                    ))),
            Text(
              "Select",
              style: poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: blackcolor),
            ),
            Row(
              children: [
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        checkColor: blackcolor,
                        side: const BorderSide(color: greyColor),
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            // Set the fill color of the checkbox when it is selected (checked)
                            return halfwhitecolor; // Change the color to your preferred color
                          }
                          // Set the fill color of the checkbox when it is not selected (unchecked)
                          return Colors
                              .transparent; // Change the color to your preferred color
                        }),
                        value: controller.selectUserType.value == 'Mentee',
                        onChanged: (bool? value) {
                          if (value != null && value) {
                            controller.setSelectUserType('Mentee');
                          }
                        },
                      ),
                      Text(
                        "Mentee",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                80.widthBox,
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        side: const BorderSide(color: greyColor),
                        checkColor: blackcolor,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            // Set the fill color of the checkbox when it is selected (checked)
                            return halfwhitecolor; // Change the color to your preferred color
                          }
                          // Set the fill color of the checkbox when it is not selected (unchecked)
                          return Colors
                              .transparent; // Change the color to your preferred color
                        }),
                        value: controller.selectUserType.value == 'Mentor',
                        onChanged: (bool? value) {
                          if (value != null && value) {
                            controller.setSelectUserType('Mentor');
                          }
                        },
                      ),
                      Text(
                        "Mentor",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            40.heightBox,
            CustomButton(
                buttonName: "Sign in",
                onPressed: () async {
                  if (controller.nameController.value.text.isNotEmpty &&
                      controller.passwordController.value.text.isNotEmpty &&
                      controller.selectUserType.value != '') {
                    controller.loginUser();
                  } 
                  else if(controller.selectUserType.value==''){
                     Utils.snakbar(
                        title: "Failed",
                        body: "Please select user type.");
                  }
                  else {
                    Utils.snakbar(
                        title: "Failed",
                        body: "Please fill the required fields");
                  }
                },
                textcolor: whitecolor,
                loading: false,
                backgroundColor: darkBrownColor,
                rounded: true,
                height: 40.h,
                textSize: 14.sp,
                width: double.infinity),
            20.heightBox,
            Image.asset(or),
            10.heightBox,
            Row(
              mainAxisAlignment: mainaround,
              children: [
                Image.asset(
                  googlelogin,
                  width: 70,
                  height: 70,
                ).onTap(() {
                  // controller.handleSignIn();
                }),
                Image.asset(
                  applelogin,
                  width: 70,
                  height: 70,
                ),
                Image.asset(
                  twitter,
                  width: 70,
                  height: 70,
                )
              ],
            ),
            20.heightBox,
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.SIGNUP);
              },
              child: Row(
                mainAxisAlignment: maincenter,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: blackcolor),
                  ),
                  Text(
                    'Signup',
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff1D2F8E),
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
