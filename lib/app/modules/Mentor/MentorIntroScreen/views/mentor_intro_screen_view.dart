import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mentor_intro_screen_controller.dart';

class MentorIntroScreenView extends GetView<MentorIntroScreenController> {
  const MentorIntroScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MentorIntroScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MentorIntroScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
