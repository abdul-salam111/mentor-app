import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/mentor_profile_controller.dart';

class MentorProfileView extends GetView<MentorProfileController> {
  const MentorProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Mentor Profile',
            style: GoogleFonts.manrope(
                fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Spacer(),
                    Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        20.heightBox,
                        Center(
                          child: Text(
                            "Omowumi John",
                            style: GoogleFonts.lato(
                                fontSize: 16.sp, fontWeight: FontWeight.w700),
                          ),
                        ),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: maincenter,
                          children: [
                            Row(
                              mainAxisAlignment: maincenter,
                              children: List.generate(
                                  5,
                                  (index) => const Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 7),
                                        child: Icon(
                                          Icons.star,
                                          color: ratingcolor,
                                        ),
                                      )),
                            ),
                            10.widthBox,
                            Text(
                              '15 reviews',
                              style: GoogleFonts.lato(
                                  fontSize: 14.sp,
                                  color: ratingcolor,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        20.heightBox,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              Text(
                                "About",
                                style: manoropeFontFamily(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: darkBrownColor),
                              ),
                              Text(
                                "I am a skilled and professional teacher with over 10 years of teaching students and preparing them to ace their final secondary school examination. I have worked in over 5 schools including LUTH secondary school, Idi-araba, Lagos",
                                style: manoropeFontFamily(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: blackcolor),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                        20.heightBox,
                        Row(
                          children: [
                            Image.asset(
                              gender,
                              color: darkBrownColor,
                              height: 15,
                              width: 15,
                            ),
                            10.widthBox,
                            Text(
                              "Skills",
                              style: manoropeFontFamily(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: darkBrownColor),
                            )
                          ],
                        ),
                        10.heightBox,
                        SizedBox(
                          height: 30.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  child: Text(
                                    "Graphic Design",
                                    style: manoropeFontFamily(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: textfieldgrey),
                                  ),
                                )
                                    .box
                                    .white
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 8))
                                    .padding(defaultpad)
                                    .border(color: greyColor.withOpacity(0.5))
                                    .roundedSM
                                    .make();
                              }),
                        ),
                        20.heightBox,
                        Row(
                          children: [
                            Image.asset(
                              industry,
                              color: darkBrownColor,
                              height: 20,
                              width: 20,
                            ),
                            10.widthBox,
                            Text(
                              "Industry",
                              style: manoropeFontFamily(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: darkBrownColor),
                            )
                          ],
                        ),
                        10.heightBox,
                        SizedBox(
                          height: 30.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  child: Text(
                                    "Industry",
                                    style: manoropeFontFamily(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: textfieldgrey),
                                  ),
                                )
                                    .box
                                    .white
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 8))
                                    .padding(defaultpad)
                                    .border(color: greyColor.withOpacity(0.5))
                                    .roundedSM
                                    .make();
                              }),
                        ),
                        20.heightBox,
                        Row(
                          children: [
                            Image.asset(
                              experience,
                              height: 20,
                              width: 20,
                            ),
                            10.widthBox,
                            Text(
                              "Experience",
                              style: manoropeFontFamily(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: darkBrownColor),
                            ),
                          ],
                        ),
                        10.heightBox,
                        SizedBox(
                          child: Text(
                            "5 years",
                            style: manoropeFontFamily(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: textfieldgrey,
                            ),
                          ),
                        )
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .padding(defaultpad)
                            .border(color: greyColor.withOpacity(0.5))
                            .roundedSM
                            .make(),
                        20.heightBox,
                        CustomButton(
                            buttonName: "Send Request",
                            onPressed: () {},
                            textcolor: whitecolor,
                            loading: false,
                            backgroundColor: darkBrownColor,
                            rounded: true,
                            height: 50,
                            textSize: 15,
                            width: double.infinity),
                        20.heightBox,
                      ],
                    )
                        .box
                        .topRounded()
                        .padding(const EdgeInsets.symmetric(horizontal: 12))
                        .width(double.infinity)
                        .shadow
                        .clip(Clip.antiAlias)
                        .color(const Color(0xffF6F6F6))
                        .make(),
                  ],
                )),
            Positioned(
              top: 20.h,
              left: MediaQuery.sizeOf(context).width / 3.4,
              child: CircleAvatar(
                radius: 70.r,
                backgroundImage: const AssetImage(
                  mentor,
                ),
              ).box.outerShadowLg.clip(Clip.antiAlias).roundedFull.make(),
            )
          ],
        ));
  }
}
