import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/meetings_controller.dart';

class MeetingsView extends GetView<MeetingsController> {
  const MeetingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MeetingsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MeetingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
