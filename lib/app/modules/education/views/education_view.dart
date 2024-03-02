import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Utils/Utils.dart';
import '../controllers/education_controller.dart';

class EducationView extends GetView<EducationController> {
  const EducationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Profile',
            style: GoogleFonts.manrope(
                fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: pad16,
          child: Column(
            children: [
              10.heightBox,
              Center(
                child: Text(
                  "Education",
                  style: GoogleFonts.manrope(
                      fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
              ),
              30.heightBox,
              Row(
                children: [
                  Image.asset(subjects),
                  10.widthBox,
                  Text(
                    "Subjects",
                    style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                ],
              ),
              20.heightBox,
                Column(
                crossAxisAlignment: crosstart,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        Text(
                          "Select",
                          style: manoropeFontFamily(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: blackcolor),
                        ),
                        const Icon(Icons.expand_more),
                      ],
                    ).box.make().onTap(() {
                      controller.isCertificateOpen.value =
                          !controller.isCertificateOpen.value;
                    }),
                  ),
                  Obx(
                    () => controller.isCertificateOpen.value
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
                  Obx(() => controller.isCertificateOpen.value
                      ? GetBuilder<EducationController>(
                          builder: (contextsss) {
                          return SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                              itemCount:
                                  controller.computerScienceSkills.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final skill =
                                    controller.computerScienceSkills[index];
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
                                      //   trailing: isSelected == true
                                      //       ? SizedBox(
                                      //           height: 10.h,
                                      //           width: 10.h,
                                      //         )
                                      //           .box
                                      //           .color(darkBrownColor)
                                      //           .rounded
                                      //           .make()
                                      //       : SizedBox(
                                      //           height: 10.h,
                                      //           width: 10.h,
                                      //         )
                                      //           .box
                                      //           .border(color: darkBrownColor)
                                      //           .rounded
                                      //           .make(),
                                      // ).box.make().onTap(() {
                                      //   if (controller.selectedSkills.length > 4) {
                                      //     if (isSelected) {
                                      //       controller.selectedSkills.remove(skill);
                                      //       contextsss.update();
                                      //     } else {
                                      //       Utils.snakbar(
                                      //           title: 'Maximum 5 goals',
                                      //           body:
                                      //               'You cannot select more than 5 goals.');
                                      //     }
                                      //   } else {
                                      //     if (isSelected) {
                                      //       controller.selectedSkills.remove(skill);
                                      //       contextsss.update();
                                      //     } else {
                                      //       controller.selectedSkills.add(skill);
                                      //       contextsss.update();
                                      //     }
                                      //   }
                                      // }),
                                    ),
                                    Container(
                                      color: greyColor,
                                      height: 1,
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        })
                      : const SizedBox.shrink())
                ],
              )
                  .box
                  .white
                  .padding(defaultpad)
                  .width(double.infinity)
                  .outerShadow
                  .roundedSM
                  .make(),
              30.heightBox,
              Row(
                children: [
                  Image.asset(professionalcertifications),
                  10.widthBox,
                  Text(
                    "Professional Certifications",
                    style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: blackcolor),
                  ),
                ],
              ),
              20.heightBox,
                Column(
                crossAxisAlignment: crosstart,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        Text(
                          "Select",
                          style: manoropeFontFamily(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: blackcolor),
                        ),
                        const Icon(Icons.expand_more),
                      ],
                    ).box.make().onTap(() {
                      controller.isCertificateOpen.value =
                          !controller.isCertificateOpen.value;
                    }),
                  ),
                  Obx(
                    () => controller.isCertificateOpen.value
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
                  Obx(() => controller.isCertificateOpen.value
                      ? GetBuilder<EducationController>(
                          builder: (contextsss) {
                          return SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                              itemCount:
                                  controller.computerScienceSkills.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final skill =
                                    controller.computerScienceSkills[index];
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
                                      //   trailing: isSelected == true
                                      //       ? SizedBox(
                                      //           height: 10.h,
                                      //           width: 10.h,
                                      //         )
                                      //           .box
                                      //           .color(darkBrownColor)
                                      //           .rounded
                                      //           .make()
                                      //       : SizedBox(
                                      //           height: 10.h,
                                      //           width: 10.h,
                                      //         )
                                      //           .box
                                      //           .border(color: darkBrownColor)
                                      //           .rounded
                                      //           .make(),
                                      // ).box.make().onTap(() {
                                      //   if (controller.selectedSkills.length > 4) {
                                      //     if (isSelected) {
                                      //       controller.selectedSkills.remove(skill);
                                      //       contextsss.update();
                                      //     } else {
                                      //       Utils.snakbar(
                                      //           title: 'Maximum 5 goals',
                                      //           body:
                                      //               'You cannot select more than 5 goals.');
                                      //     }
                                      //   } else {
                                      //     if (isSelected) {
                                      //       controller.selectedSkills.remove(skill);
                                      //       contextsss.update();
                                      //     } else {
                                      //       controller.selectedSkills.add(skill);
                                      //       contextsss.update();
                                      //     }
                                      //   }
                                      // }),
                                    ),
                                    Container(
                                      color: greyColor,
                                      height: 1,
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        })
                      : const SizedBox.shrink())
                ],
              )
                  .box
                  .white
                  .padding(defaultpad)
                  .width(double.infinity)
                  .outerShadow
                  .roundedSM
                  .make(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: CustomButton(
                    buttonName: "Continue",
                    onPressed: () {
                      Get.toNamed(Routes.PREFERRED_MENTOR);
                    },
                    textcolor: whitecolor,
                    loading: false,
                    backgroundColor: darkBrownColor,
                    rounded: true,
                    height: 50,
                    textSize: 16,
                    width: double.infinity),
              ),
              20.heightBox,
            ],
          ),
        ));
  }
}
