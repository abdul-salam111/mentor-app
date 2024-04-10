import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/models/jobs/createNewJob.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/repositories/jobsRepo.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class JobApplicationFormController extends GetxController {
  final jobDescriptionController = TextEditingController().obs;
  final compensationrangeController = TextEditingController().obs;
  final locationController = TextEditingController().obs;
  final jobUrl = TextEditingController().obs;
  final jobModeController = TextEditingController().obs;
  var isIndusryOpen = false.obs;
  var selectedIndustries = "Select".obs;
  List<String> industries = [
    "Information Technology (IT)",
    "Healthcare",
    "Finance and Banking",
    "Marketing and Advertising",
    "Education Development",
    "Entrepreneurship",
    "Engineering",
    "Real Estate",
    "Nonprofit and Social Services",
    "Entertainment and Media",
    "Legal Services",
    "Consulting",
    "Biotechnology and Pharmaceuticals",
    "Environmental Services",
    "Transportation and Logistics",
    "Fashion and Apparel",
    "Architecture and Design",
    "Government and Public Administration",
    "Human Resources",
    "Insurance"
  ];
  JobsRepository jobsRepository = JobsRepository();

  Future createNewJob() async {
    await jobsRepository.createJob(
        data: CreateNewJobModel(
                compensation: compensationrangeController.value.text.toString(),
                mentorId: getMentorInfoFromJson(
                        StorageServices.to.getString(getMentorInformationsss))
                    .id,
                industry: selectedIndustries.value,
                location: locationController.value.text.toString(),
                jobType: jobModeController.value.text.toString(),
                jobUrl: jobUrl.value.text.toString(),
                description: jobDescriptionController.value.toString())
            .toJson()).then((value){
              jobDescriptionController.value.clear();
              jobModeController.value.clear();
              jobUrl.value.clear();
              locationController.value.clear();
              selectedIndustries.value="Select";
              compensationrangeController.value.clear();
              
            });
  }
}
