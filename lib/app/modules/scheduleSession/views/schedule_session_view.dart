import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../resources/colors.dart';
import '../controllers/schedule_session_controller.dart';

class ScheduleSessionView extends GetView<ScheduleSessionController> {
  const ScheduleSessionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Schedule Session',
            style: GoogleFonts.manrope(
                fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          centerTitle: false,
        ),
        body: Padding(
          padding: pad20,
          child: ListView(
            children: [
              20.heightBox,
              Center(
                child: Image.asset(
                  timer,
                  width: 30,
                  height: 30,
                ),
              ),
              5.heightBox,
              Center(
                child: Text(
                  "Schedule session",
                  style: manoropeFontFamily(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: blackcolor),
                ),
              ),
              5.heightBox,
              Center(
                child: Text(
                  "You are booking with Jhon",
                  style: manoropeFontFamily(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: darkBrownColor),
                ),
              ),
              30.heightBox,
              Text(
                "Choose Industry",
                style: manoropeFontFamily(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: blackcolor),
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
                        Text(
                          "Skills Name",
                          style: manoropeFontFamily(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: blackcolor.withOpacity(0.5)),
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
                      ? GetBuilder<ScheduleSessionController>(
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
                  .color(Color(0xffF6F6F6))
                  .padding(pad14)
                  .width(double.infinity)
                  .rounded
                  .make(),
              20.heightBox,
              Text(
                "Session type",
                style: manoropeFontFamily(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: blackcolor),
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
                        Text(
                          "Select",
                          style: manoropeFontFamily(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: blackcolor.withOpacity(0.5)),
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
                      ? GetBuilder<ScheduleSessionController>(
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
                  .color(Color(0xffF6F6F6))
                  .padding(pad14)
                  .width(double.infinity)
                  .rounded
                  .make(),
              20.heightBox,
              Text(
                "Available Slots",
                style: manoropeFontFamily(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: blackcolor),
              ),
              10.heightBox,
              SizedBox(
                height: 110.h,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Obx(
                        () => Column(
                          children: [
                            10.heightBox,
                            Text(
                              "Fri",
                              style: manoropeFontFamily(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: blackcolor),
                            ),
                            10.heightBox,
                            Text(
                              "24 june",
                              style: manoropeFontFamily(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textfieldgrey),
                            ),
                            10.heightBox,
                            Text(
                              "5 Slots",
                              style: manoropeFontFamily(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: darkBrownColor),
                            ),
                          ],
                        )
                            .box
                            .white
                            .width(80.w)
                            .clip(Clip.antiAlias)
                            .roundedSM
                            .border(
                                color: controller.selectedIndex.value == index
                                    ? darkBrownColor
                                    : Colors.transparent,
                                width: 2)
                            .outerShadowLg
                            .margin(defaultpad)
                            .padding(defaultpad)
                            .make()
                            .onTap(() {
                          controller.selectedIndex.value = index;
                        }),
                      );
                    })),
              ),
              20.heightBox,
              Text(
                "Time",
                style: manoropeFontFamily(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: blackcolor),
              ),
              10.heightBox,
              SizedBox(
                height: 36.h,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Obx(
                        () => SizedBox(
                          child: Center(
                            child: Text(
                              "12 pm",
                              style: manoropeFontFamily(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: darkBrownColor),
                            ),
                          ),
                        )
                            .box
                            .white
                            .clip(Clip.antiAlias)
                            .roundedLg
                            .width(70.w)
                            .border(
                                color: controller.selectedIndexOfTime.value ==
                                        index
                                    ? darkBrownColor
                                    : Colors.transparent,
                                width: 2)
                            .outerShadow
                            .margin(defaultpad)
                            .make()
                            .onTap(() {
                          controller.selectedIndexOfTime.value = index;
                        }),
                      );
                    })),
              ),
              40.heightBox,
              CustomButton(
                  buttonName: "Book",
                  onPressed: () {},
                  textcolor: whitecolor,
                  loading: false,
                  backgroundColor: darkBrownColor,
                  rounded: true,
                  height: 40.h,
                  textSize: 15.sp,
                  width: double.infinity)
            ],
          ),
        ));
  }
}
