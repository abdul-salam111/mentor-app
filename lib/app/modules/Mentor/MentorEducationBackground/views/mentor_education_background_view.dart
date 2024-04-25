import 'dart:io';

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
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/mentor_education_background_controller.dart';

class MentorEducationBackgroundView
    extends GetView<MentorEducationBackgroundController> {
  const MentorEducationBackgroundView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: whitecolor,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Profile',
            style: GoogleFonts.manrope(
                fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
        ),
        body: ListView(children: [
          10.heightBox,
       
          Padding(
            padding: pad18,
            child: Column(
              children: [
                    StorageServices.to.getbool('updateProfile')==true?   20.heightBox:const SizedBox.shrink(),
            StorageServices.to.getbool('updateProfile')==true?    Row(
            children: [
              Image.asset(
                profile,
                height: 15,
                width: 15,
              ),
              10.widthBox,
              Text(
                "Full Name",
                style: manoropeFontFamily(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: blackcolor),
              ),
            ],
          ):const SizedBox.shrink(),
          10.heightBox,
         StorageServices.to.getbool('updateProfile')==true? TextField(
            keyboardType: TextInputType.text,
            controller: controller.nameController.value,
            decoration: InputDecoration(
                hintText: 'eg. 1 year', // Your hint text
                hintStyle: manoropeFontFamily(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: textfieldgrey),
                contentPadding: const EdgeInsets.only(
                    left: 12.0), // Padding from top and left
                border: InputBorder.none),
          )
              .box
              .color(const Color(0xffF4F4F4))
             
              .roundedSM
              .make():const SizedBox.shrink(),
                StorageServices.to.getbool('updateProfile')==true?    20.heightBox:const SizedBox.shrink(),
                Row(
                  children: [
                    Image.asset(
                      profile,
                      width: 15,
                      height: 15,
                    ),
                    10.widthBox,
                    Text(
                      "Introduce yourself",
                      style: manoropeFontFamily(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    ),
                  ],
                ),
                10.heightBox,
                TextField(
                  maxLines: null, // Allow multiple lines of text
                  minLines: 3,
                  controller: controller.aboutMe.value,
                  decoration: InputDecoration(
                      hintText: 'Write...', // Your hint text
                      hintStyle: manoropeFontFamily(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: blackcolor),
                      contentPadding: const EdgeInsets.only(
                          top: 12.0, left: 12.0), // Padding from top and left
                      border: InputBorder.none),
                ).box.color(const Color(0xffF4F4F4)).roundedSM.make(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/kind.png",
                      width: 15,
                      height: 15,
                    ),
                    10.widthBox,
                    Text(
                      "Professional background",
                      style: manoropeFontFamily(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    ),
                  ],
                ),
                10.heightBox,
                TextField(
                  maxLines: null, // Allow multiple lines of text
                  minLines: 3,
                  maxLength: 500,

                  controller: controller.professionalBg.value,
                  decoration: InputDecoration(
                      hintText: 'Write...', // Your hint text
                      hintStyle: manoropeFontFamily(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: blackcolor),
                      contentPadding: const EdgeInsets.only(
                          top: 12.0, left: 12.0), // Padding from top and left
                      border: InputBorder.none),
                ).box.color(const Color(0xffF4F4F4)).roundedSM.make(),
              ],
            ),
          ),
          20.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              children: [
                Image.asset(
                  industry,
                  height: 20,
                  width: 20,
                ),
                10.widthBox,
                Text(
                  "Industry",
                  style: manoropeFontFamily(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: blackcolor),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: crosstart,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: mainbetween,
                  children: [
                    Obx(
                      () => Text(
                        controller.selectedIndustries.value,
                        style: manoropeFontFamily(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: blackcolor),
                      ),
                    ),
                    const Icon(Icons.expand_more),
                  ],
                ).box.make().onTap(() {
                  controller.isIndusryOpen.value =
                      !controller.isIndusryOpen.value;
                }),
              ),
              Obx(
                () => controller.isIndusryOpen.value
                    ? Column(
                        children: [
                          10.heightBox,
                          Container(
                            color: greyColor,
                            height: 1,
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              Obx(() => controller.isIndusryOpen.value
                  ? GetBuilder<MentorEducationBackgroundController>(
                      builder: (contextsss) {
                      return SizedBox(
                        height: 200.h,
                        child: ListView.builder(
                          itemCount: controller.industries.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final skill = controller.industries[index];
                            // final isSelected =
                            //     controller.selectedSkills.contains(skill);
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    skill,
                                    style: manoropeFontFamily(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: blackcolor),
                                  ),
                                ),
                                Container(
                                  color: greyColor,
                                  height: 1,
                                ),
                              ],
                            ).onTap(() {
                              controller.isIndusryOpen.value = false;
                              controller.selectedIndustries.value =
                                  controller.industries[index];
                            });
                          },
                        ),
                      );
                    })
                  : const SizedBox.shrink())
            ],
          )
              .box
              .white
              .margin(const EdgeInsets.only(left: 20, right: 20))
              .padding(defaultpad)
              .width(double.infinity)
              .outerShadow
              .roundedSM
              .make(),
          20.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Image.asset(
                  mentorshipStyle,
                  height: 15,
                  width: 15,
                ),
                10.widthBox,
                Text(
                  "Mentorship Style",
                  style: manoropeFontFamily(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: blackcolor),
                ),
              ],
            ),
          ),
          10.heightBox,
          Column(
            crossAxisAlignment: crosstart,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: mainbetween,
                  children: [
                    Obx(
                      () => Text(
                        controller.selectedMentorshipstyle.value,
                        style: manoropeFontFamily(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: blackcolor),
                      ),
                    ),
                    const Icon(Icons.expand_more),
                  ],
                ).box.make().onTap(() {
                  controller.ismentorshipOpen.value =
                      !controller.ismentorshipOpen.value;
                }),
              ),
              Obx(
                () => controller.ismentorshipOpen.value
                    ? Column(
                        children: [
                          10.heightBox,
                          Container(
                            color: greyColor,
                            height: 1,
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              Obx(() => controller.ismentorshipOpen.value
                  ? GetBuilder<MentorEducationBackgroundController>(
                      builder: (contextsss) {
                      return SizedBox(
                        height: 200.h,
                        child: ListView.builder(
                          itemCount: controller.mentorshipstyles.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final skill = controller.mentorshipstyles[index];
                            // final isSelected =
                            //     controller.selectedSkills.contains(skill);
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    skill,
                                    style: manoropeFontFamily(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: blackcolor),
                                  ),
                                ),
                                Container(
                                  color: greyColor,
                                  height: 1,
                                ),
                              ],
                            ).onTap(() {
                              controller.selectedMentorshipstyle.value =
                                  controller.mentorshipstyles[index];
                              controller.ismentorshipOpen.value = false;
                            });
                          },
                        ),
                      );
                    })
                  : const SizedBox.shrink())
            ],
          )
              .box
              .white
              .padding(defaultpad)
              .width(double.infinity)
              .outerShadow
              .margin(
                const EdgeInsets.only(left: 20, right: 20),
              )
              .roundedSM
              .make(),
          20.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/greytimer.png",
                  height: 15,
                  width: 15,
                ),
                10.widthBox,
                Text(
                  "years in industry",
                  style: manoropeFontFamily(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: blackcolor),
                ),
              ],
            ),
          ),
          10.heightBox,
          TextField(
            keyboardType: TextInputType.phone,
            controller: controller.yearsOfExperience.value,
            decoration: InputDecoration(
                hintText: 'eg. 1 year', // Your hint text
                hintStyle: manoropeFontFamily(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: textfieldgrey),
                contentPadding: const EdgeInsets.only(
                    left: 12.0), // Padding from top and left
                border: InputBorder.none),
          )
              .box
              .color(const Color(0xffF4F4F4))
              .margin(const EdgeInsets.only(left: 20, right: 20))
              .roundedSM
              .make(),
          30.heightBox,
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
                buttonName: "Next",
                onPressed: () {
                  Get.toNamed(Routes.MENTOR_AVAILABILITY);
                },
                textcolor: whitecolor,
                loading: false,
                backgroundColor: darkBrownColor,
                rounded: true,
                height: 40.h,
                textSize: 20.sp,
                width: double.infinity),
          ),
          50.heightBox,
        ]));
  }
}
