import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/commonWidgets/commonTextfield.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/poppinsFont.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/images.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
        child: ListView(
          children: [
            (MediaQuery.sizeOf(context).height * 0.01).heightBox,
            Center(
              child: Image.asset(
                logo2,
                width: 180.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
            20.heightBox,
            Center(
              child: Text(
                "Welcome",
                style: poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: blackcolor),
              ),
            ),
            20.heightBox,
            commonTextField(
                icon: nameicon,
                hinttext: "Name",
                textEditingController: controller.nameController.value),
            20.heightBox,
            commonTextField(
                icon: emailicon,
                hinttext: "Email",
                textEditingController: controller.emailController.value),
            20.heightBox,
            commonTextField(
                obscureText: true,
                icon: passwordicon,
                hinttext: "Password",
                textEditingController: controller.passwordController.value),
            10.heightBox,
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
            30.heightBox,
            CustomButton(
                buttonName: "Sign up",
                onPressed: () {
                  if (controller.accepttermsandConditions.value == true &&
                      controller.selectUserType.value != '' &&
                      controller.selectUserType.value.isNotEmpty) {
                         StorageServices.to.setString(key: selectedUserType, value: controller.selectUserType.value);
                      Get.toNamed(Routes.ON_BOARDING);
                     
                  } else if (controller.emailController.value.text.isEmpty ||
                      controller.nameController.value.text.isEmpty ||
                      controller.passwordController.value.text.isEmpty) {
                    Utils.snakbar(
                        title: "Fields Required",
                        body: "Please fill all fields");
                  } else if (controller.accepttermsandConditions.value !=
                      true) {
                    Utils.snakbar(
                        title: "Accpet terms and conditions",
                        body: "Please accept terms and conditions!");
                  }
                },
                textcolor: whitecolor,
                loading: false,
                backgroundColor: darkBrownColor,
                rounded: true,
                height: 40.h,
                textSize: 14.sp,
                width: double.infinity),
            10.heightBox,
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
                        value: controller.accepttermsandConditions.value
                            ? true
                            : false,
                        onChanged: (bool? value) {
                          controller.accepttermsandConditions.value =
                              !controller.accepttermsandConditions.value;
                        },
                      ),
                      Text(
                        "Accept ",
                        style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "Terms and Conditions",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            textStyle: const TextStyle(
                                decoration: TextDecoration.underline),
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff4D45AF)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            10.heightBox,
            Image.asset(or),
            10.heightBox,
            Row(
              mainAxisAlignment: mainaround,
              children: [
                Image.asset(
                  googlelogin,
                  width: 70,
                  height: 70,
                ),
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
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.SIGNIN);
              },
              child: Row(
                mainAxisAlignment: maincenter,
                children: [
                  Text(
                    "Already have an account? ",
                    style: poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: blackcolor),
                  ),
                  Text(
                    'Sign in',
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
