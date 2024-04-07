import 'package:get/get.dart';

import '../controllers/job_application_form_controller.dart';

class JobApplicationFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobApplicationFormController>(
      () => JobApplicationFormController(),
    );
  }
}
