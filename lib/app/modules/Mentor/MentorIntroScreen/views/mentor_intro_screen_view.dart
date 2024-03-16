import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/commonTextfield.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/modules/Mentee/onBoarding/views/screens.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/images.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../resources/alignments.dart';
import '../../../../resources/paddings.dart';
import '../controllers/mentor_intro_screen_controller.dart';

class MentorIntroScreenView extends StatelessWidget {
  const MentorIntroScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      MentorIntroScreenController(),
    );
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: whitecolor,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: [
          OnboardingPage(
              "verification process",
              "Lorem ipsum dolor sit amet consectetur. Congue massa ullamcorper in non diam quis leo diam. Elit non proin lectus eget at nunc nibh sit arcu. Lectus ut ut mauris nullam. Sed.",
              introimage1,
              "Next",
              "1/3"),
          OnboardingPage(
              "Connects mission",
              "Lorem ipsum dolor sit amet consectetur. Nunc eu aliquam eget   amet consectetur. Nunc eu aliquam eget ac integer lectus dignissim. In nibh quis accumsan purus nisl. Netus sed pretium at arcu vivamus curabitur.",
              introimage2,
              "Get Started",
              "2/3"),
          GestureDetector(
            onTap: () {
             
              controller.goToNextPage();
            },
            child: Stack(
              children: [
                Container(
                  color: whitecolor,
                  child: Column(
                    mainAxisAlignment: mainbetween,
                    children: [
                      70.heightBox,
                      Image.asset(
                        "assets/icons/doneicon.png",
                        height: 120.h,
                        width: 200.w,
                      ),
                      SizedBox(height: 60.h),
                      Padding(
                        padding: pad18,
                        child: Column(
                          children: [
                            20.heightBox,
                            Text(
                              "Select verification Option",
                              style: GoogleFonts.manrope(
                                  fontSize: 22.sp, fontWeight: FontWeight.w600),
                            ),
                            20.heightBox,
                            Text(
                              "Your ultimate destination for  finding furniture that perfectly fits your style and space. Get ready to embark on a journey of seamless shopping and inspiration.",
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: darkGreyColor),
                              textAlign: TextAlign.center,
                            ),
                            20.heightBox,
                            Text(
                              "3/3",
                              style: GoogleFonts.manrope(
                                  color: lightBrownColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            10.heightBox,
                            Container(
                              child: Row(
                                mainAxisAlignment: maincenter,
                                children: [
                                  Image.asset(linkedin),
                                  20.widthBox,
                                  Text(
                                    "Verify by LinkedIn",
                                    style: manoropeFontFamily(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal,
                                        color: whitecolor),
                                  )
                                ],
                              ),
                            )
                                .box
                                .rounded
                                .color(const Color(0xff3E67A4))
                                .padding(defaultpad)
                                .margin(defaultpad)
                                .make(),
                            10.heightBox,
                            Container(
                              child: Row(
                                mainAxisAlignment: maincenter,
                                children: [
                                  Image.asset(email),
                                  20.widthBox,
                                  Text(
                                    "Company Email",
                                    style: manoropeFontFamily(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal,
                                        color: whitecolor),
                                  ),
                                  20.widthBox,
                                ],
                              ),
                            )
                                .box
                                .rounded
                                .color(const Color(0xff610303))
                                .padding(defaultpad)
                                .margin(defaultpad)
                                .make()
                                .onTap(() {
                              Get.bottomSheet(Container(
                                padding: pad20,
                                decoration: const BoxDecoration(
                                    color: whitecolor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                width: double.infinity,
                                height: 300.h,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50.h,
                                      height: 1, // Height of the line separator
                                      color: Colors
                                          .grey, // Color of the line separator
                                    ),
                                    40.heightBox,
                                    Text(
                                      "Enter your company email",
                                      style: manoropeFontFamily(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: blackcolor),
                                    ),
                                    20.heightBox,
                                    commonTextField(
                                        icon: emailicon,
                                        hinttext: "Email",
                                        textEditingController:
                                            controller.emailcontroller.value),
                                    40.heightBox,
                                    CustomButton(
                                        buttonName: "Send",
                                        onPressed: () {},
                                        textcolor: whitecolor,
                                        loading: false,
                                        backgroundColor: darkBrownColor,
                                        rounded: false,
                                        height: 40.sp,
                                        textSize: 15.sp,
                                        width: double.infinity)
                                  ],
                                ),
                              ));
                            })
                          ],
                        )
                            .box
                            .white
                            .width(double.infinity)
                            .padding(pad12)
                            .roundedLg
                            .shadowSm
                            .make(),
                      ),
                      10.heightBox,
                    ],
                  ),
                ),
                height > 772
                    ? Positioned(
                        top: 0.46.sh,
                        left: MediaQuery.sizeOf(context).width / 2.35,
                        child: Image.asset(
                          introScreenRoundedIcon,
                          height: 50,
                          width: 50,
                        ))
                    : Positioned(
                        top: 0.46.sh,
                        left: MediaQuery.sizeOf(context).width / 2.35,
                        child: Image.asset(
                          introScreenRoundedIcon,
                          height: 50,
                          width: 50,
                        )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              MentorIntroScreenController controller = Get.find();
              controller.goToNextPage();
            },
            child: Stack(
              children: [
                Container(
                  color: whitecolor,
                  child: Column(
                    mainAxisAlignment: mainbetween,
                    children: [
                      70.heightBox,
                      Image.asset(
                        "assets/icons/doneicon.png",
                        height: 120.h,
                        width: 200.w,
                      ),
         SizedBox(height: 100.h),
                      Padding(
                        padding: pad18,
                        child: Column(
                          children: [
                            20.heightBox,
                            Text(
                              "switch positions",
                              style: GoogleFonts.manrope(
                                  fontSize: 22.sp, fontWeight: FontWeight.w600),
                            ),
                            30.heightBox,
                            Text(
                              "Your ultimate destination for finding furniture that perfectly fits your style and space. Get ready to embark on a journey of seamless shopping and inspiration.",
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: darkGreyColor),
                              textAlign: TextAlign.center,
                            ),
                            50.heightBox,
                            CustomButton(
                                buttonName: "Continue as Mantor",
                                onPressed: () {},
                                textcolor: whitecolor,
                                loading: false,
                                backgroundColor: darkBrownColor,
                                rounded: true,
                                height: 40.h,
                                textSize: 14.sp,
                                width: double.infinity),
                            30.heightBox,
                            CustomButton(
                                buttonName: "Continue as Mentee",
                                onPressed: () {},
                                textcolor: whitecolor,
                                loading: false,
                                backgroundColor: darkBrownColor,
                                rounded: true,
                                height: 40.h,
                                textSize: 14.sp,
                                width: double.infinity),
                          ],
                        )
                            .box
                            .white
                            .width(double.infinity)
                            .padding(pad12)
                            .roundedLg
                            .shadowSm
                            .make(),
                      ),
                      10.heightBox,
                    ],
                  ),
                ),
                height > 772
                    ? Positioned(
                        top: 0.46.sh,
                        left: MediaQuery.sizeOf(context).width / 2.35,
                        child: Image.asset(
                          introScreenRoundedIcon,
                          height: 50,
                          width: 50,
                        ))
                    : Positioned(
                        top: 0.46.sh,
                        left: MediaQuery.sizeOf(context).width / 2.35,
                        child: Image.asset(
                          introScreenRoundedIcon,
                          height: 50,
                          width: 50,
                        )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              MentorIntroScreenController controller = Get.find();
              controller.goToNextPage();
            },
            child: Stack(
              children: [
                Container(
                  color: whitecolor,
                  child: Column(
                    mainAxisAlignment: mainbetween,
                    children: [
                      70.heightBox,
                      Image.asset(
                        "assets/icons/doneicon.png",
                        height: 120.h,
                        width: 200.w,
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: pad18,
                        child: Column(
                          children: [
                            20.heightBox,
                            Text(
                              "Thanks for Verifying! Complete your profile",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                  fontSize: 22.sp, fontWeight: FontWeight.w600),
                            ),
                            30.heightBox,
                            Text(
                              "Your ultimate destination for finding furniture that perfectly fits your style and space. Get ready to embark on a journey of seamless shopping and inspiration.",
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: darkGreyColor),
                              textAlign: TextAlign.center,
                            ),
                            50.heightBox,
                            CustomButton(
                                buttonName: "Complete Profile",
                                onPressed: () {},
                                textcolor: whitecolor,
                                loading: false,
                                backgroundColor: darkBrownColor,
                                rounded: true,
                                height: 40.h,
                                textSize: 14.sp,
                                width: double.infinity),
                            50.heightBox
                          ],
                        )
                            .box
                            .white
                            .width(double.infinity)
                            .padding(pad12)
                            .roundedLg
                            .shadowSm
                            .make(),
                      ),
                      10.heightBox,
                    ],
                  ),
                ),
                height > 772
                    ? Positioned(
                        top: 0.46.sh,
                        left: MediaQuery.sizeOf(context).width / 2.35,
                        child: Image.asset(
                          introScreenRoundedIcon,
                          height: 50,
                          width: 50,
                        ))
                    : Positioned(
                        top: 0.46.sh,
                        left: MediaQuery.sizeOf(context).width / 2.35,
                        child: Image.asset(
                          introScreenRoundedIcon,
                          height: 50,
                          width: 50,
                        )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
