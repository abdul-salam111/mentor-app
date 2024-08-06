import 'package:flutter/foundation.dart';
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
  ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
            Form(
              key: formKey,
              child: Column(
                children: [
                  commonTextField(
                    icon: nameicon,
                    hinttext: "Name",
                    textEditingController: controller.nameController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      // Additional validation logic if needed
                      return null;
                    },
                  ),
                  20.heightBox,
                  commonTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      } else {
                        return null;
                      }
                    },
                    icon: emailicon,
                    hinttext: "Email",
                    textEditingController: controller.emailController.value,
                  ),
                  20.heightBox,
                  ValueListenableBuilder(
                    valueListenable: obscureText,
                    builder: (BuildContext context, bool value, Widget? child) {
                      return TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                        obscureText: obscureText.value,
                        controller: controller.passwordController.value,
                        cursorHeight: 15.h,
                        style: poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: textfieldgrey,
                        ),
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 20, left: 10),
                            child: SizedBox(
                              height: 20,
                              width: 30,
                              child: Image.asset(
                                passwordicon,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: textfieldgrey,
                            ),
                            onPressed: () {
                              obscureText.value = !obscureText.value;
                            },
                          ),
                          contentPadding: const EdgeInsets.only(
                              left: 20, top: 15, bottom: 15),
                          hintText: 'Password',
                          filled: true,
                          fillColor: const Color(0xffF0F0F0),
                          hintStyle: poppins(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: textfieldgrey,
                          ),
                        ),
                      ).box.rounded.clip(Clip.antiAlias).make();
                    },
                  ),
                  10.heightBox,
                ],
              ),
            ),

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
                        fillColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
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
                        fillColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
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
            Row(
              children: [
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        checkColor: blackcolor,
                        side: const BorderSide(color: greyColor),
                        fillColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
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
            CustomButton(
                buttonName: "Sign up",
                onPressed: () {
                  if (formKey.currentState!.validate() &&
                      controller.selectUserType.value != '' &&
                      controller.accepttermsandConditions.value != false &&
                      controller.selectUserType.value.isNotEmpty) {
                    StorageServices.to.setString(
                        key: selectedUserType,
                        value: controller.selectUserType.value);

                    Get.toNamed(Routes.ON_BOARDING);
                  } else if (controller.accepttermsandConditions.value ==
                      false) {
                    Utils.snakbar(
                        title: "Error",
                        body: "Please accept terms and conditions");
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
            // 10.heightBox,
            // Image.asset(or),
            // 10.heightBox,
            // Row(
            //   mainAxisAlignment: mainaround,
            //   children: [
            //     Image.asset(
            //       googlelogin,
            //       width: 70,
            //       height: 70,
            //     ),
            //     Image.asset(
            //       applelogin,
            //       width: 70,
            //       height: 70,
            //     ),
            //     Image.asset(
            //       twitter,
            //       width: 70,
            //       height: 70,
            //     )
            //   ],
            // ),
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
