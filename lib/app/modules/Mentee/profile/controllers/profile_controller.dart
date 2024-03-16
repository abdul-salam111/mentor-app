import 'package:get/get.dart';

class ProfileController extends GetxController {

    RxList<String> availabilityList = <String>[].obs;
     List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
   List<String> durations = [
    '1 hour',
    '1 hour 30 minutes',
    '2 hours',
    '2 hours 30 minutes',
    '3 hours',
    '3 hours 30 minutes',
    '4 hours',
    '4 hours 30 minutes',
    '5 hours',
    '5 hours 30 minutes',
    '6 hours',
  ];
   var selectedDuration = 'Select'.obs;
     var isDurationOpen = false.obs;
     List<String> communitcationChannels = [
    'App messaging',
    'Video Call',
    'Phone Call'
  ];
  List<String> selectedChannles = <String>[].obs;
}
