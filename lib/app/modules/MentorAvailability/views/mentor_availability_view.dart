import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../resources/alignments.dart';
import '../controllers/mentor_availability_controller.dart';

class MentorAvailabilityView extends GetView<MentorAvailabilityController> {
  const MentorAvailabilityView({Key? key}) : super(key: key);
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
        body: SafeArea(
            child: ListView(
          children: [
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
                    "Days of the week available",
                    style: manoropeFontFamily(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
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
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return halfwhitecolor;
                              }
                              return Colors.transparent;
                            },
                          ),
                          value: controller.availabilityList
                              .contains(controller.daysOfWeek[index]),
                          onChanged: (bool? value) {
                            if (value != null) {
                              String selectedDay = controller.daysOfWeek[index];
                              if (value) {
                                if (!controller.availabilityList
                                    .contains(selectedDay)) {
                                  controller.availabilityList.add(selectedDay);
                                }
                              } else {
                                controller.availabilityList.remove(selectedDay);
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
            10.heightBox,
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: [
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
                        style:  manoropeFontFamily(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: blackcolor),
                      ),
                    ],
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
                      ? GetBuilder<MentorAvailabilityController>(
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
                ],
              ),
            ),
            20.heightBox,
             Padding(
               padding: EdgeInsets.only(left: 20,right: 20),
               child: Column(
                 children: [
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
                          style:  manoropeFontFamily(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: blackcolor),
                        ),
                      ],
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
                      ? GetBuilder<MentorAvailabilityController>(
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
                 ],
               ),
             ),
              20.heightBox,
             Padding(
               padding: EdgeInsets.only(left: 20,right: 20),
               child: Row(
                  children: [
                    Image.asset(
                      daysoftheweek,
                      width: 15,
                      height: 15,
                    ),
                    10.widthBox,
                    Text(
                      "Preferred communication channel",
                      style: manoropeFontFamily(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
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
                    controller.communitcationChannels.length,
                    (index) => Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            checkColor: blackcolor,
                            side: const BorderSide(color: greyColor),
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
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
               20.heightBox,
             Padding(
               padding: EdgeInsets.only(left: 20,right: 20),
               child: Column(
                 children: [
                   Row(
                      children: [
                        Image.asset(
                          mentorshipStyle,
                          height: 15,
                          width: 15,
                        ),
                        10.widthBox,
                        Text(
                          "Availability status",
                          style:  manoropeFontFamily(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: blackcolor),
                        ),
                      ],
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
                            controller.selectedStatus.value,
                            style: manoropeFontFamily(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: blackcolor),
                          ),
                        ),
                        const Icon(Icons.expand_more),
                      ],
                    ).box.make().onTap(() {
                      controller.isStatusOpen.value =
                          !controller.isStatusOpen.value;
                    }),
                  ),
                  Obx(
                    () => controller.isStatusOpen.value
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
                  Obx(() => controller.isStatusOpen.value
                      ? GetBuilder<MentorAvailabilityController>(
                          builder: (contextsss) {
                          return SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                              itemCount: controller.availablityStatus.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final skill = controller.availablityStatus[index];
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
                                  controller.selectedStatus.value =
                                      controller.availablityStatus[index];
                                  controller.isStatusOpen.value = false;
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
                 ],
               ),
             ),
             20.heightBox,
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomButton(buttonName: "Save Profile", onPressed: (){
                  Get.toNamed(Routes.CONGRATULATIONS);
                }, textcolor: whitecolor, loading: false, backgroundColor: darkBrownColor, rounded: true, height: 40.h, textSize: 20.sp, width: double.infinity),
              ),
          50.heightBox, 
          ],
        )));
  }
}
