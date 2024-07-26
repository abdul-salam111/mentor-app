import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/repositories/availabilitySchdeuling.dart';
import 'package:mentor_app/app/repositories/meetingsController.dart';

class ScheduleSessionController extends GetxController {
  var startTime = Rx<TimeOfDay?>(null);
  var endTime = Rx<TimeOfDay?>(null);

  List<Map<String, dynamic>> scheduless = [];
  var isOpen = false.obs;
  var isCertificateOpen = false.obs;
  RxList<String> selectedSkills = <String>[].obs;
  var selectedIndex = 0.obs;
  var selectedIndexOfTime = 0.obs;
  List<String> computerScienceSkills = [
    'Select Education',
    'App Development',
    'Data Structures',
    'Algorithms',
    'Web Development',
    'Machine Learning',
    'Database Management',
    'Cybersecurity',
    'Networking',
    'Operating Systems',
    'Cloud Computing',
    'Software Engineering',
    'Artificial Intelligence',
  ];
  final appointmentReason = TextEditingController().obs;

  AvailabilityScheduling availabilityScheduling = AvailabilityScheduling();

  @override
  void onReady() async {
    super.onReady();
    await fetchSchedulesForMentees();
  }

  var isDayOpen = false.obs;
  var selectedDay = "day".obs;
  var selectedStartTime = "start time".obs;
  var selectedEndTime = "end time".obs;
  var isStartTimeOpen = false.obs;
  var isEndTimeOpen = false.obs;

  Future fetchSchedulesForMentees() async {
    EasyLoading.show(status: "Loading...");
    var data = Get.arguments;

    var schedules = await availabilityScheduling
        .fetchMentorAvailbleSchedulesforMentees(data['id'].toString());
    for (int i = 0; i < schedules.length; i++) {
      scheduless.add(schedules[i]);
      update();
    }
    EasyLoading.dismiss();
  }

  MeetingRepository meetingRepository = MeetingRepository();
  Future createMeetingWithMentor(String name) async {
    final formattedStartTime = startTime.value != null
        ? '${startTime.value!.hour}:${startTime.value!.minute.toString().padLeft(2, '0')}'
        : null;
    final formattedEndTime = endTime.value != null
        ? '${endTime.value!.hour}:${endTime.value!.minute.toString().padLeft(2, '0')}'
        : null;

    var data = Get.arguments;
    meetingRepository
        .createMeetingWithMentor(
            name: name,
            mentorId: data['id'].toString(),
            endTime: formattedEndTime ?? '',
            startTime: formattedStartTime ?? '',
            // scheduless[selectedIndex.value]['startTime'],
            dateTime:
                "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
            appointreason: appointmentReason.value.text,
            day: scheduless[selectedIndex.value]['day'])
        .then((value) {
      selectedStartTime.value = "start time";
      selectedEndTime.value = "end time";
      selectedDay.value = "day";
      appointmentReason.value.clear();
    });
  }
}
