import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/commonWidgets/commonTextfield.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../resources/colors.dart';
import '../controllers/schedule_session_controller.dart';

class ScheduleSessionView extends GetView<ScheduleSessionController> {
  const ScheduleSessionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ScheduleSessionController());
    var data = Get.arguments;
// controller.fetchSchedulesForMentees();
controller.update();
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
        body: GetBuilder<ScheduleSessionController>(builder: (ctrrr) {
          if (ctrrr.scheduless.isNotEmpty) {
            return Padding(
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
                      "You are booking a meeting with ${data['fullName']}",
                      style: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: darkBrownColor),
                    ),
                  ),
                  30.heightBox,
                  Text(
                    "Appointment Reason",
                    style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                  10.heightBox,
                  commonTextField(
                      obscureText: false,
                      icon: profileicon,
                      hinttext: "Appointment Reason",
                      textEditingController:
                          controller.appointmentReason.value),
                  20.heightBox,
                  Text(
                    "Available Slots",
                    style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                  10.heightBox,
                  GetBuilder<ScheduleSessionController>(builder: (ctr) {
                    return SizedBox(
                      height: 120.h,
                      child: ListView.builder(
                          itemCount: ctr.scheduless.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Obx(
                              () => Column(
                                crossAxisAlignment: crosstart,
                                children: [
                                  10.heightBox,
                                  Text(
                                    ctr.scheduless[index]['day'] == "mon"
                                        ? "Monday"
                                        : ctr.scheduless[index]['day'] == "tue"
                                            ? "Tuesday"
                                            : ctr.scheduless[index]['day'] ==
                                                    "wed"
                                                ? "Wednesday"
                                                : ctr.scheduless[index]
                                                            ['day'] ==
                                                        "thu"
                                                    ? "Thursday"
                                                    : ctr.scheduless[index]
                                                                ['day'] ==
                                                            "fri"
                                                        ? "Friday"
                                                        : ctr.scheduless[index]
                                                                    ['day'] ==
                                                                "sat"
                                                            ? "Saturday"
                                                            : "Sunday",
                                    style: manoropeFontFamily(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: blackcolor),
                                  ),
                                  10.heightBox,
                                  Text(
                                    "Start time:  ${ctr.scheduless[index]['startTime']}",
                                    style: manoropeFontFamily(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: textfieldgrey),
                                  ),
                                  10.heightBox,
                                  Text(
                                    "Ending time:  ${ctr.scheduless[index]['endTime']}",
                                    style: manoropeFontFamily(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: textfieldgrey),
                                  ),
                                  10.heightBox,
                                ],
                              )
                                  .box
                                  .white
                                  .width(130.w)
                                  .clip(Clip.antiAlias)
                                  .roundedSM
                                  .border(
                                      color: ctr.selectedIndex.value == index
                                          ? darkBrownColor
                                          : Colors.transparent,
                                      width: 2)
                                  .outerShadowLg
                                  .margin(defaultpad)
                                  .padding(defaultpad)
                                  .make()
                                  .onTap(() {
                                ctr.selectedIndex.value = index;
                              }),
                            );
                          })),
                    );
                  }),
                  // Row(
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         controller.isDayOpen.value = true;
                  //       },
                  //       child: Container(
                  //         width: 80.w,
                  //         color: whitecolor,
                  //         child: Obx(() => Center(
                  //                 child: Column(
                  //               children: [
                  //                 SizedBox(
                  //                   height: 40.h,
                  //                   child: Center(
                  //                     child: Text(
                  //                       controller.selectedDay.value,
                  //                       style: TextStyle(fontSize: 16.sp),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 controller.isDayOpen.value
                  //                     ? 20.heightBox
                  //                     : const SizedBox.shrink(),
                  //                 controller.isDayOpen.value == true
                  //                     ? ListView.builder(
                  //                         shrinkWrap: true,
                  //                         itemCount: controller.sheduless.length,
                  //                         itemBuilder: (context, index) {
                  //                           return GestureDetector(
                  //                             onTap: () {
                  //                               controller.selectedDay.value =
                  //                                   controller.sheduless[index]
                  //                                       ['day'];
                  //                               controller.isDayOpen.value = false;
                  //                             },
                  //                             child: Column(
                  //                               children: [
                  //                                 Text(controller.sheduless[index]
                  //                                     ['day']),
                  //                                 const Divider()
                  //                               ],
                  //                             ),
                  //                           );
                  //                         })
                  //                     : const SizedBox.shrink(),
                  //               ],
                  //             ))),
                  //       ).box.white.roundedSM.outerShadow.make(),
                  //     ),
                  //     20.widthBox,
                  //     GestureDetector(
                  //       onTap: () {
                  //         controller.isStartTimeOpen.value = true;
                  //       },
                  //       child: Container(
                  //         width: 80.w,
                  //         color: whitecolor,
                  //         child: Obx(() => Center(
                  //                 child: Column(
                  //               children: [
                  //                 SizedBox(
                  //                   height: 40.h,
                  //                   child: Center(
                  //                     child: Text(
                  //                       controller.selectedStartTime.value,
                  //                       style: TextStyle(fontSize: 16.sp),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 controller.isStartTimeOpen.value
                  //                     ? 20.heightBox
                  //                     : const SizedBox.shrink(),
                  //                 controller.isStartTimeOpen.value == true
                  //                     ? ListView.builder(
                  //                         shrinkWrap: true,
                  //                         itemCount: controller.sheduless.length,
                  //                         itemBuilder: (context, index) {
                  //                           return GestureDetector(
                  //                             onTap: () {
                  //                               controller.selectedStartTime.value =
                  //                                   controller.sheduless[index]
                  //                                       ['startTime'];
                  //                               controller.isStartTimeOpen.value =
                  //                                   false;
                  //                             },
                  //                             child: Column(
                  //                               children: [
                  //                                 Text(controller.sheduless[index]
                  //                                     ['startTime']),
                  //                                 const Divider()
                  //                               ],
                  //                             ),
                  //                           );
                  //                         })
                  //                     : const SizedBox.shrink(),
                  //               ],
                  //             ))),
                  //       ).box.white.roundedSM.outerShadow.make(),
                  //     ),
                  //     20.widthBox,
                  //     GestureDetector(
                  //       onTap: () {
                  //         controller.isEndTimeOpen.value = true;
                  //       },
                  //       child: Container(
                  //         width: 80.w,
                  //         color: whitecolor,
                  //         child: Obx(() => Center(
                  //                 child: Column(
                  //               children: [
                  //                 SizedBox(
                  //                   height: 40.h,
                  //                   child: Center(
                  //                     child: Text(
                  //                       controller.selectedEndTime.value,
                  //                       style: TextStyle(fontSize: 16.sp),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 controller.isEndTimeOpen.value
                  //                     ? 20.heightBox
                  //                     : const SizedBox.shrink(),
                  //                 controller.isEndTimeOpen.value == true
                  //                     ? ListView.builder(
                  //                         shrinkWrap: true,
                  //                         itemCount: controller.sheduless.length,
                  //                         itemBuilder: (context, index) {
                  //                           return GestureDetector(
                  //                             onTap: () {
                  //                               controller.selectedEndTime.value =
                  //                                   controller.sheduless[index]
                  //                                       ['endTime'];
                  //                               controller.isEndTimeOpen.value =
                  //                                   false;
                  //                             },
                  //                             child: Column(
                  //                               children: [
                  //                                 Text(controller.sheduless[index]
                  //                                     ['endTime']),
                  //                                 const Divider()
                  //                               ],
                  //                             ),
                  //                           );
                  //                         })
                  //                     : const SizedBox.shrink(),
                  //               ],
                  //             ))),
                  //       ).box.white.roundedSM.outerShadow.make(),
                  //     ),
                  //   ],
                  // ),
                  // ListView.builder(
                  //     itemCount: controller.shedules.length,
                  //     itemBuilder: (context, index) {
                  //       return Column(
                  //         children: [
                  //           Text(controller.shedules[index]['day']),
                  //         ],
                  //       );
                  //     }),
                  40.heightBox,
                  CustomButton(
                      buttonName: "Book",
                      onPressed: () {
                        if (controller
                            .appointmentReason.value.text.isNotEmpty) {
                          controller.createMeetingWithMentor();
                        } else {
                          Utils.snakbar(
                              title: "Error",
                              body: "Please select all the required fields");
                        }
                      },
                      textcolor: whitecolor,
                      loading: false,
                      backgroundColor: darkBrownColor,
                      rounded: true,
                      height: 40.h,
                      textSize: 15.sp,
                      width: double.infinity)
                ],
              ),
            );
          } 
          else{
            return const Center(child:  Text("Not availiblity"),);
          }
        }));
  }
}
