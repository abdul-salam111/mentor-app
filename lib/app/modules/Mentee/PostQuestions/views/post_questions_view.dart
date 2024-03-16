import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';

import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
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
                child: GetBuilder<PostQuestionsController>(

                  builder: (cont) {
                    return Text(
                      (cont.getQuestionNumbers().toString()),
                      style: manoropeFontFamily(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                          color: whitecolor),
                    );
                  }
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
        body: ListView(
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
                      Obx(
                        () => Text(
                          controller.selectedIndustries.value,
                          style: manoropeFontFamily(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff616161)),
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
                    ? GetBuilder<PostQuestionsController>(
                        builder: (contextsss) {
                        return SizedBox(
                          height: 200.h,
                          child: ListView.builder(
                            itemCount: controller.industries.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final skill = controller.industries[index];

                              return Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      controller.selectedIndustries.value =
                                          controller.industries[index];
                                      controller.isIndusryOpen.value =
                                          !controller.isIndusryOpen.value;
                                    },
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
                .margin(const EdgeInsets.only(left: 18, right: 18, top: 10))
                .roundedSM
                .make(),
            10.heightBox,
            TextField(
              style: manoropeFontFamily(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff656466)),
              maxLines: null, // Allow multiple lines of text
              minLines: 7,
              controller: controller.questionController.value,
              decoration: InputDecoration(
                  hintText: 'Write your question here...', // Your hint text
                  hintStyle: manoropeFontFamily(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff656466)),
                  contentPadding: const EdgeInsets.only(
                      top: 12.0, left: 12.0), // Padding from top and left
                  border: InputBorder.none),
            )
                .box
                .white
                .roundedSM
                .margin(const EdgeInsets.only(left: 18, right: 18, top: 10))
                .outerShadow
                .make(),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18,),
              child: Align(
                alignment: Alignment.topRight,
                child: CustomButton(
                    buttonName: "Post",
                    onPressed: () {
                    
                      controller.postQuestions();
                    },
                    textcolor: controller.getQuestionNumbers() != 0
                        ? whitecolor
                        : blackcolor,
                    loading: false,
                    backgroundColor: controller.getQuestionNumbers() != 0
                        ? darkBrownColor
                        : greyColor,
                    rounded: false,
                    height: 45,
                    textSize: 14,
                    width: 140),
              ),
            ),
            Obx(() => controller.isIndusryOpen.value
                ? 20.heightBox
                : (MediaQuery.sizeOf(context).height / 9).heightBox),
            controller.getQuestionNumbers() == 0
                ? Column(
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
                           
                           await controller.makePayment(amount: '5');
                           
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
                  ).box.padding(pad14).white.margin(EdgeInsets.only(left: 18, right: 18)).roundedSM.outerShadow.make()
                : const SizedBox.shrink(),
            10.heightBox,
          ],
        ));
  }
}
