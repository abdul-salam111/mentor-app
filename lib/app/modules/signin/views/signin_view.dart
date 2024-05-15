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
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    controller: controller.nameController.value,
                    cursorHeight: 15.h,
                    style: poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
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
                            emailicon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                      hintText: "Email",
                      filled: true,
                      fillColor: const Color(0xffF0F0F0),
                      hintStyle: poppins(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: textfieldgrey),
                    ),
                  ).box.rounded.clip(Clip.antiAlias).make(),
                  20.heightBox,
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: controller.passwordController.value,
                    cursorHeight: 15.h,
                    style: poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: textfieldgrey),
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
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                      hintText: "Password",
                      filled: true,
                      fillColor: const Color(0xffF0F0F0),
                      hintStyle: poppins(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: textfieldgrey),
                    ),
                  ).box.rounded.clip(Clip.antiAlias).make(),
                ],
              ),
            ),

            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.FORGET_PASSWORD);
                    },
                    child: const Text(
                      "Forgot Password?",
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
            30.heightBox,

            CustomButton(
                buttonName: "Sign in",
                onPressed: () async {
                  if (_formKey.currentState!.validate()&&
                      controller.selectUserType.value != '') {
                    controller.loginUser();
                  } 
                },
                textcolor: whitecolor,
                loading: false,
                backgroundColor: darkBrownColor,
                rounded: true,
                height: 40.h,
                textSize: 14.sp,
                width: double.infinity),
            // 20.heightBox,
            // Image.asset(or),
            // 10.heightBox,
            // Row(
            //   mainAxisAlignment: mainaround,
            //   children: [
            //     Image.asset(
            //       googlelogin,
            //       width: 70,
            //       height: 70,
            //     ).onTap(() {
            //       // controller.handleSignIn();
            //     }),
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
