import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleMeetingsController extends GetxController {
    final PageController pageController = PageController(initialPage: DateTime.now().month - 1);
  final Rx<DateTime> selectedDate = DateTime.now().obs;
}
