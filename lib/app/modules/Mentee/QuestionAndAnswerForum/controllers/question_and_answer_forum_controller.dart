import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mentor_app/app/models/questions/getallQuestions.dart';
import 'package:mentor_app/app/repositories/questionsRepo.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class QuestionAndAnswerForumController extends GetxController {
  QuestionsRepository questionsRepository = QuestionsRepository();

  var selectedIndustries = 'Information Technology (IT)'.obs;
  List<String> industries = [
    'Information Technology (IT)',
    'Healthcare',
    'Finance',
    'Education',
    'Manufacturing',
    'Retail',
    'Hospitality',
    'Transportation',
    'Entertainment',
    'Agriculture',
    'Real Estate',
    'Construction',
    'Energy',
    'Telecommunications',
    'Media',
    'Automotive',
    'Aerospace',
    'Pharmaceutical',
    'Biotechnology',
    'Environmental',
    // Add more industries as needed
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (StorageServices.to.getString(selectedUserType) == "Mentee") {
      questionsRepository.fetchQuestionCount();
    }
  
  }
Future getReplies(qid) async {
    return await questionsRepository.getQuestionsReplies(qid);
  }
  
  Future<GetQuestionModel> fetchAllQuestions() async {
    return await questionsRepository.fetchAllQuestion(
      industry: selectedIndustries.value == ''
          ? 'Information Technology (IT)'
          : selectedIndustries.value,
    );
  }

  String formatDate(DateTime dateTime) {
    // Format the date using the intl package
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  Future submitAnswer(answer, qid) async {
    await questionsRepository.submitAnswer(answer: answer, questionId: qid);
  }

  
}
