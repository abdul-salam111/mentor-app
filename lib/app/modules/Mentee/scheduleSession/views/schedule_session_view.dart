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

// class ScheduleSessionView extends GetView<ScheduleSessionController> {
//   const ScheduleSessionView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Get.put(ScheduleSessionController());
//     var data = Get.arguments;
// // controller.fetchSchedulesForMentees();
//     controller.update();
//     return Scaffold(
//         backgroundColor: whitecolor,
//         appBar: AppBar(
//           leading: IconButton(
//               onPressed: () {
//                 Get.back();
//               },
//               icon: const Icon(Icons.arrow_back)),
//           title: Text(
//             'Schedule Session',
//             style: GoogleFonts.manrope(
//                 fontSize: 14.sp, fontWeight: FontWeight.w500),
//           ),
//           centerTitle: false,
//         ),
//         body: GetBuilder<ScheduleSessionController>(builder: (ctrrr) {
//           if (ctrrr.scheduless.isNotEmpty) {
//             var name = data['fullName'];
//             return Padding(
//               padding: pad20,
//               child: ListView(
//                 children: [
//                   20.heightBox,
//                   Center(
//                     child: Image.asset(
//                       timer,
//                       width: 30,
//                       height: 30,
//                     ),
//                   ),
//                   5.heightBox,
//                   Center(
//                     child: Text(
//                       "Schedule session",
//                       style: manoropeFontFamily(
//                           fontSize: 11.sp,
//                           fontWeight: FontWeight.w500,
//                           color: blackcolor),
//                     ),
//                   ),
//                   5.heightBox,
//                   Center(
//                     child: Text(
//                       "You are booking a meeting with $name",
//                       style: manoropeFontFamily(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w500,
//                           color: darkBrownColor),
//                     ),
//                   ),
//                   30.heightBox,
//                   Text(
//                     "Appointment Reason",
//                     style: manoropeFontFamily(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w500,
//                         color: blackcolor),
//                   ),
//                   10.heightBox,
//                   commonTextField(
//                       obscureText: false,
//                       icon: profileicon,
//                       hinttext: "Appointment Reason",
//                       textEditingController:
//                           controller.appointmentReason.value),
//                   20.heightBox,
//                   Text(
//                     "Available Slots",
//                     style: manoropeFontFamily(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w500,
//                         color: blackcolor),
//                   ),
//                   10.heightBox,
//                   GetBuilder<ScheduleSessionController>(builder: (ctr) {
//                     return SizedBox(
//                       height: 120.h,
//                       child: ListView.builder(
//                           itemCount: ctr.scheduless.length,
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: ((context, index) {
//                             return Obx(
//                               () => FittedBox(
//                                 child: Column(
//                                   crossAxisAlignment: crosstart,
//                                   children: [
//                                     10.heightBox,
//                                     Text(
//                                       ctr.scheduless[index]['day'] == "mon"
//                                           ? "Monday"
//                                           : ctr.scheduless[index]['day'] ==
//                                                   "tue"
//                                               ? "Tuesday"
//                                               : ctr.scheduless[index]['day'] ==
//                                                       "wed"
//                                                   ? "Wednesday"
//                                                   : ctr.scheduless[index]
//                                                               ['day'] ==
//                                                           "thu"
//                                                       ? "Thursday"
//                                                       : ctr.scheduless[index]
//                                                                   ['day'] ==
//                                                               "fri"
//                                                           ? "Friday"
//                                                           : ctr.scheduless[
//                                                                           index]
//                                                                       ['day'] ==
//                                                                   "sat"
//                                                               ? "Saturday"
//                                                               : "Sunday",
//                                       style: manoropeFontFamily(
//                                           fontSize: 12.sp,
//                                           fontWeight: FontWeight.w500,
//                                           color: blackcolor),
//                                     ),
//                                     10.heightBox,
//                                     Text(
//                                       "Avaliablity",
//                                       style: manoropeFontFamily(
//                                           fontSize: 11.sp,
//                                           fontWeight: FontWeight.w500,
//                                           color: textfieldgrey),
//                                     ),
//                                     10.heightBox,
//                                     Text(
//                                       "${ctr.scheduless[index]['startTime']} - ${ctr.scheduless[index]['endTime']}",
//                                       style: manoropeFontFamily(
//                                           fontSize: 11.sp,
//                                           fontWeight: FontWeight.w500,
//                                           color: textfieldgrey),
//                                     ),
//                                     10.heightBox,
//                                   ],
//                                 )
//                                     .box
//                                     .white
//                                     .width(130.w)
//                                     .clip(Clip.antiAlias)
//                                     .roundedSM
//                                     .border(
//                                         color: ctr.selectedIndex.value == index
//                                             ? darkBrownColor
//                                             : Colors.transparent,
//                                         width: 2)
//                                     .outerShadowLg
//                                     .margin(defaultpad)
//                                     .padding(defaultpad)
//                                     .make()
//                                     .onTap(() {
//                                   ctr.selectedIndex.value = index;
//                                 }),
//                               ),
//                             );
//                           })),
//                     );
//                   }),

//                   40.heightBox,
//                   CustomButton(
//                       buttonName: "Book",
//                       onPressed: () {
//                         if (controller
//                             .appointmentReason.value.text.isNotEmpty) {
//                           controller.createMeetingWithMentor(name);
//                         } else {
//                           Utils.snakbar(
//                               title: "Error",
//                               body: "Please select all the required fields");
//                         }
//                       },
//                       textcolor: whitecolor,
//                       loading: false,
//                       backgroundColor: darkBrownColor,
//                       rounded: true,
//                       height: 40.h,
//                       textSize: 15.sp,
//                       width: double.infinity)
//                 ],
//               ),
//             );
//           } else {
//             return const Center(
//               child: Text("Not availiblity"),
//             );
//           }
//         }));
//   }
// }

class ScheduleSessionView extends GetView<ScheduleSessionController> {
  const ScheduleSessionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ScheduleSessionController());
    var data = Get.arguments;
    controller.update();

    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Schedule Session',
          style: GoogleFonts.manrope(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: GetBuilder<ScheduleSessionController>(builder: (ctrrr) {
        if (ctrrr.scheduless.isNotEmpty) {
          var name = data['fullName'];
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
                      color: blackcolor,
                    ),
                  ),
                ),
                5.heightBox,
                Center(
                  child: Text(
                    "You are booking a meeting with $name",
                    style: manoropeFontFamily(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: darkBrownColor,
                    ),
                  ),
                ),
                30.heightBox,
                Text(
                  "Appointment Reason",
                  style: manoropeFontFamily(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: blackcolor,
                  ),
                ),
                10.heightBox,
                commonTextField(
                  obscureText: false,
                  icon: profileicon,
                  hinttext: "Appointment Reason",
                  textEditingController: controller.appointmentReason.value,
                ),
                20.heightBox,
                Text(
                  "Available Slots",
                  style: manoropeFontFamily(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: blackcolor,
                  ),
                ),
                10.heightBox,
                GetBuilder<ScheduleSessionController>(builder: (ctr) {
                  return SizedBox(
                    height: 120.h,
                    child: ListView.builder(
                      itemCount: ctr.scheduless.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Obx(
                          () => FittedBox(
                            child: Column(
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
                                              : ctr.scheduless[index]['day'] ==
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
                                    color: blackcolor,
                                  ),
                                ),
                                10.heightBox,
                                Text(
                                  "Availability",
                                  style: manoropeFontFamily(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: textfieldgrey,
                                  ),
                                ),
                                10.heightBox,
                                Text(
                                  "${ctr.scheduless[index]['startTime']} - ${ctr.scheduless[index]['endTime']}",
                                  style: manoropeFontFamily(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: textfieldgrey,
                                  ),
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
                                  width: 2,
                                )
                                .outerShadowLg
                                .margin(defaultpad)
                                .padding(defaultpad)
                                .make()
                                .onTap(() {
                              ctr.selectedIndex.value = index;
                            }),
                          ),
                        );
                      },
                    ),
                  );
                }),
                20.heightBox,
                Text(
                  "Time",
                  style: manoropeFontFamily(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: blackcolor,
                  ),
                ),
                10.heightBox,
                Row(
                  children: [
                    Obx(() => ElevatedButton(
                          onPressed: () async {
                            final TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(hour: 1, minute: 20),
                            );
                            if (picked != null) {
                              controller.startTime.value = picked;
                            }
                          },
                          child: Text(
                            controller.startTime.value == null
                                ? 'Start Time'
                                : controller.startTime.value!.format(context),
                            style: const TextStyle(color: darkBrownColor),
                          ),
                        )),
                    10.widthBox,
                    Obx(() => ElevatedButton(
                          onPressed: () async {
                            final TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: const TimeOfDay(hour: 1, minute: 20),
                            );
                            if (picked != null) {
                              controller.endTime.value = picked;
                            }
                          },
                          child: Text(
                            controller.endTime.value == null
                                ? 'End Time'
                                : controller.endTime.value!.format(context),
                            style: const TextStyle(color: darkBrownColor),
                          ),
                        )),
                  ],
                ),
                40.heightBox,
                CustomButton(
                  buttonName: "Book",
                  onPressed: () {
                    if (controller.appointmentReason.value.text.isNotEmpty &&
                        controller.startTime.value != null &&
                        controller.endTime.value != null) {
                      controller.createMeetingWithMentor(name);
                    } else {
                      Utils.snakbar(
                        title: "Error",
                        body: "Please select all the required fields",
                      );
                    }
                  },
                  textcolor: whitecolor,
                  loading: false,
                  backgroundColor: darkBrownColor,
                  rounded: true,
                  height: 40.h,
                  textSize: 15.sp,
                  width: double.infinity,
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("No availability"),
          );
        }
      }),
    );
  }
}
