import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/shimmerEffect.dart';
import 'package:mentor_app/app/models/questions/getallQuestions.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/resources/physics.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
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
  final controller = Get.put(QuestionAndAnswerForumController());
  bool sortAscending = true; // Variable to track the sorting order
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text.toLowerCase();
      });
    });
  }

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
            'Q&A Forum',
            style: GoogleFonts.manrope(
                fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  sortAscending = !sortAscending;
                });
              },
              icon: Icon(
                sortAscending ? Icons.arrow_upward : Icons.arrow_downward,
                color: Colors.black,
              ),
            ),
            StorageServices.to.getString(selectedUserType) == "Mentee"
                ? TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.POST_QUESTIONS)!.then((value) {
                        setState(() {});
                      });
                    },
                    child: const Text(
                      "Create",
                      style: TextStyle(color: darkBrownColor),
                    ))
                : const SizedBox.shrink()
          ],
        ),
        body: Column(
          children: [
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
                ],
              ),
            ),
            15.heightBox,

            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search questions...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  FutureBuilder<GetQuestionModel>(
                    future: controller.fetchAllQuestions(),
                    builder:
                        (context, AsyncSnapshot<GetQuestionModel> snapshot) {
                      if (!snapshot.hasData) {
                        return ShimmerList(10);
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return ShimmerList(10);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.data!.menteeQuestion!.isEmpty) {
                        return Center(
                          child: Column(
                            children: [
                              const Text("Question Not Found"),
                              10.heightBox,
                              Image.asset("assets/images/not found.jpg"),
                            ],
                          ),
                        );
                      } else {
                        // Filter the questions based on the search query
                        List<MenteeQuestion> questions =
                            snapshot.data!.menteeQuestion!;
                        questions = questions.where((question) {
                          return question.question!
                              .toLowerCase()
                              .contains(searchQuery);
                        }).toList();

                        // Sort the questions by date in descending order
                        questions.sort((a, b) {
                          if (sortAscending) {
                            return a.date!.compareTo(b.date!);
                          } else {
                            return b.date!.compareTo(a.date!);
                          }
                        });

                        return ListView.builder(
                          physics: bouncingscroll,
                          shrinkWrap: true,
                          itemCount: questions.length,
                          itemBuilder: (context, index) {
                            var isAnswerOpen = false.obs;
                            final answerController =
                                TextEditingController().obs;
                            var seeReplies = false.obs;
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
                                            controller.formatDate(
                                                questions[index].date!),
                                            style: manoropeFontFamily(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff656466)),
                                          ),
                                          5.heightBox,
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: crosstart,
                                    children: [
                                      questions[index].mentee!.profilePicUrl !=
                                                  null &&
                                              questions[index]
                                                      .mentee!
                                                      .profilePicUrl !=
                                                  ""
                                          ? SizedBox(
                                              child: CachedNetworkImage(
                                                imageUrl: questions[index]
                                                    .mentee!
                                                    .profilePicUrl!,
                                                width: 50,
                                                height: 50,
                                              ),
                                            )
                                              .box
                                              .roundedFull
                                              .clip(Clip.antiAlias)
                                              .make()
                                          : CircleAvatar(
                                              radius: 23.r,
                                              child: Image.asset(
                                                mentor2,
                                                fit: BoxFit.cover,
                                              )),
                                      10.widthBox,
                                      Column(
                                        crossAxisAlignment: crosstart,
                                        children: [
                                          Text(
                                            questions[index].mentee!.fullName !=
                                                    null
                                                ? questions[index]
                                                    .mentee!
                                                    .fullName!
                                                : "UserName",
                                            style: manoropeFontFamily(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: blackcolor),
                                          ),
                                          SizedBox(
                                            width: 240.w,
                                            child: Text(
                                              questions[index].question!,
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
                                              GestureDetector(
                                                onTap: () {
                                                  seeReplies.value =
                                                      !seeReplies.value;
                                                  isAnswerOpen.value =
                                                      !isAnswerOpen.value;
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      replies,
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                    5.widthBox,
                                                    Text(
                                                      'Replies',
                                                      style: manoropeFontFamily(
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff656466)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              70.widthBox,
                                              StorageServices.to.getString(
                                                          selectedUserType) ==
                                                      "Mentor"
                                                  ? CustomButton(
                                                      buttonName: "Answer",
                                                      onPressed: () {
                                                        seeReplies.value =
                                                            !seeReplies.value;
                                                        isAnswerOpen.value =
                                                            !isAnswerOpen.value;
                                                      },
                                                      textcolor: whitecolor,
                                                      loading: false,
                                                      backgroundColor:
                                                          const Color(
                                                              0xff109804),
                                                      rounded: true,
                                                      height: 20.h,
                                                      textSize: 10.sp,
                                                      width: 70.w)
                                                  : const SizedBox.shrink(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Obx(() => seeReplies.value
                                      ? const Divider(
                                          thickness: 1,
                                          color: greyColor,
                                        )
                                      : const SizedBox.shrink()),
                                  Obx(
                                    () => seeReplies.value
                                        ? SizedBox(
                                            height: 200.h,
                                            child: FutureBuilder(
                                                future: controller.getReplies(
                                                    questions[index].id),
                                                builder: (context,
                                                    AsyncSnapshot snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return Center(
                                                        child:
                                                            AnotherShimmerList(
                                                                10));
                                                  }
                                                  if (!snapshot.hasData) {
                                                    return const Center(
                                                      child: Text(
                                                        "No answer submitted!",
                                                        style: TextStyle(
                                                            color: blackcolor),
                                                      ),
                                                    );
                                                  }

                                                  return ListView.builder(
                                                    itemCount:
                                                        snapshot.data.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ListTile(
                                                        leading: CircleAvatar(
                                                          backgroundImage: snapshot
                                                                              .data[
                                                                          index]
                                                                      [
                                                                      'profilePicUrl'] !=
                                                                  null
                                                              ? CachedNetworkImageProvider(
                                                                  snapshot.data[
                                                                          index]
                                                                      [
                                                                      'profilePicUrl'])
                                                              : const AssetImage(
                                                                      mentor)
                                                                  as ImageProvider,
                                                        ),
                                                        title: Text(
                                                          snapshot.data[index][
                                                              'mentorFullName'],
                                                          style:
                                                              manoropeFontFamily(
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      blackcolor),
                                                        ),
                                                        subtitle: Column(
                                                          crossAxisAlignment:
                                                              crosstart,
                                                          children: [
                                                            Text(
                                                              snapshot.data[
                                                                      index]
                                                                  ['answer'],
                                                              style: manoropeFontFamily(
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      blackcolor),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .favorite_outline,
                                                                  size: 20.sp,
                                                                ),
                                                                Text(
                                                                  '10',
                                                                  style: manoropeFontFamily(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color:
                                                                          blackcolor),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                  StorageServices.to
                                              .getString(selectedUserType) ==
                                          'Mentor'
                                      ? Obx(() => isAnswerOpen.value
                                          ? const Divider(
                                              thickness: 1,
                                              color: greyColor,
                                            )
                                          : const SizedBox.shrink())
                                      : const SizedBox.shrink(),
                                  StorageServices.to
                                              .getString(selectedUserType) ==
                                          'Mentor'
                                      ? Obx(() => isAnswerOpen.value
                                          ? TextField(
                                              style: manoropeFontFamily(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff656466)),
                                              maxLines: null,
                                              minLines: 3,
                                              controller:
                                                  answerController.value,
                                              decoration: InputDecoration(
                                                  suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .submitAnswer(
                                                                answerController
                                                                    .value.text
                                                                    .toString(),
                                                                questions[index]
                                                                    .id)
                                                            .then((value) {
                                                          answerController.value
                                                              .clear();
                                                        });
                                                      },
                                                      child: const Icon(
                                                          Icons.send)),
                                                  hintText:
                                                      'Write your answer here...',
                                                  hintStyle: manoropeFontFamily(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff656466)),
                                                  border:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: greyColor),
                                                  ),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: greyColor),
                                                  ),
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: greyColor),
                                                  )),
                                            )
                                          : const SizedBox.shrink())
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),

            // FutureBuilder<GetQuestionModel>(
            //     future: controller.fetchAllQuestions(),
            //     builder: (context, AsyncSnapshot<GetQuestionModel> snapshot) {
            //       if (!snapshot.hasData) {
            //         return ShimmerList(10);
            //       } else if (snapshot.connectionState ==
            //           ConnectionState.waiting) {
            //         return ShimmerList(10);
            //       } else if (snapshot.hasError) {
            //         return Center(
            //           child: Text(snapshot.error.toString()),
            //         );
            //       } else if (snapshot.data!.menteeQuestion!.isEmpty) {
            //         return Center(
            //           child: Column(
            //             children: [
            //               const Text("Question Not Found"),
            //               10.heightBox,
            //               Image.asset("assets/images/not found.jpg"),
            //             ],
            //           ),
            //         );
            //       } else {
            //           // Sort the questions by date in descending order
            //     List<MenteeQuestion> questions =
            //         snapshot.data!.menteeQuestion!;
            //     questions.sort((a, b) {
            //       if (sortAscending) {
            //         return a.date!.compareTo(b.date!);
            //       } else {
            //         return b.date!.compareTo(a.date!);
            //       }
            //     });
            //         return Expanded(
            //           child: ListView.builder(
            //               physics: bouncingscroll,
            //               shrinkWrap: true,
            //               itemCount: snapshot.data!.menteeQuestion!.length,
            //               itemBuilder: (context, index) {
            //                 var isAnswerOpen = false.obs;
            //                 final answerController =
            //                     TextEditingController().obs;
            //                 var seeReplies = false.obs;
            //                 return Padding(
            //                   padding: const EdgeInsets.only(top: 5, bottom: 5),
            //                   child: Column(
            //                     children: [
            //                       Align(
            //                         alignment: Alignment.topRight,
            //                         child: Padding(
            //                           padding: const EdgeInsets.only(
            //                               top: 16, right: 16),
            //                           child: Column(
            //                             children: [
            //                               Text(
            //                                 controller.formatDate(snapshot.data!
            //                                     .menteeQuestion![index].date!),
            //                                 style: manoropeFontFamily(
            //                                     fontSize: 10.sp,
            //                                     fontWeight: FontWeight.w600,
            //                                     color: const Color(0xff656466)),
            //                               ),
            //                               5.heightBox,
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                       Row(
            //                         crossAxisAlignment: crosstart,
            //                         children: [
            //                           snapshot.data!.menteeQuestion![index]
            //                                           .mentee!.profilePicUrl !=
            //                                       null &&
            //                                   snapshot
            //                                           .data!
            //                                           .menteeQuestion![index]
            //                                           .mentee!
            //                                           .profilePicUrl !=
            //                                       ""
            //                               ? SizedBox(
            //                                   child: CachedNetworkImage(
            //                                     imageUrl: snapshot
            //                                         .data!
            //                                         .menteeQuestion![index]
            //                                         .mentee!
            //                                         .profilePicUrl!,
            //                                     width: 50,
            //                                     height: 50,
            //                                   ),
            //                                 )
            //                                   .box
            //                                   .roundedFull
            //                                   .clip(Clip.antiAlias)
            //                                   .make()
            //                               : CircleAvatar(
            //                                   radius: 23.r,
            //                                   child: Image.asset(
            //                                     mentor2,
            //                                     fit: BoxFit.cover,
            //                                   )),
            //                           10.widthBox,
            //                           Column(
            //                             crossAxisAlignment: crosstart,
            //                             children: [
            //                               Text(
            //                                 snapshot
            //                                             .data!
            //                                             .menteeQuestion![index]
            //                                             .mentee!
            //                                             .fullName !=
            //                                         null
            //                                     ? snapshot
            //                                         .data!
            //                                         .menteeQuestion![index]
            //                                         .mentee!
            //                                         .fullName!
            //                                     : "UserName",
            //                                 style: manoropeFontFamily(
            //                                     fontSize: 12.sp,
            //                                     fontWeight: FontWeight.w400,
            //                                     color: blackcolor),
            //                               ),
            //                               SizedBox(
            //                                 width: 240.w,
            //                                 child: Text(
            //                                   snapshot
            //                                       .data!
            //                                       .menteeQuestion![index]
            //                                       .question!,
            //                                   style: manoropeFontFamily(
            //                                       fontSize: 11.sp,
            //                                       fontWeight: FontWeight.w400,
            //                                       color:
            //                                           const Color(0xff656466)),
            //                                   textAlign: TextAlign.justify,
            //                                 ),
            //                               ),
            //                               20.heightBox,
            //                               Row(
            //                                 children: [
            //                                   GestureDetector(
            //                                     onTap: () {
            //                                       seeReplies.value =
            //                                           !seeReplies.value;
            //                                       isAnswerOpen.value =
            //                                           !isAnswerOpen.value;
            //                                     },
            //                                     child: Row(
            //                                       children: [
            //                                         Image.asset(
            //                                           replies,
            //                                           height: 15,
            //                                           width: 15,
            //                                         ),
            //                                         5.widthBox,
            //                                         Text(
            //                                           'Replies',
            //                                           style: manoropeFontFamily(
            //                                               fontSize: 11.sp,
            //                                               fontWeight:
            //                                                   FontWeight.w400,
            //                                               color: const Color(
            //                                                   0xff656466)),
            //                                         ),
            //                                       ],
            //                                     ),
            //                                   ),
            //                                   70.widthBox,
            //                                   StorageServices.to.getString(
            //                                               selectedUserType) ==
            //                                           "Mentor"
            //                                       ? CustomButton(
            //                                           buttonName: "Answer",
            //                                           onPressed: () {
            //                                             seeReplies.value =
            //                                                 !seeReplies.value;
            //                                             isAnswerOpen.value =
            //                                                 !isAnswerOpen.value;
            //                                           },
            //                                           textcolor: whitecolor,
            //                                           loading: false,
            //                                           backgroundColor:
            //                                               const Color(
            //                                                   0xff109804),
            //                                           rounded: true,
            //                                           height: 20.h,
            //                                           textSize: 10.sp,
            //                                           width: 70.w)
            //                                       : const SizedBox.shrink(),
            //                                 ],
            //                               ),
            //                             ],
            //                           ),
            //                         ],
            //                       ),
            //                       Obx(() => seeReplies.value
            //                           ? const Divider(
            //                               thickness: 1,
            //                               color: greyColor,
            //                             )
            //                           : const SizedBox.shrink()),
            //                       Obx(
            //                         () => seeReplies.value
            //                             ? SizedBox(
            //                                 height: 200.h,
            //                                 child: FutureBuilder(
            //                                     future: controller.getReplies(
            //                                         snapshot
            //                                             .data!
            //                                             .menteeQuestion![index]
            //                                             .id),
            //                                     builder: (context,
            //                                         AsyncSnapshot snapshot) {
            //                                       if (snapshot
            //                                               .connectionState ==
            //                                           ConnectionState.waiting) {
            //                                         return Center(
            //                                             child:
            //                                                 AnotherShimmerList(
            //                                                     10));
            //                                       }
            //                                       if (!snapshot.hasData) {
            //                                         return const Center(
            //                                           child: Text(
            //                                             "No answer submitted!",
            //                                             style: TextStyle(
            //                                                 color: blackcolor),
            //                                           ),
            //                                         );
            //                                       }

            //                                       return ListView.builder(
            //                                         itemCount:
            //                                             snapshot.data.length,
            //                                         itemBuilder:
            //                                             (context, index) {
            //                                           return ListTile(
            //                                             leading: CircleAvatar(
            //                                               backgroundImage: snapshot
            //                                                                   .data[
            //                                                               index]
            //                                                           [
            //                                                           'profilePicUrl'] !=
            //                                                       null
            //                                                   ? CachedNetworkImageProvider(
            //                                                       snapshot.data[
            //                                                               index]
            //                                                           [
            //                                                           'profilePicUrl'])
            //                                                   : const AssetImage(
            //                                                           mentor)
            //                                                       as ImageProvider,
            //                                             ),
            //                                             title: Text(
            //                                               snapshot.data[index][
            //                                                   'mentorFullName'],
            //                                               style:
            //                                                   manoropeFontFamily(
            //                                                       fontSize:
            //                                                           12.sp,
            //                                                       fontWeight:
            //                                                           FontWeight
            //                                                               .w600,
            //                                                       color:
            //                                                           blackcolor),
            //                                             ),
            //                                             subtitle: Column(
            //                                               crossAxisAlignment:
            //                                                   crosstart,
            //                                               children: [
            //                                                 Text(
            //                                                   snapshot.data[
            //                                                           index]
            //                                                       ['answer'],
            //                                                   style: manoropeFontFamily(
            //                                                       fontSize:
            //                                                           12.sp,
            //                                                       fontWeight:
            //                                                           FontWeight
            //                                                               .w400,
            //                                                       color:
            //                                                           blackcolor),
            //                                                 ),
            //                                                 Column(
            //                                                   children: [
            //                                                     Icon(
            //                                                       Icons
            //                                                           .favorite_outline,
            //                                                       size: 20.sp,
            //                                                     ),
            //                                                     Text(
            //                                                       '10',
            //                                                       style: manoropeFontFamily(
            //                                                           fontSize:
            //                                                               12.sp,
            //                                                           fontWeight:
            //                                                               FontWeight
            //                                                                   .w500,
            //                                                           color:
            //                                                               blackcolor),
            //                                                     ),
            //                                                   ],
            //                                                 ),
            //                                               ],
            //                                             ),
            //                                           );
            //                                         },
            //                                       );
            //                                     }),
            //                               )
            //                             : const SizedBox.shrink(),
            //                       ),
            //                       StorageServices.to
            //                                   .getString(selectedUserType) ==
            //                               'Mentor'
            //                           ? Obx(() => isAnswerOpen.value
            //                               ? const Divider(
            //                                   thickness: 1,
            //                                   color: greyColor,
            //                                 )
            //                               : const SizedBox.shrink())
            //                           : const SizedBox.shrink(),
            //                       StorageServices.to
            //                                   .getString(selectedUserType) ==
            //                               'Mentor'
            //                           ? Obx(() => isAnswerOpen.value
            //                               ? TextField(
            //                                   style: manoropeFontFamily(
            //                                       fontSize: 14.sp,
            //                                       fontWeight: FontWeight.w400,
            //                                       color:
            //                                           const Color(0xff656466)),
            //                                   maxLines:
            //                                       null, // Allow multiple lines of text
            //                                   minLines: 3,
            //                                   controller:
            //                                       answerController.value,
            //                                   decoration: InputDecoration(
            //                                       suffixIcon: GestureDetector(
            //                                           onTap: () {
            //                                             controller
            //                                                 .submitAnswer(
            //                                                     answerController
            //                                                         .value.text
            //                                                         .toString(),
            //                                                     snapshot
            //                                                         .data!
            //                                                         .menteeQuestion![
            //                                                             index]
            //                                                         .id)
            //                                                 .then((value) {
            //                                               answerController.value
            //                                                   .clear();
            //                                             });
            //                                           },
            //                                           child: const Icon(
            //                                               Icons.send)),
            //                                       hintText:
            //                                           'Write your answer here...', // Your hint text
            //                                       hintStyle: manoropeFontFamily(
            //                                           fontSize: 12.sp,
            //                                           fontWeight:
            //                                               FontWeight.w400,
            //                                           color: const Color(
            //                                               0xff656466)),
            //                                       contentPadding: const EdgeInsets
            //                                           .only(
            //                                           top: 12.0,
            //                                           left:
            //                                               12.0), // Padding from top and left
            //                                       border: InputBorder.none),
            //                                 )
            //                                   .box
            //                                   .white
            //                                   .roundedSM
            //                                   .outerShadow
            //                                   .make()
            //                               : const SizedBox.shrink())
            //                           : const SizedBox.shrink(),
            //                     ],
            //                   )
            //                       .box
            //                       .outerShadow
            //                       .white
            //                       .padding(defaultpad)
            //                       .rounded
            //                       .margin(const EdgeInsets.symmetric(
            //                           horizontal: 20))
            //                       .width(double.infinity)
            //                       .make(),
            //                 );
            //               }),
            //         );
            //       }
            //     })
          ],
        ));
  }

  void showIndustryMenu(BuildContext context) {
    // Display the PopupMenuButton
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(
            top: 20,
          ),
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
                  controller.questionsRepository.fetchAllQuestion(
                      industry: controller.selectedIndustries.value);
                  setState(() {});
                  Navigator.pop(
                      context); // Close the bottom sheet after selection
                },
              );
            }).toList(),
          ),
        ).box.topRounded(value: 20).clip(Clip.antiAlias).make();
      },
    );
  }
}
