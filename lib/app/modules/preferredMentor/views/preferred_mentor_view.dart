import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../commonWidgets/manoropeFontFamily.dart';
import '../../../resources/colors.dart';
import '../../../resources/icons.dart';
import '../controllers/preferred_mentor_controller.dart';

class PreferredMentorView extends GetView<PreferredMentorController> {
  const PreferredMentorView({Key? key}) : super(key: key);
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
            'Profile',
            style: GoogleFonts.manrope(
                fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: pad18,
            child: ListView(  children: [
              10.heightBox,
              Center(
                child: Text(
                  "Preferred mentor characteristics",
                  style: GoogleFonts.manrope(
                      fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
              ),
              20.heightBox,
              Padding(
                padding: pad12,
                child: Row(
                  children: [
                    Image.asset(gender,height: 13,width: 13,),
                    10.widthBox,
                    Text(
                      "Gender",
                      style: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: blackcolor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: [
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
                            value: controller.selectedGender.value == 'male',
                            onChanged: (bool? value) {
                              if (value != null && value) {
                                controller.setSelectedGender('male');
                              }
                            },
                          ),
                          Text(
                            "Male",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.widthBox,
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
                            value: controller.selectedGender.value == 'female',
                            onChanged: (bool? value) {
                              if (value != null && value) {
                                controller.setSelectedGender('female');
                              }
                            },
                          ),
                          Text(
                            "Female",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              20.heightBox,
              Row(
                children: [
                  Image.asset(mentorshipStyle,height: 15,width: 15,),
                  10.widthBox,
                  Text(
                    "Mentorship Style",
                    style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                ],
              ),
              20.heightBox,
                Column(
                crossAxisAlignment: crosstart,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        Text(
                          "Select",
                          style: manoropeFontFamily(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: blackcolor),
                        ),
                        const Icon(Icons.expand_more),
                      ],
                    ).box.make().onTap(() {
                      controller.isCertificateOpen.value =
                          !controller.isCertificateOpen.value;
                    }),
                  ),
                  Obx(
                    () => controller.isCertificateOpen.value
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
                  Obx(() => controller.isCertificateOpen.value
                      ? GetBuilder<PreferredMentorController>(
                          builder: (contextsss) {
                          return SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                              itemCount:
                                  controller.computerScienceSkills.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final skill =
                                    controller.computerScienceSkills[index];
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
                                      //   trailing: isSelected == true
                                      //       ? SizedBox(
                                      //           height: 10.h,
                                      //           width: 10.h,
                                      //         )
                                      //           .box
                                      //           .color(darkBrownColor)
                                      //           .rounded
                                      //           .make()
                                      //       : SizedBox(
                                      //           height: 10.h,
                                      //           width: 10.h,
                                      //         )
                                      //           .box
                                      //           .border(color: darkBrownColor)
                                      //           .rounded
                                      //           .make(),
                                      // ).box.make().onTap(() {
                                      //   if (controller.selectedSkills.length > 4) {
                                      //     if (isSelected) {
                                      //       controller.selectedSkills.remove(skill);
                                      //       contextsss.update();
                                      //     } else {
                                      //       Utils.snakbar(
                                      //           title: 'Maximum 5 goals',
                                      //           body:
                                      //               'You cannot select more than 5 goals.');
                                      //     }
                                      //   } else {
                                      //     if (isSelected) {
                                      //       controller.selectedSkills.remove(skill);
                                      //       contextsss.update();
                                      //     } else {
                                      //       controller.selectedSkills.add(skill);
                                      //       contextsss.update();
                                      //     }
                                      //   }
                                      // }),
                                    ),
                                    Container(
                                      color: greyColor,
                                      height: 1,
                                    ),
                                  ],
                                );
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
                  .roundedSM
                  .make(),
              30.heightBox,
              Row(
                children: [
                  Image.asset(industry,height: 20,width: 20,),
                  10.widthBox,
                  Text(
                    "Industry",
                    style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                ],
              ),
              20.heightBox,
                Column(
                crossAxisAlignment: crosstart,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        Text(
                          "Select",
                          style: manoropeFontFamily(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: blackcolor),
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
                      ? GetBuilder<PreferredMentorController>(
                          builder: (contextsss) {
                          return SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                              itemCount:
                                  controller.industries.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final skill =
                                    controller.industries[index];
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
                                      //   trailing: isSelected == true
                                      //       ? SizedBox(
                                      //           height: 10.h,
                                      //           width: 10.h,
                                      //         )
                                      //           .box
                                      //           .color(darkBrownColor)
                                      //           .rounded
                                      //           .make()
                                      //       : SizedBox(
                                      //           height: 10.h,
                                      //           width: 10.h,
                                      //         )
                                      //           .box
                                      //           .border(color: darkBrownColor)
                                      //           .rounded
                                      //           .make(),
                                      // ).box.make().onTap(() {
                                      //   if (controller.selectedSkills.length > 4) {
                                      //     if (isSelected) {
                                      //       controller.selectedSkills.remove(skill);
                                      //       contextsss.update();
                                      //     } else {
                                      //       Utils.snakbar(
                                      //           title: 'Maximum 5 goals',
                                      //           body:
                                      //               'You cannot select more than 5 goals.');
                                      //     }
                                      //   } else {
                                      //     if (isSelected) {
                                      //       controller.selectedSkills.remove(skill);
                                      //       contextsss.update();
                                      //     } else {
                                      //       controller.selectedSkills.add(skill);
                                      //       contextsss.update();
                                      //     }
                                      //   }
                                      // }),
                                    ),
                                    Container(
                                      color: greyColor,
                                      height: 1,
                                    ),
                                  ],
                                );
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
                  .roundedSM
                  .make(),
              20.heightBox,
              Text(
                "Add general about me section",
                style: manoropeFontFamily(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: blackcolor),
              ),
              10.heightBox,
               TextField(
                maxLines: null, // Allow multiple lines of text
                minLines: 5,
                decoration: InputDecoration(
                  hintText: 'Write...', // Your hint text
                  hintStyle: manoropeFontFamily(fontSize: 12, fontWeight: FontWeight.w400, color: blackcolor),
                  contentPadding: const EdgeInsets.only(
                      top: 12.0, left: 12.0), // Padding from top and left
                border: InputBorder.none
                ),
              ).box.white.roundedSM.outerShadow.make(),
             100.heightBox,
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: CustomButton(
                    buttonName: "Continue",
                    onPressed: () {
                      Get.toNamed(Routes.AVAILBILITY);
                    },
                    textcolor: whitecolor,
                    loading: false,
                    backgroundColor: darkBrownColor,
                    rounded: true,
                    height: 50,
                    textSize: 16,
                    width: double.infinity),
              ),
              20.heightBox,
            ])));
  }
}
