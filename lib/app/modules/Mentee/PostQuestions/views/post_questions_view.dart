import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/post_questions_controller.dart';

class PostQuestionsView extends GetView<PostQuestionsController> {
  const PostQuestionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Post Questions',
            style: GoogleFonts.manrope(
                fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          centerTitle: false,
          actions: [
            SizedBox(
              child: Center(
                child: Text(
                  '5',
                  style: manoropeFontFamily(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      color: whitecolor),
                ),
              ),
            )
                .box
                .color(darkBrownColor)
                .width(17.w)
                .height(17.h)
                .roundedFull
                .make(),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Questions Left",
                  style: manoropeFontFamily(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: darkestRed),
                ))
          ],
        ),
        body: Padding(
          padding: pad18,
          child: ListView(
            children: [
              10.heightBox,
              Column(
                crossAxisAlignment: crosstart,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 3, bottom: 3),
                    child: Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        Text(
                          "Industry",
                          style: manoropeFontFamily(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff616161)),
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
                      ? GetBuilder<PostQuestionsController>(
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
              10.heightBox,
              TextField(
                maxLines: null, // Allow multiple lines of text
                minLines: 7,
                decoration: InputDecoration(
                    hintText: 'Write your question here...', // Your hint text
                    hintStyle: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff656466)),
                    contentPadding: const EdgeInsets.only(
                        top: 12.0, left: 12.0), // Padding from top and left
                    border: InputBorder.none),
              ).box.white.roundedSM.outerShadow.make(),
              20.heightBox,
              Align(
                alignment: Alignment.topRight,
                child: CustomButton(
                    buttonName: "Post",
                    onPressed: () {},
                    textcolor: whitecolor,
                    loading: false,
                    backgroundColor: darkBrownColor,
                    rounded: false,
                    height: 45,
                    textSize: 14,
                    width: 140),
              ),
              Obx(() => controller.isIndusryOpen.value
                  ? 20.heightBox
                  : (MediaQuery.sizeOf(context).height / 9).heightBox),
              Column(
                children: [
                  10.heightBox,
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Proin volutpat faucibus malesuada venenatis sollicitudin proin sit dignissim. In tortor et aliquam aliquet morbi urna dui. Placerat ac dictum scelerisque bibendum. Enim id nulla risus quisque.? ",
                    style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff656466)),
                    textAlign: TextAlign.center,
                  ),
                  5.heightBox,
                  Text(
                    '\$5',
                    style: manoropeFontFamily(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: darkBrownColor),
                  ),
                  10.heightBox,
                  CustomButton(
                      buttonName: "Purchase An Additional Question",
                      onPressed: () async {
                        await controller.makePayment();
                      },
                      textcolor: blackcolor,
                      loading: false,
                      backgroundColor: const Color(0xffCCD7C5),
                      rounded: false,
                      height: 45,
                      textSize: 10.sp,
                      width: double.infinity),
                  20.heightBox,
                ],
              ).box.padding(pad14).white.roundedSM.outerShadow.make(),
              10.heightBox,
            ],
          ),
        ));
  }
}
