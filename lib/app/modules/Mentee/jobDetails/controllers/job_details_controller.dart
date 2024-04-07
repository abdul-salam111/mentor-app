import 'package:get/get.dart';
import 'package:mentor_app/app/models/jobs/getJobById.dart';
import 'package:mentor_app/app/repositories/jobsRepo.dart';

class JobDetailsController extends GetxController {
  JobsRepository jobsRepository = JobsRepository();
  Future<GetJobById> getJobsDetail() async {
    var jobdata = await jobsRepository.getJobsById(jobId: '1');
    return jobdata;
  }
  
}
