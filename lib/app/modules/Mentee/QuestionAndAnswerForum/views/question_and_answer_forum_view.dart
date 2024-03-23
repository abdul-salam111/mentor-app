import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/textfield.dart';
import 'package:mentor_app/app/models/getallQuestions.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/resources/physics.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../resources/colors.dart';
import '../controllers/question_and_answer_forum_controller.dart';

class QuestionAndAnswerForumView extends StatefulWidget {
  const QuestionAndAnswerForumView({Key? key}) : super(key: key);

  @override
  State<QuestionAndAnswerForumView> createState() =>
      _QuestionAndAnswerForumViewState();
}

class _QuestionAndAnswerForumViewState
    extends State<QuestionAndAnswerForumView> {
      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      
    });
  }

  final controller = Get.put(QuestionAndAnswerForumController());
  @override
  Widget build(BuildContext context) {
   
    final width = MediaQuery.sizeOf(context).width;
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: mainbetween,
                children: [
                  SizedBox(width: width / 1.7, child: customSearchTextField()),
                  5.widthBox,
                  CustomButton(
                      buttonName: "Create",
                      onPressed: () {
                        Get.toNamed(Routes.POST_QUESTIONS)!.then((value){
                          setState(() {
                            
                          });
                        } );
                      },
                      textcolor: whitecolor,
                      loading: false,
                      backgroundColor: darkBrownColor,
                      rounded: false,
                      height: 45,
                      textSize: 12.sp,
                      width: width / 3.5)
                ],
              ),
            ),
            15.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showIndustryMenu(context);
                    },
                    child: Padding(
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
                  ),
                  5.widthBox,
                  GestureDetector(
                      onTap: () {
                        controller.selectedIndustries.value = '';
                        controller.fetchAllQuestions();
                          setState(() {});
                      },
                      child: Obx(
                        () => controller.selectedIndustries.value == ''
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: symetrichorizontal8,
                                child: Row(
                                  mainAxisAlignment: mainbetween,
                                  children: [
                                    Text(
                                      controller.selectedIndustries.value,
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
                              )
                                .box
                                .border(color: greyColor)
                                .padding(
                                    controller.selectedIndustries.value == ''
                                        ? EdgeInsets.zero
                                        : const EdgeInsets.all(5))
                                .rounded
                                .make(),
                      )),
                  // SizedBox(
                  //   height: 20.h,
                  //   width: 210.w,
                  //   child: ListView.builder(
                  //       shrinkWrap: true,
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: 1,
                  //       itemBuilder: (context, index) {
                  //         return SizedBox(
                  //           child:
                  //         ).box.border(color: greyColor).rounded.make();
                  //       }),
                  // // ),
                  // Image.asset(
                  //   filters,
                  //   height: 20,
                  //   width: 20,
                  // )
                ],
              ),
            ),
            15.heightBox,
            FutureBuilder<GetQuestionModel>(
                future: controller.fetchAllQuestions(),
                builder: (context, AsyncSnapshot<GetQuestionModel> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: SpinKitCircle(
                        color: darkBrownColor,
                        size: 50,
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitCircle(
                        color: darkBrownColor,
                        size: 50,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  else if (snapshot.data!.menteeQuestion!.isEmpty) {
                    return const Center(
                      child: Text("No question found!"),
                    );
                  } else {
                  
                    return Expanded(
                      child: ListView.builder(
                          physics: bouncingscroll,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.menteeQuestion!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, right: 16),
                                      child: Column(
                                        children: [
                                          Text(
                                            controller.formatDate( snapshot.data!.menteeQuestion![index].date!),
                                            style: manoropeFontFamily(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff656466)),
                                          ),
                                          5.heightBox,
                                          //  Text(
                                          //   snapshot.data!.menteeQuestion![1].time!.toString(),
                                          //   style: manoropeFontFamily(
                                          //       fontSize: 10.sp,
                                          //       fontWeight: FontWeight.w600,
                                          //       color: const Color(0xff656466)),
                                          // ),
                                        ],
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
                                          snapshot.data!.menteeQuestion![index].mentee!.email!,
                                            style: manoropeFontFamily(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: blackcolor),
                                          ),
                                          SizedBox(
                                            width: 240.w,
                                            child: Text(
                                                snapshot.data!.menteeQuestion![index].question!,
                                              style: manoropeFontFamily(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff656466)),
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
                                                    color: const Color(
                                                        0xff656466)),
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
                                  .margin(const EdgeInsets.symmetric(
                                      horizontal: 20))
                                  .width(double.infinity)
                                  .make(),
                            );
                          }),
                    );
                  }
                })
          ],
        ));
  }

  void showIndustryMenu(BuildContext context) {
    // Display the PopupMenuButton
   showModalBottomSheet(
  context: context,
  builder: (BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20,),
      color: whitecolor,
      child: ListView(
        shrinkWrap: true,
        children: controller.industries.map((String industry) {
          return ListTile(
            title: Text(
              industry,
              style: manoropeFontFamily(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: blackcolor),
            ),
            onTap: () {
              controller.selectedIndustries.value = industry;
              controller.questionsRepository
                  .fetchAllQuestion(industry: controller.selectedIndustries.value);
              setState(() {});
              Navigator.pop(context); // Close the bottom sheet after selection
            },
          );
        }).toList(),
      ),
    ).box.topRounded(value: 20).clip(Clip.antiAlias).make();
  },
);

  }
}
