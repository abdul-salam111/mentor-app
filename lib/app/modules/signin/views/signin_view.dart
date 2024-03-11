import 'dart:convert';

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
import 'package:http/http.dart' as http;

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
                height: 150.h,
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
                icon: nameicon,
                hinttext: "Name",
                textEditingController: controller.nameController.value),
            20.heightBox,
            commonTextField(
                obscureText: true,
                icon: passwordicon,
                hinttext: "Password",
                textEditingController: controller.passwordController.value),
            40.heightBox,
            CustomButton(
                buttonName: "Sign in",
                onPressed: () async {
                  if (controller.nameController.value.text.isNotEmpty &&
                      controller.passwordController.value.text.isNotEmpty) {
                    controller.loginMentee();
                  } else {
                    Utils.snakbar(
                        title: "Failed",
                        body: "Please fill the required fields");
                  }
                  // // Define the URL for the API endpoint
                  // var url = Uri.parse(
                  //     'https://guided-by-culture-production.up.railway.app/api/auth/login');

                  // // Define the request body
                  // var body = jsonEncode({
                  //   "password": controller.passwordController.value.text,
                  //   "usernameOrEmail": controller.nameController.value.text,
                  // });

                  // // Make the POST request
                  // var response = await http.post(
                  //   url,
                  //   headers: <String, String>{
                  //     'Content-Type':
                  //         'application/json', // Set content type to application/json
                  //   },
                  //   body: body, // Pass the request body
                  // );

                  // // Check the status code of the response
                  // if (response.statusCode == 200) {
                  //   // Request was successful, handle the response data
                  //   print('Response: ${response.body}');
                  //   // Parse the response JSON
                  //   var responseData = jsonDecode(response.body);
                  //   // Handle the response data
                  //   // For example:
                  //   var accessToken = responseData['accessToken'];
                  //   var tokenType = responseData['tokenType'];
                  //   // Proceed with further actions, such as storing the access token
                  // } else {
                  //   // Request failed, handle the error
                  //   print('Request failed with status: ${response.statusCode}');
                  //   // Print error response body if available
                  //   if (response.body != null && response.body.isNotEmpty) {
                  //     print('Error response: ${response.body}');
                  //   }
                  // }
                },
                textcolor: whitecolor,
                loading: false,
                backgroundColor: darkBrownColor,
                rounded: true,
                height: 40.h,
                textSize: 14.sp,
                width: double.infinity),
            40.heightBox,
            Image.asset(or),
            20.heightBox,
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
            40.heightBox,
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
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                        color: blackcolor),
                  ),
                  Text(
                    'Signup',
                    style: GoogleFonts.poppins(
                      fontSize: 10.sp,
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
