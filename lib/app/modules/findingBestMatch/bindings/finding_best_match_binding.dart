import 'package:get/get.dart';

import '../controllers/finding_best_match_controller.dart';

class FindingBestMatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindingBestMatchController>(
      () => FindingBestMatchController(),
    );
  }
}
