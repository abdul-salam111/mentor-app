import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/commonTextfield.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/job_application_form_controller.dart';

class JobApplicationFormView extends GetView<JobApplicationFormController> {
  const JobApplicationFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          // foregroundColor: whitecolor,
          surfaceTintColor: whitecolor,
          backgroundColor: whitecolor,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Create Job',
            style: GoogleFonts.manrope(
                fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: ListView(
              children: [
                Text(
                  "Add Job Description",
                  style: manoropeFontFamily(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: blackcolor),
                ),
                10.heightBox,
                TextField(
                  maxLines: null, // Allow multiple lines of text
                  minLines: 5,
                  controller: controller.jobDescriptionController.value,
                  decoration: InputDecoration(
                      hintText: 'Job description...', // Your hint text
                      hintStyle: manoropeFontFamily(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: blackcolor),
                      contentPadding: const EdgeInsets.only(
                          top: 12.0, left: 12.0), // Padding from top and left
                      border: InputBorder.none),
                ).box.white.margin(EdgeInsets.only(left: 8,right: 8)).roundedSM.outerShadow.make(),
                20.heightBox,
                Text(
                  "Compansation Range",
                  style: manoropeFontFamily(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: blackcolor),
                ),
                10.heightBox,
                TextField(
                  controller: controller.compensationrangeController.value,
                  decoration: InputDecoration(
                      hintText: 'Compansation Range', // Your hint text
                      hintStyle: manoropeFontFamily(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: blackcolor),
                      contentPadding: const EdgeInsets.only(
                          top: 0.0,
                          left: 12.0,
                          bottom: 5), // Padding from top and left
                      border: InputBorder.none),
                ).box.white.margin(EdgeInsets.only(left: 8,right: 8)).roundedSM.outerShadow.make(),
                20.heightBox,
                Text(
                  "Job Mode",
                  style: manoropeFontFamily(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: blackcolor),
                ),
                10.heightBox,
                TextField(
                  controller: controller.jobModeController.value,
                  decoration: InputDecoration(
                      hintText: 'Full Time/Part Time', // Your hint text
                      hintStyle: manoropeFontFamily(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: blackcolor),
                      contentPadding: const EdgeInsets.only(
                          top: 0.0,
                          left: 12.0,
                          bottom: 5), // Padding from top and left
                      border: InputBorder.none),
                ).box.white.margin(EdgeInsets.only(left: 8,right: 8)).roundedSM.outerShadow.make(),
                20.heightBox,
                Text(
                  "Location",
                  style: manoropeFontFamily(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: blackcolor),
                ),
                10.heightBox,
                TextField(
                  controller: controller.locationController.value,
                  decoration: InputDecoration(
                      hintText: 'Location', // Your hint text
                      hintStyle: manoropeFontFamily(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: blackcolor),
                      contentPadding: const EdgeInsets.only(
                          top: 0.0,
                          left: 12.0,
                          bottom: 5), // Padding from top and left
                      border: InputBorder.none),
                ).box.white.margin(EdgeInsets.only(left: 8,right: 8)).roundedSM.outerShadow.make(),
                 20.heightBox,
                Text(
                  "Job Url",
                  style: manoropeFontFamily(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: blackcolor),
                ),
                10.heightBox,
                TextField(
                  controller: controller.jobUrl.value,
                  decoration: InputDecoration(
                      hintText: 'Job Url', // Your hint text
                      hintStyle: manoropeFontFamily(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: blackcolor),
                      contentPadding: const EdgeInsets.only(
                          top: 0.0,
                          left: 12.0,
                          bottom: 5), // Padding from top and left
                      border: InputBorder.none),
                ).box.white.margin(EdgeInsets.only(left: 8,right: 8)).roundedSM.outerShadow.make(),
                20.heightBox,
                Row(
                  children: [
                    Image.asset(
                      industry,
                      height: 20,
                      width: 20,
                    ),
                    10.widthBox,
                    Text(
                      "Industry",
                      style: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: blackcolor),
                    ),
                  ],
                ),
                10.heightBox,
                Column(
                  crossAxisAlignment: crosstart,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        mainAxisAlignment: mainbetween,
                        children: [
                          Obx(
                            () => Text(
                              controller.selectedIndustries.value,
                              style: manoropeFontFamily(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackcolor),
                            ),
                          ),
                          const Icon(Icons.expand_more),
                        ],
                      ).box.make().onTap(() {
                        controller.isIndusryOpen.value =
                            !controller.isIndusryOpen.value;
                      }),
                    ),
                    Obx(
                      () => controller.isIndusryOpen.value
                          ? Column(
                              children: [
                                10.heightBox,
                                Container(
                                  color: greyColor,
                                  height: 1,
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                    Obx(() => controller.isIndusryOpen.value
                        ? GetBuilder<JobApplicationFormController>(
                            builder: (contextsss) {
                            return SizedBox(
                              height: 200.h,
                              child: ListView.builder(
                                itemCount: controller.industries.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final skill = controller.industries[index];
                                  // final isSelected =
                                  //     controller.selectedSkills.contains(skill);
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          skill,
                                          style: manoropeFontFamily(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: blackcolor),
                                        ),
                                      ),
                                      Container(
                                        color: greyColor,
                                        height: 1,
                                      ),
                                    ],
                                  ).onTap(() {
                                    controller.isIndusryOpen.value = false;
                                    controller.selectedIndustries.value =
                                        controller.industries[index];
                                  });
                                },
                              ),
                            );
                          })
                        : const SizedBox.shrink())
                  ],
                )
                    .box
                    .white.margin(EdgeInsets.only(left: 8,right: 8))
                    .padding(defaultpad)
                    .width(double.infinity)
                    .outerShadow
                    .roundedSM
                    .make(),
                40.heightBox,
                CustomButton(
                    buttonName: "Add Job",
                    onPressed: () {
                      controller.createNewJob();
                    },
                    textcolor: whitecolor,
                    loading: false,
                    backgroundColor: darkBrownColor,
                    rounded: false,
                    height: 40.h,
                    textSize: 17.sp,
                    width: double.infinity)
              ],
            ),
          ),
        ));
  }
}
