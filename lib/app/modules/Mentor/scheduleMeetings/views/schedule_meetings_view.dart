import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/schedule_meetings_controller.dart';

class ScheduleMeetingsView extends GetView<ScheduleMeetingsController> {
  final GlobalKey _pageViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: whitecolor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Meetings',
          style:
              GoogleFonts.manrope(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: mainbetween,
              children: [
                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        minimumSize: Size(130.w, 30.h),
                        side: const BorderSide(color: darkBrownColor)),
                    child: Text(
                      "Schedule Meetings",
                      style: manoropeFontFamily(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: darkBrownColor),
                    )),
                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        minimumSize: Size(130.w, 30.h),
                        side: const BorderSide(color: darkBrownColor)),
                    child: Text(
                      "Update Availability",
                      style: manoropeFontFamily(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: darkBrownColor),
                    )),
              ],
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => Text(
                  DateFormat('MMMM').format(controller.selectedDate.value),
                  style: manoropeFontFamily(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: darkBrownColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var day in _getDaysOfWeek())
                    Text(
                      day,
                      style: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: darkBrownColor),
                    ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                key: _pageViewKey,
                controller: controller.pageController,
                itemCount: 12, // For 12 months
                onPageChanged: (index) {
                  DateTime newDate = DateTime(
                      controller.selectedDate.value.year, index + 1, 1);
                  controller.selectedDate.value = newDate;
                },
                itemBuilder: (context, index) {
                  DateTime month = DateTime(
                      controller.selectedDate.value.year, index + 1, 1);
                  return buildMonthPicker(month);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: crosstart,
                          children: [
                            CircleAvatar(
                              radius: 24.r,
                              backgroundImage: const AssetImage(mentor),
                            ),
                            5.widthBox,
                            Column(
                              mainAxisAlignment: mainbetween,
                              crossAxisAlignment: crosstart,
                              children: [
                                Text(
                                  "Chinyere Njoku",
                                  style: manoropeFontFamily(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: blackcolor),
                                ),
                                2.heightBox,
                                Row(
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      color: textfieldgrey,
                                      size: 18.sp,
                                    ),
                                    5.widthBox,
                                    Text(
                                      "Time : 12:30pm",
                                      style: manoropeFontFamily(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: textfieldgrey),
                                    ),
                                  ],
                                ),
                                2.heightBox,
                                Text(
                                  "Industry: Graphic Design",
                                  style: manoropeFontFamily(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textfieldgrey),
                                ),
                                5.heightBox, 
                                SizedBox(
                                  height: 17.h,
                                  width: 70.w,
                                  child: Center(
                                    child: Text(
                                      "View",
                                      style: manoropeFontFamily(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: whitecolor),
                                    ),
                                  ),
                                ).box.color(const Color(0xff109804)).rounded.make()
                              ],
                            )
                          ],
                        )
                            .box
                            .white
                            .outerShadow
                            .rounded
                            .padding(const EdgeInsets.fromLTRB(14, 7, 14, 7))
                            .margin(const EdgeInsets.only(
                                top: 10, left: 10, right: 10))
                            .make();
                      })
                  .box
                  .outerShadow
                  .white
                  .padding(const EdgeInsets.fromLTRB(8, 8, 8, 0))
                  .topRounded()
                  .make(),
            )
          ],
        )
            .box
            .white
            .outerShadow
            .topRounded()
            .padding(const EdgeInsets.fromLTRB(8, 8, 8, 0))
            .make(),
      ),
    );
  }

  List<String> _getDaysOfWeek() {
    var daysOfWeek = <String>[];
    for (int i = DateTime.monday; i <= DateTime.sunday; i++) {
      daysOfWeek
          .add(DateFormat.E().format(DateTime(DateTime.now().year, 1, i)));
    }
    return daysOfWeek;
  }

  Widget buildMonthPicker(DateTime month) {
    int daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    int startingIndex = DateTime(month.year, month.month, 1).weekday - 1;

    return GetBuilder<ScheduleMeetingsController>(builder: (ctr) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemCount: daysInMonth + startingIndex,
        itemBuilder: (context, index) {
          if (index < startingIndex) {
            return const SizedBox();
          } else {
            DateTime currentDate = DateTime(DateTime.now().year,
                DateTime.now().month, index - startingIndex + 1);
            bool isSelected = currentDate == ctr.selectedDate.value;

            return GestureDetector(
              onTap: () {
                ctr.selectedDate.value = currentDate;
                ctr.update();
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xff10C217) : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  currentDate.day.toString(),
                  style: TextStyle(
                    color: isSelected ? Colors.white : redColor,
                  ),
                ),
              ),
            );
          }
        },
      );
    });
  }
}
