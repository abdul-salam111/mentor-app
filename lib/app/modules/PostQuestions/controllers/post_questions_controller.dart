import 'package:get/get.dart';

class PostQuestionsController extends GetxController {
   var isIndusryOpen=false.obs;
    RxList<String> selectedIndustries = <String>[].obs;
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

}
