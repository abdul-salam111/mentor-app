import 'package:get/get.dart';

import '../controllers/posted_jobs_controller.dart';

class PostedJobsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostedJobsController>(
      () => PostedJobsController(),
    );
  }
}
