import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/meeting_details_controller.dart';

class MeetingDetailsView extends GetView<MeetingDetailsController> {
  const MeetingDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MeetingDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MeetingDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
