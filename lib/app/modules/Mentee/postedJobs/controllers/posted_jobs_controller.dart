import 'package:get/get.dart';
import 'package:mentor_app/app/models/jobs/getJobByIndustry.dart';
import 'package:mentor_app/app/repositories/jobsRepo.dart';

class PostedJobsController extends GetxController {
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
  var isIndusryOpen=false.obs;


  JobsRepository jobsRepository =JobsRepository();
  Future<GetJobByIndustry> getJobByIndustry()async{
    return jobsRepository.getJobsByIndustry(industry: selectedIndustries.value);
  }
}
