import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobApplicationFormController extends GetxController {
  final jobDescriptionController=TextEditingController().obs;
  final compensationrangeController=TextEditingController().obs;
  final locationController=TextEditingController().obs;
  final jobModeController=TextEditingController().obs;
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

}
