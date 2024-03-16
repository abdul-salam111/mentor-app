import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mentor_app/app/models/getallQuestions.dart';
import 'package:mentor_app/app/repositories/questionsRepo.dart';

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
    questionsRepository.fetchQuestionCount();
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
 
}
