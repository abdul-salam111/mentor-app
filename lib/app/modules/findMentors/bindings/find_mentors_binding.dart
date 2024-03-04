import 'package:get/get.dart';

import '../controllers/find_mentors_controller.dart';

class FindMentorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindMentorsController>(
      () => FindMentorsController(),
    );
  }
}
