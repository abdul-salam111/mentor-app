import 'package:get/get.dart';

import '../controllers/post_questions_controller.dart';

class PostQuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostQuestionsController>(
      () => PostQuestionsController(),
    );
  }
}
