import 'package:get/get.dart';

import '../controllers/question_and_answer_forum_controller.dart';

class QuestionAndAnswerForumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionAndAnswerForumController>(
      () => QuestionAndAnswerForumController(),
    );
  }
}
