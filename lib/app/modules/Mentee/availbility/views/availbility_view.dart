import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/modules/Mentee/availbility/controllers/availbility_controller.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../commonWidgets/manoropeFontFamily.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/icons.dart';

class AvailbilityView extends GetView<AvailbilityController> {
  const AvailbilityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AvailbilityController());
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
              Obx(
                () => Container(
                  height: 70.h,
                  width: 70,
                  color: greyColor,
                  child: Center(
                    child: controller.imageFile.value == null
                        ? Column(mainAxisAlignment: maincenter, children: [
                            const Icon(Icons.upload_file),
                            5.heightBox,
                            Text(
                              "Upload",
                              style: manoropeFontFamily(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: blackcolor),
                            )
                          ])
                        : Image(
                            image: FileImage(
                                File(controller.imageFile.value!.path))),
                  ),
                ).box.roundedFull.clip(Clip.antiAlias).make().onTap(() {
                  controller.pickImage();
                }),
              ),
              10.heightBox,
              Center(
                child: Text(
                  "Tell us when you are available to meet with your mentor!",
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
                    Image.asset(
                      daysoftheweek,
                      width: 15,
                      height: 15,
                    ),
                    10.widthBox,
                    Text(
                      "Availablity",
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
                child: Wrap(
                  spacing: 5.0, // Adjust the spacing between checkboxes
                  children: List.generate(
                    controller.daysOfWeek.length,
                    (index) => Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            checkColor: blackcolor,
                            side: const BorderSide(color: greyColor),
                            fillColor: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
                                  return halfwhitecolor;
                                }
                                return Colors.transparent;
                              },
                            ),
                            value: controller.availabilityList
                                .contains(controller.daysOfWeek[index]),
                            onChanged: (bool? value) {
                              if (value != null) {
                                String selectedDay =
                                    controller.daysOfWeek[index];
                                if (value) {
                                  if (!controller.availabilityList
                                      .contains(selectedDay)) {
                                    controller.availabilityList
                                        .add(selectedDay);
                                  }
                                } else {
                                  controller.availabilityList
                                      .remove(selectedDay);
                                }
                              }
                            },
                          ),
                          Text(
                            controller.daysOfWeek[index],
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                    "Time Zone",
                    style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                ],
              ),
              20.heightBox,
              Padding(
                padding: const EdgeInsets.only(left:4.0,right: 4),
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
                              controller.selectedTimeZone.value,
                              style: manoropeFontFamily(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackcolor),
                            ),
                          ),
                          const Icon(Icons.expand_more),
                        ],
                      ).box.make().onTap(() {
                        controller.isOpen.value = !controller.isOpen.value;
                      }),
                    ),
                    Obx(
                      () => controller.isOpen.value
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
                    Obx(() => controller.isOpen.value
                        ? GetBuilder<AvailbilityController>(
                            builder: (contextsss) {
                            return SizedBox(
                              height: 200.h,
                              child: ListView.builder(
                                itemCount: controller.timezones.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final skill = controller.timezones[index];
                
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
                                    controller.selectedTimeZone.value =
                                        controller.timezones[index];
                                    controller.isOpen.value = false;
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
              Row(
                children: [
                  Image.asset(
                    mentorshipStyle,
                    height: 15,
                    width: 15,
                  ),
                  10.widthBox,
                  Text(
                    "Duration of mentor session",
                    style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                ],
              ),
              20.heightBox,
              Padding(
           padding: const EdgeInsets.only(left:4.0,right: 4),
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
                              controller.selectedDuration.value,
                              style: manoropeFontFamily(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackcolor),
                            ),
                          ),
                          const Icon(Icons.expand_more),
                        ],
                      ).box.make().onTap(() {
                        controller.isDurationOpen.value =
                            !controller.isDurationOpen.value;
                      }),
                    ),
                    Obx(
                      () => controller.isDurationOpen.value
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
                    Obx(() => controller.isDurationOpen.value
                        ? GetBuilder<AvailbilityController>(
                            builder: (contextsss) {
                            return SizedBox(
                              height: 200.h,
                              child: ListView.builder(
                                itemCount: controller.durations.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final skill = controller.durations[index];
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
                                  ).onTap(() {
                                    controller.selectedDuration.value =
                                        controller.durations[index];
                                    controller.isDurationOpen.value = false;
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
              Row(
                children: [
                  Image.asset(
                    daysoftheweek,
                    width: 15,
                    height: 15,
                  ),
                  10.widthBox,
                  Text(
                    "Put preferred communication channel first",
                    style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                ],
              ),
              10.heightBox,
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Wrap(
                  spacing: 5.0, // Adjust the spacing between checkboxes
                  children: List.generate(
                    controller.communitcationChannels.length,
                    (index) => Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            checkColor: blackcolor,
                            side: const BorderSide(color: greyColor),
                            fillColor: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
                                  return halfwhitecolor;
                                }
                                return Colors.transparent;
                              },
                            ),
                            value: controller.selectedChannles.contains(
                                controller.communitcationChannels[index]),
                            onChanged: (bool? value) {
                              if (value != null) {
                                String selectedChannel =
                                    controller.communitcationChannels[index];
                                if (value) {
                                  if (!controller.selectedChannles
                                      .contains(selectedChannel)) {
                                    controller.selectedChannles
                                        .add(selectedChannel);
                                  }
                                } else {
                                  controller.selectedChannles
                                      .remove(selectedChannel);
                                }
                              }
                            },
                          ),
                          Text(
                            controller.communitcationChannels[index],
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              50.heightBox,
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: CustomButton(
                    buttonName: "Save Profile",
                    onPressed: () {
                      if (controller.availabilityList.isNotEmpty &&
                          controller.selectedTimeZone.value != "Select" &&
                          controller.selectedDuration.value != "Select" &&
                          controller.selectedChannles.isNotEmpty &&
                          controller.imageFile.value != null) {
                        controller.createMentee();
                      } else if (controller.availabilityList.isEmpty) {
                        Utils.snakbar(
                            title: "Select Availability",
                            body: "Please select Availability");
                      } else if (controller.selectedTimeZone.value ==
                          "Select") {
                        Utils.snakbar(
                            title: "Select timezone",
                            body: "Please select any of timezone.");
                      } else if (controller.selectedDuration.value ==
                          "Select") {
                        Utils.snakbar(
                            title: "Select Duration",
                            body: "Please select any of duration.");
                      } else if (controller.imageFile.value == null) {
                        Utils.snakbar(
                            title: "Select Image!",
                            body: "Please select profile image");
                      } else if (controller.selectedChannles.isEmpty) {
                        Utils.snakbar(
                            title: "Select communication",
                            body:
                                "Please select any of Communication channel.");
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
}
