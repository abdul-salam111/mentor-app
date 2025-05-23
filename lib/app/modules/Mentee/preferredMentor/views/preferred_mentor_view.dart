import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../commonWidgets/manoropeFontFamily.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/icons.dart';
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
            child: ListView(children: [
              10.heightBox,
              Center(
                child: Text(
                  "Tell us about your perfect mentor!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                      fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
              ),
              20.heightBox,
              Padding(
                padding: pad12,
                child: Row(
                  children: [
                    Icon(Icons.person_outline_outlined),
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
              FittedBox(
                child: Row(
                  children: [
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
                    20.widthBox,
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
                    20.widthBox,
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
                            value: controller.selectedGender.value == 'other',
                            onChanged: (bool? value) {
                              if (value != null && value) {
                                controller.setSelectedGender('other');
                              }
                            },
                          ),
                          Text(
                            "No Preference",
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
                  Image.asset(
                    mentorshipStyle,
                    height: 15,
                    width: 15,
                  ),
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

              // Padding(
              //   padding: const EdgeInsets.only(left: 4, right: 4),
              //   child: Column(
              //     crossAxisAlignment: crosstart,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(left: 16),
              //         child: Row(
              //           mainAxisAlignment: mainbetween,
              //           children: [
              //             Obx(
              //               () => Text(
              //                 controller.selectedMentorshipstyle.value,
              //                 style: manoropeFontFamily(
              //                     fontSize: 10.sp,
              //                     fontWeight: FontWeight.w400,
              //                     color: blackcolor),
              //               ),
              //             ),
              //             const Icon(Icons.expand_more),
              //           ],
              //         ).box.make().onTap(() {
              //           controller.ismentorshipOpen.value =
              //               !controller.ismentorshipOpen.value;
              //         }),
              //       ),
              //       Obx(
              //         () => controller.ismentorshipOpen.value
              //             ? Column(
              //                 children: [
              //                   10.heightBox,
              //                   Container(
              //                     color: greyColor,
              //                     height: 1,
              //                   ),
              //                 ],
              //               )
              //             : const SizedBox.shrink(),
              //       ),
              //       Obx(() => controller.ismentorshipOpen.value
              //           ? GetBuilder<PreferredMentorController>(
              //               builder: (contextsss) {
              //               return SizedBox(
              //                 height: 200.h,
              //                 child: ListView.builder(
              //                   itemCount: controller.mentorshipstyles.length,
              //                   shrinkWrap: true,
              //                   itemBuilder: (context, index) {
              //                     final skill =
              //                         controller.mentorshipstyles[index];
              //                     // final isSelected =
              //                     //     controller.selectedSkills.contains(skill);
              //                     return Column(
              //                       children: [
              //                         ListTile(
              //                           leading: Image.asset(controller.mentorshipImages[index],height: 30,width: 30,),
              //                           title: Text(
              //                             skill,
              //                             style: manoropeFontFamily(
              //                                 fontSize: 10.sp,
              //                                 fontWeight: FontWeight.w400,
              //                                 color: blackcolor),
              //                           ),
              //                         ),
              //                         Container(
              //                           color: greyColor,
              //                           height: 1,
              //                         ),
              //                       ],
              //                     ).onTap(() {
              //                       controller.selectedMentorshipstyle.value =
              //                           controller.mentorshipstyles[index];
              //                       controller.ismentorshipOpen.value = false;
              //                     });
              //                   },
              //                 ),
              //               );
              //             })
              //           : const SizedBox.shrink())
              //     ],
              //   )
              //       .box
              //       .white
              //       .padding(defaultpad)
              //       .width(double.infinity)
              //       .outerShadow
              //       .roundedSM
              //       .make(),
              // ),

              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Column(
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
                        ? GetBuilder<PreferredMentorController>(
                            builder: (contextsss) {
                            return SizedBox(
                              height: 200.h,
                              child: ListView.builder(
                                itemCount: controller.mentorshipstyles.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final skill =
                                      controller.mentorshipstyles[index];
                                  return Column(
                                    children: [
                                      ListTile(
                                        leading: Image.asset(
                                          controller.mentorshipImages[index],
                                          height: 30,
                                          width: 30,
                                        ),
                                        title: Text(
                                          skill,
                                          style: manoropeFontFamily(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: blackcolor),
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(Icons.info_outline,
                                              color: textfieldgrey),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text(skill),
                                                content: Text(
                                                    getMentorshipDescription(
                                                        index)),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Close'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
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
                    .roundedSM
                    .make(),
              ),

              30.heightBox,
              Row(
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
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                ],
              ),
              20.heightBox,
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Column(
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
                        ? GetBuilder<PreferredMentorController>(
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
                    .padding(defaultpad)
                    .width(double.infinity)
                    .outerShadow
                    .roundedSM
                    .make(),
              ),
              20.heightBox,
              Text(
                "Add general about me section",
                style: manoropeFontFamily(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: blackcolor),
              ),
              10.heightBox,
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: TextField(
                  maxLines: null, // Allow multiple lines of text
                  minLines: 5,

                  controller: controller.aboutMe.value,
                  maxLength: 200,
                  decoration: InputDecoration(
                      hintText: 'Write...', // Your hint text
                      hintStyle: manoropeFontFamily(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: blackcolor),
                      contentPadding: const EdgeInsets.only(
                          top: 12.0, left: 12.0), // Padding from top and left
                      border: InputBorder.none),
                ).box.white.roundedSM.outerShadow.make(),
              ),
              100.heightBox,
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: CustomButton(
                    buttonName: "Continue",
                    onPressed: () {
                      if (controller.selectedGender.isNotEmpty &&
                          controller.selectedGender.value != '' &&
                          controller.selectedMentorshipstyle.value !=
                              "Select" &&
                          controller.selectedIndustries.value != "Select" &&
                          controller.aboutMe.value.text.isNotEmpty) {
                        Get.toNamed(Routes.AVAILBILITY);
                      } else if (controller.selectedGender.isEmpty ||
                          controller.selectedGender.value == '') {
                        Utils.snakbar(
                            title: "Select Gender",
                            body: "Please select any gender.");
                      } else if (controller.selectedMentorshipstyle.value ==
                          "Select") {
                        Utils.snakbar(
                            title: "Select Mentorship Style",
                            body: "Please select any mentorship style.");
                      } else if (controller.selectedIndustries.value ==
                          "Select") {
                        Utils.snakbar(
                            title: "Select Industry",
                            body: "Please select any Industry.");
                      } else if (controller.aboutMe.value.text.isEmpty) {
                        Utils.snakbar(
                            title: "About me",
                            body: "Please write something about yourself.");
                      }
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

  String getMentorshipDescription(int index) {
    switch (index) {
      case 0:
        return "A classic one-on-one mentorship where the mentor provides guidance and advice based on their experience.";
      case 1:
        return "Tailors the mentorship approach based on specific situations or challenges faced by the mentee.";
      case 2:
        return "Involves mentoring between individuals at a similar career level, promoting mutual learning and support.";
      case 3:
        return "Focuses on guiding mentees interested in entrepreneurship and starting their own ventures.";
      case 4:
        return "Addresses challenges specific to various life stages, such as early career, mid-career, pre-retirement, and career transition mentorship.";
      default:
        return "No description available.";
    }
  }
}
