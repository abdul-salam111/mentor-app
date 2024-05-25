import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/shimmerEffect.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/schedule_meetings_controller.dart';

class ScheduleMeetingsView extends StatefulWidget {
  const ScheduleMeetingsView({super.key});

  @override
  State<ScheduleMeetingsView> createState() => _ScheduleMeetingsViewState();
}

class _ScheduleMeetingsViewState extends State<ScheduleMeetingsView> {

  final controller=  Get.put(ScheduleMeetingsController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: whitecolor,
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
                Obx(
                  () => OutlinedButton(
                      onPressed: () {
                        controller.index.value = 0;
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: controller.index.value == 0
                              ? darkBrownColor
                              : whitecolor,
                          minimumSize: Size(130.w, 30.h),
                          side: const BorderSide(color: darkBrownColor)),
                      child: Text(
                        "Schedule Meetings",
                        style: manoropeFontFamily(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: controller.index.value == 0
                                ? whitecolor
                                : darkBrownColor),
                      )),
                ),
                StorageServices.to.getString(selectedUserType) == "Mentor"
                    ? Obx(
                        () => OutlinedButton(
                            onPressed: () {
                              controller.index.value = 1;
                            },
                            style: OutlinedButton.styleFrom(
                                backgroundColor: controller.index.value == 1
                                    ? darkBrownColor
                                    : whitecolor,
                                minimumSize: Size(130.w, 30.h),
                                side: const BorderSide(color: darkBrownColor)),
                            child: Text(
                              "Update Availability",
                              style: manoropeFontFamily(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: controller.index.value == 1
                                      ? whitecolor
                                      : darkBrownColor),
                            )),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            10.heightBox,
            // Obx(() => controller.index.value == 0
            //     ? Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Obx(
            //           () => Text(
            //             DateFormat('MMMM')
            //                 .format(controller.selectedDate.value),
            //             style: manoropeFontFamily(
            //                 fontSize: 15.sp,
            //                 fontWeight: FontWeight.bold,
            //                 color: darkBrownColor),
            //           ),
            //         ))
            //     : const SizedBox.shrink()),
            // Obx(() => controller.index.value == 0
            //     ? Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 8.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: [
            //             for (var day in _getDaysOfWeek())
            //               Text(
            //                 day,
            //                 style: manoropeFontFamily(
            //                     fontSize: 12.sp,
            //                     fontWeight: FontWeight.w500,
            //                     color: darkBrownColor),
            //               ),
            //           ],
            //         ),
            //       )
            //     : const SizedBox.shrink()),
            // Obx(() => controller.index.value == 0
            //     ? Expanded(
            //         child: PageView.builder(
            //           key: _pageViewKey,
            //           controller: controller.pageController,
            //           itemCount: 12, // For 12 months
            //           onPageChanged: (index) {
            //             DateTime newDate = DateTime(
            //                 controller.selectedDate.value.year, index + 1, 1);
            //             controller.selectedDate.value = newDate;
            //           },
            //           itemBuilder: (context, index) {
            //             DateTime month = DateTime(
            //                 controller.selectedDate.value.year, index + 1, 1);
            //             return buildMonthPicker(month);
            //           },
            //         ),
            //       )
            //     : const SizedBox.shrink()),
            Obx(() => controller.index.value == 0
                ? FutureBuilder(
                    future: StorageServices.to.getString(selectedUserType) ==
                            "Mentee"
                        ? controller.fetchMenteeScheduledMeetings()
                        : controller.fetchMentorScheduledMeetings(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: AnotherShimmerList(7),
                        );
                      } else if (!snapshot.hasData || snapshot.data == null) {
                        // If snapshot has no data or data is null
                        return const Center(
                          child: Text(
                            "No meetings available",
                            style: TextStyle(color: blackcolor),
                          ),
                        );
                      } else if (snapshot.data['meetingResponseList'].isEmpty) {
                        // If meetingResponseList is empty
                        return Expanded(
                          child: Center(
                              child: Image.asset("assets/images/not found.jpg",height: 100,width: 100,)),
                        );
                      }
                      return Expanded(
                        child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot
                                    .data!['meetingResponseList'].length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment: crosstart,
                                    children: [
                                      CircleAvatar(
                                        radius: 24.r,
                                        backgroundImage: CachedNetworkImageProvider(
                                            StorageServices.to.getString(
                                                        selectedUserType) ==
                                                    "Mentee"
                                                ? snapshot.data!['meetingResponseList']
                                                        [index]['mentor']
                                                    ['profilePicUrl']
                                                : snapshot.data![
                                                            'meetingResponseList']
                                                        [index]['mentee']
                                                    ['profilePicUrl']),
                                      ),
                                      5.widthBox,
                                      Column(
                                        mainAxisAlignment: mainbetween,
                                        crossAxisAlignment: crosstart,
                                        children: [
                                          Text(
                                            StorageServices.to.getString(
                                                        selectedUserType) ==
                                                    "Mentee"
                                                ? snapshot.data![
                                                        'meetingResponseList'][
                                                    index]['mentor']['fullName']
                                                : snapshot.data![
                                                        'meetingResponseList'][
                                                    index]['mentee']['fullName'],
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
                                                "Time : ${snapshot.data!['meetingResponseList'][index]['startTime']}",
                                                style: manoropeFontFamily(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: textfieldgrey),
                                              ),
                                            ],
                                          ),
                                          2.heightBox,
                                          Text(
                                            "Industry: ${StorageServices.to.getString(selectedUserType) == "Mentee" ? snapshot.data!['meetingResponseList'][index]['mentor']['industry'] : snapshot.data!['meetingResponseList'][index]['mentee']['industry']}",
                                            style: manoropeFontFamily(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w500,
                                                color: textfieldgrey),
                                          ),
                                          5.heightBox,
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 17.h,
                                                width: 70.w,
                                                child: Center(
                                                  child: Text(
                                                    "View",
                                                    style: manoropeFontFamily(
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: whitecolor),
                                                  ),
                                                ),
                                              )
                                                  .box
                                                  .color(
                                                      const Color(0xff109804))
                                                  .rounded
                                                  .make(),
                                              10.widthBox,
                                              GestureDetector(
                                                onTap: () {
                                                  controller.cancelMeetingByMentee(
                                                      snapshot.data[
                                                              'meetingResponseList']
                                                          [index]['id'],
                                                      snapshot.data[
                                                                  'meetingResponseList']
                                                              [index]['mentor']
                                                          ['fullName']);
                                                  setState(() {
                                                    
                                                  });
                                                },
                                                child: SizedBox(
                                                  height: 17.h,
                                                  width: 70.w,
                                                  child: Center(
                                                    child: Text(
                                                      "Cancel",
                                                      style: manoropeFontFamily(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: whitecolor),
                                                    ),
                                                  ),
                                                )
                                                    .box
                                                    .color(redColor)
                                                    .rounded
                                                    .make(),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                      .box
                                      .white
                                      .outerShadow
                                      .rounded
                                      .padding(const EdgeInsets.fromLTRB(
                                          14, 7, 14, 7))
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
                      );
                    })
                : const SizedBox.shrink()),
            Obx(() => controller.index.value == 1
                ? FutureBuilder(
                    future: controller.getMentorAvailbleSchedules(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (!snapshot.hasData || snapshot.data.isEmpty) {
                        return Column(
                          children: [
                            ListView.builder(
                              itemCount: 7,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final startingTimeController =
                                    TextEditingController();
                                final endingTimeController =
                                    TextEditingController();

                                return Row(
                                  children: [
                                    Obx(() => Checkbox(
                                          value: controller
                                              .selectedAvailablityList
                                              .any((item) =>
                                                  item['day'] ==
                                                  controller.daysOfWeek[index]),
                                          onChanged: (val) {
                                            final selectedDay =
                                                controller.daysOfWeek[index];
                                            final existingItemIndex = controller
                                                .selectedAvailablityList
                                                .indexWhere((item) =>
                                                    item['day'] == selectedDay);

                                            if (startingTimeController
                                                    .text.isEmpty ||
                                                endingTimeController
                                                    .text.isEmpty) {
                                              // Handle empty text fields if needed
                                            } else {
                                              if (val!) {
                                                // Checkbox is checked
                                                if (existingItemIndex == -1) {
                                                  // Add new item to the list
                                                  controller
                                                      .selectedAvailablityList
                                                      .add({
                                                    'day': selectedDay,
                                                    'endTime':
                                                        endingTimeController
                                                            .text,
                                                    'mentorId': StorageServices
                                                        .to
                                                        .getString(userId),
                                                    'startTime':
                                                        startingTimeController
                                                            .text,
                                                    'id': 0,
                                                  });
                                                }
                                              } else {
                                                // Checkbox is unchecked
                                                if (existingItemIndex != -1) {
                                                  // Remove item from the list
                                                  controller
                                                      .selectedAvailablityList
                                                      .removeAt(
                                                          existingItemIndex);
                                                }
                                              }
                                            }
                                          },
                                        )),
                                    SizedBox(
                                        width: 90.w,
                                        child:
                                            Text(controller.daysOfWeek[index])),
                                    SizedBox(
                                        width: 50,
                                        child: TextField(
                                            controller: startingTimeController,
                                            keyboardType:
                                                TextInputType.datetime,
                                            decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                                border: InputBorder.none,
                                                hintText: '1:00'))),
                                    const SizedBox(width: 20),
                                    SizedBox(
                                        width: 50,
                                        child: TextField(
                                            controller: endingTimeController,
                                            keyboardType:
                                                TextInputType.datetime,
                                            decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                                border: InputBorder.none,
                                                hintText: '12:00'))),
                                  ],
                                );
                              },
                            ),
                            10.heightBox,
                            CustomButton(
                                buttonName: "Save",
                                onPressed: () {
                                  controller.createMentorSchedular();
                                },
                                textcolor: whitecolor,
                                loading: false,
                                backgroundColor: darkBrownColor,
                                rounded: true,
                                height: 40.h,
                                textSize: 16.sp,
                                width: double.infinity)
                          ],
                        );
                      }

                      for (var i = 0; i < snapshot.data.length; i++) {
                        controller.selectedAvailablityList.add({
                          'day': snapshot.data[i]['day'] == "mon"
                              ? "Monday"
                              : snapshot.data[i]['day'] == "tue"
                                  ? "Tuesday"
                                  : snapshot.data[i]['day'] == "wed"
                                      ? "Wednesday"
                                      : snapshot.data[i]['day'] == "thu"
                                          ? "Thursday"
                                          : snapshot.data[i]['day'] == "fri"
                                              ? "Friday"
                                              : snapshot.data[i]['day'] == "sat"
                                                  ? "Saturday"
                                                  : snapshot.data[i]['day'] ==
                                                      "Sunday",
                          'endTime': snapshot.data[i]['endTime'],
                          'mentorId': StorageServices.to.getString(
                              userId), // Assuming mentorId is fixed for all items
                          'startTime': snapshot.data[i]['startTime'],
                          'id': snapshot.data[i]['id']
                        });
                      }

                      return Column(
                        children: [
                          _buildDataListView(
                              controller.selectedAvailablityList),
                          // Render UI for adding new data
                          _buildAddDataListView(snapshot.data),
                          10.heightBox,
                          CustomButton(
                              buttonName: "Update",
                              onPressed: () {
                                controller.createMentorSchedular();
                              },
                              textcolor: whitecolor,
                              loading: false,
                              backgroundColor: darkBrownColor,
                              rounded: true,
                              height: 35.h,
                              textSize: 15.sp,
                              width: double.infinity)
                        ],
                      );
                    })
                : const SizedBox.shrink())
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

  Widget _buildDataListView(List dataList) {
    return ListView.builder(
      itemCount: dataList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final startingTimeController =
            TextEditingController(text: dataList[index]['startTime']);
        final endingTimeController =
            TextEditingController(text: dataList[index]['endTime']);

        return _buildRow(startingTimeController, endingTimeController, index);
      },
    );
  }

  Widget _buildAddDataListView(List apiData) {
    return ListView.builder(
      itemCount: controller.daysOfWeek.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final currentDay = controller.daysOfWeek[index];
        if (apiData.any((item) => item['day'] == currentDay) ||
            controller.selectedAvailablityList
                .any((item) => item['day'] == currentDay)) {
          // Skip this day if it already exists in the selectedAvailablityList or API data
          return const SizedBox.shrink();
        }

        final startingTimeController = TextEditingController();
        final endingTimeController = TextEditingController();

        return _buildRow(startingTimeController, endingTimeController, index);
      },
    );
  }

  Widget _buildRow(TextEditingController startingTimeController,
      TextEditingController endingTimeController, int index) {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: controller.selectedAvailablityList
                .any((item) => item['day'] == controller.daysOfWeek[index]),
            onChanged: (val) {
              final selectedDay = controller.daysOfWeek[index];
              final existingItemIndex = controller.selectedAvailablityList
                  .indexWhere((item) => item['day'] == selectedDay);

              if (startingTimeController.text.isEmpty ||
                  endingTimeController.text.isEmpty) {
                // Handle empty text fields if needed
              } else {
                if (val!) {
                  // Checkbox is checked
                  if (existingItemIndex == -1) {
                    // Add new item to the list
                    controller.selectedAvailablityList.add({
                      'day': selectedDay,
                      'endTime': endingTimeController.text,
                      'mentorId': StorageServices.to.getString(userId),
                      'startTime': startingTimeController.text,
                    });
                  }
                } else {
                  // Checkbox is unchecked
                  if (existingItemIndex != -1) {
                    // Remove item from the list
                    controller.selectedAvailablityList
                        .removeAt(existingItemIndex);
                  }
                }
              }
            },
          ),
        ),
        SizedBox(
          width: 90.w,
          child: Text(controller.daysOfWeek[index]),
        ),
        SizedBox(
          width: 50,
          child: TextField(
            controller: startingTimeController,
            keyboardType: TextInputType.datetime,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0),
              border: InputBorder.none,
              hintText: '1:00',
            ),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 50,
          child: TextField(
            controller: endingTimeController,
            keyboardType: TextInputType.datetime,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0),
              border: InputBorder.none,
              hintText: '12:00',
            ),
          ),
        ),
      ],
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
