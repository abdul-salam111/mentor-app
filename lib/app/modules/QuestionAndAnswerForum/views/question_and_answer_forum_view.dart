import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/textfield.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/resources/physics.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../resources/colors.dart';
import '../controllers/question_and_answer_forum_controller.dart';

class QuestionAndAnswerForumView
    extends GetView<QuestionAndAnswerForumController> {
  const QuestionAndAnswerForumView({Key? key}) : super(key: key);
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
            'Q&A Forum',
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
                  "New Notifications",
                  style: manoropeFontFamily(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: darkestRed),
                ))
          ],
        ),
        body: ListView(
          physics: neverscroll,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: mainbetween,
                children: [
                  SizedBox(width: 195.w, child: customSearchTextField()),
                  5.widthBox,
                  CustomButton(
                      buttonName: "Create",
                      onPressed: () {},
                      textcolor: whitecolor,
                      loading: false,
                      backgroundColor: darkBrownColor,
                      rounded: false,
                      height: 45,
                      textSize: 12.sp,
                      width: 150)
                ],
              ),
            ),
            15.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: mainbetween,
                children: [
                  Padding(
                    padding: symetrichorizontal8,
                    child: Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        Text(
                          'Industry',
                          style: manoropeFontFamily(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: textfieldgrey),
                        ),
                        const Icon(
                          Icons.expand_more,
                          color: textfieldgrey,
                        )
                      ],
                    ),
                  ).box.border(color: greyColor).rounded.make(),
                  5.widthBox,
                  SizedBox(
                    height: 20.h,
                    width: 220.w,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Padding(
                              padding: symetrichorizontal8,
                              child: Row(
                                mainAxisAlignment: mainbetween,
                                children: [
                                  Text(
                                    'New',
                                    style: manoropeFontFamily(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: textfieldgrey),
                                  ),
                                  5.widthBox,
                                  Icon(
                                    Icons.close,
                                    size: 10.sp,
                                    color: textfieldgrey,
                                  )
                                ],
                              ),
                            ),
                          ).box.border(color: greyColor).rounded.make();
                        }),
                  ),
                  Image.asset(
                    filters,
                    height: 20,
                    width: 20,
                  )
                ],
              ),
            ),
            15.heightBox,
            ListView.builder(
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16, right: 16),
                            child: Text(
                              "11:20am",
                              style: manoropeFontFamily(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff656466)),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: crosstart,
                          children: [
                            CircleAvatar(
                              radius: 23.r,
                              backgroundImage: const AssetImage(girl),
                            ),
                            10.widthBox,
                            Column(
                              crossAxisAlignment: crosstart,
                              children: [
                                Text(
                                  'Chinyere Njoku',
                                  style: manoropeFontFamily(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: blackcolor),
                                ),
                                SizedBox(
                                  width: 250.w,
                                  child: Text(
                                    "Lorem ipsum dolor sit amet consectetur. Proin volutpat faucibus malesuada venenatis sollicitudin proin sit dignissim. In tortor et aliquam aliquet morbi urna dui. Placerat ac dictum scelerisque bibendum. Enim id nulla risus quisque.? ",
                                    style: manoropeFontFamily(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff656466)),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                20.heightBox,
                                Row(
                                  children: [
                                    Image.asset(
                                      replies,
                                      height: 15,
                                      width: 15,
                                    ),
                                    5.widthBox,
                                    Text(
                                      '10 replies',
                                      style: manoropeFontFamily(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff656466)),
                                    )
                                  ],
                                ),
                                10.heightBox,
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                        .box
                        .outerShadow
                        .white
                        .padding(defaultpad)
                        .rounded
                        .margin(EdgeInsets.symmetric(horizontal: 20))
                        .width(double.infinity)
                        .make(),
                  );
                })
          ],
        ));
  }
}
