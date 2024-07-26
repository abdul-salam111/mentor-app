import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mentor_app/app/repositories/availabilitySchdeuling.dart';
import 'package:mentor_app/app/repositories/meetingsController.dart';

class ScheduleMeetingsController extends GetxController {
  final PageController pageController =
      PageController(initialPage: DateTime.now().month - 1);
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  var index = 0.obs;
  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  AvailabilityScheduling availabilityScheduling = AvailabilityScheduling();
  // List<String> timeList = [
  //   "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00",
  //   "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00",
  //   "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00", "24:00"
  // ];
  Future getMentorAvailbleSchedules() async {
    return availabilityScheduling.fetchMentorAvailbleSchedules();
  }

  RxList<Map<String, dynamic>> selectedAvailablityList =
      <Map<String, dynamic>>[].obs;

  void addSchedule({required Map<String, dynamic> schedule}) {
    selectedAvailablityList.add(schedule);
  }

  void removeSchedule(int index) {
    selectedAvailablityList.removeAt(index);
  }

  Future<void> createMentorSchedular() async {
    try {
      String jsonAvailablity = jsonEncode(selectedAvailablityList);

      await availabilityScheduling.createSchedule(jsonAvailablity);
      // Clear the list after sending the data to the API
      selectedAvailablityList.clear();
    } catch (e) {
      // Handle error
      print('Error creating mentor scheduler: $e');
    }
  }

  RxString startingTime = "01:00".obs;

  void setTime(String time) {
    startingTime.value = time;
  }

  MeetingRepository meetingRepository = MeetingRepository();
  Future fetchMenteeScheduledMeetings() async {
    return await meetingRepository.fetchMenteesMeetings();
  }

  Future cancelMeetingByMentee(meetingId, name) async {
    return await meetingRepository
        .cancelMeetingByMentee(meetingId, name)
        .then((value) {
      meetingRepository.fetchMenteesMeetings();
    });
  }

  Future markAsCompletedlMeetingByMentee(
      String mentorId,
      menteeId,
      String bookingId,
      String name, // for screen
    ) async {
    return await meetingRepository
        .meetingCopletedWithMentorByMentee(
            mentorId: mentorId,
            menteeId: menteeId,
            bookingId: bookingId,
            name: name)
        .then((value) {
      meetingRepository.fetchMenteesMeetings();
    });
  }

  Future fetchMentorScheduledMeetings() async {
    return await meetingRepository.fetchMentorsMeetings();
  }

  Future cancelMentorsMeetingsWithMentee(meetingId, name) async {
    return await meetingRepository
        .cancelMeetingByMentee(meetingId, name)
        .then((value) {
      meetingRepository.fetchMenteesMeetings();
    });
  }
}
