import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/shimmerEffect.dart';
import 'package:mentor_app/app/commonWidgets/textfield.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/models/mentor/getSearchedMentorsModel.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/resources/physics.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';
import 'profile_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: whitecolor,
      key: _scaffoldKey,
      endDrawer: ProfileDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            10.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: mainbetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Welcome",
                        style: manoropeFontFamily(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: blackcolor),
                      ),
                      2.widthBox,
                      Text(
                        StorageServices.to.getString(selectedUserType) ==
                                "Mentee"
                            ? getMenteeInfoFromJson(StorageServices.to
                                        .getString(getmenteeinfo))
                                    .fullName ??
                                "Damilola"
                            : getMentorInfoFromJson(StorageServices.to
                                    .getString(getMentorInformationsss))
                                .fullName,
                        style: manoropeFontFamily(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: darkBrownColor),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    child: CachedNetworkImage(
                      imageUrl: StorageServices.to
                                  .getString(selectedUserType) ==
                              "Mentee"
                          ? getMenteeInfoFromJson(
                                  StorageServices.to.getString(getmenteeinfo))
                              .profilePicUrl
                              .toString()
                          : getMentorInfoFromJson(StorageServices.to
                                  .getString(getMentorInformationsss))
                              .profilePicUrl,
                      height: 40.h,
                      width: 50.w,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                  )
                ],
              ),
            ),
            10.heightBox,
            StorageServices.to.getString(selectedUserType) == "Mentee"
                ? Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      onTap: () {
                        Get.toNamed(Routes.FIND_MENTORS);
                      },
                      readOnly: true,
                      style: manoropeFontFamily(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: textfieldgrey),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                  color: greyColor.withOpacity(0.5), width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                  color: greyColor.withOpacity(0.5))),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                  color: greyColor.withOpacity(0.5))),
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintText: "Search for mentors",
                          hintStyle: manoropeFontFamily(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: textfieldgrey),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: textfieldgrey,
                          )),
                    ))
                : const SizedBox.shrink(),
            StorageServices.to.getString(selectedUserType) == "Mentee"
                ? 15.heightBox
                : const SizedBox.shrink(),
            StorageServices.to.getString(selectedUserType) == "Mentee"
                ? Padding(
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
                                  controller.selectedIndustries.value,
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
                            showskillsdropdown(context);
                          },
                          child: Padding(
                            padding: symetrichorizontal8,
                            child: Row(
                              mainAxisAlignment: mainbetween,
                              children: [
                                Text(
                                  "Skills",
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
                  )
                : const SizedBox.shrink(),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: mainbetween,
                children: [
                  Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.lerp(darkBrownColor,
                                    const Color(0xffFF3300), 0.4)!,
                                Color.lerp(const Color(0xffffffff),
                                    const Color(0xffFF3300), 0.4)!,
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: maincenter,
                            children: [
                              Image.asset(
                                findMentors,
                                height: 25,
                                width: 25,
                              ),
                              10.heightBox,
                              Text(
                                StorageServices.to
                                            .getString(selectedUserType) !=
                                        "Mentor"
                                    ? 'Find Mentors'
                                    : 'Mentee requests',
                                style: manoropeFontFamily(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: whitecolor),
                              ),
                            ],
                          ))
                      .box
                      .height(90.w)
                      .outerShadow
                      .clip(Clip.antiAlias)
                      .rounded
                      .make()
                      .onTap(() {
                    StorageServices.to.getString(selectedUserType) == "Mentor"
                        ? Get.toNamed(Routes.CONNECTIONS)
                        : Get.toNamed(Routes.FINDING_BEST_MATCH);
                  }),
                  Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: maincenter,
                            children: [
                              Image.asset(
                                qA,
                                height: 30,
                                width: 30,
                              ),
                              10.heightBox,
                              Text(
                                'Q&A forum  ',
                                style: manoropeFontFamily(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: darkBrownColor),
                              ),
                            ],
                          ))
                      .box
                      .white
                      .height(90.w)
                      .outerShadow
                      .clip(Clip.antiAlias)
                      .rounded
                      .make()
                      .onTap(() {
                    Get.toNamed(Routes.QUESTION_AND_ANSWER_FORUM);
                  }),
                  Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          // decoration: BoxDecoration(
                          //   gradient: LinearGradient(
                          //     begin: Alignment.topCenter,
                          //     end: Alignment.bottomCenter,
                          //     colors: [
                          //       Color.lerp(darkBrownColor,
                          //           const Color(0xffFF3300), 0.4)!,
                          //       Color.lerp(const Color(0xffffffff),
                          //           const Color(0xffFF3300), 0.4)!,
                          //     ],
                          //   ),
                          // ),
                          child: Column(
                            mainAxisAlignment: maincenter,
                            children: [
                              Image.asset(
                                jobForum,
                                height: 30,
                                width: 30,
                              ),
                              10.heightBox,
                              Text(
                                'Job Forum  ',
                                style: manoropeFontFamily(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: darkBrownColor),
                              ),
                            ],
                          ))
                      .box
                      .white
                      .height(90.w)
                      .outerShadow
                      .clip(Clip.antiAlias)
                      .rounded
                      .make()
                      .onTap(() {
                    Get.toNamed(Routes.POSTED_JOBS);
                  }),
                ],
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                'Upcoming Meetings',
                style: manoropeFontFamily(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: darkBrownColor),
              ),
            ),
            10.heightBox,
            FutureBuilder(
                future:
                    StorageServices.to.getString(selectedUserType) == "Mentee"
                        ? controller.fetchMenteeScheduledMeetings()
                        : controller.fetchMentorScheduledMeetings(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: AnotherShimmerList(3),
                    );
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    // If snapshot has no data or data is null
                    return const Center(
                      child: Text(
                        "No meetings available",
                        style: TextStyle(color: blackcolor),
                      ),
                    );
                  } else if (snapshot.data['meetingResponseList'].isEmpty) {
                    // If meetingResponseList is empty
                    return Center(
                        child: Image.asset(
                      "assets/images/not found.jpg",
                      width: 100.w,
                      height: 100.h,
                    ));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: ListView.builder(
                          itemCount:
                              snapshot.data!['meetingResponseList'].length > 1
                                  ? 2
                                  : snapshot
                                      .data!['meetingResponseList'].length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                radius: 30.r,
                                backgroundImage: CachedNetworkImageProvider(
                                    StorageServices.to
                                                .getString(selectedUserType) ==
                                            "Mentee"
                                        ? snapshot.data!['meetingResponseList']
                                            [index]['mentor']['profilePicUrl']
                                        : snapshot.data!['meetingResponseList']
                                            [index]['mentee']['profilePicUrl']),
                              ),
                              title: Column(
                                crossAxisAlignment: crosstart,
                                children: [
                                  Text(
                                    StorageServices.to
                                                .getString(selectedUserType) ==
                                            "Mentee"
                                        ? snapshot.data!['meetingResponseList']
                                            [index]['mentor']['fullName']
                                        : snapshot.data!['meetingResponseList']
                                            [index]['mentee']['fullName'],
                                    style: manoropeFontFamily(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w800,
                                        color: blackcolor),
                                  ),
                                  Text(
                                    snapshot.data!['meetingResponseList'][index]
                                        ['appointmentReason'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: manoropeFontFamily(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: blackcolor),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                "Today at ${snapshot.data!['meetingResponseList'][index]['startTime']} - ${snapshot.data!['meetingResponseList'][index]['endTime']}",
                                style: manoropeFontFamily(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: textfieldgrey),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: textfieldgrey,
                                size: 15.sp,
                              ),
                            )
                                .box
                                .outerShadow
                                .white
                                .padding(defaultpad)
                                .roundedSM
                                .make();
                          }),
                    );
                  }
                }),
            20.heightBox,
            StorageServices.to.getString(selectedUserType) == "Mentee"
                ? Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        Text(
                          'Top Mentors',
                          style: manoropeFontFamily(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: darkBrownColor),
                        ),
                        TextButton(
                          child: Text(
                            'See All',
                            style: manoropeFontFamily(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: darkBrownColor),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.FIND_MENTORS);
                          },
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            StorageServices.to.getString(selectedUserType) == "Mentee"
                ? FutureBuilder(
                    future: controller.searchMentors(
                        availablility: "Accept new mentees",
                        skills: [],
                        search: '',
                        industry: controller.selectedIndustries.value),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const HomeScreenShimmerList();
                      } else if (!snapshot.hasData) {
                        return const Center(
                          child: Text("Not found"),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.data!.isEmpty) {
                        return Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.FIND_MENTORS);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/not found.jpg",
                                  width: 300.w,
                                  height: 200.h,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "Couldn't found, search to find.",
                                  style: manoropeFontFamily(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: blackcolor),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: GridView.builder(
                            physics: neverscroll,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length > 10
                                ? 10
                                : snapshot.data!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: 115.h,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                          
                              return Column(
                                crossAxisAlignment: crosstart,
                                children: [
                                  Row(
                                    mainAxisAlignment: mainbetween,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(snapshot
                                            .data![index]['profilePicUrl']),
                                      )

                                      // const Icon(
                                      //   Icons.favorite,
                                      //   color: greencolor,
                                      // )
                                    ],
                                  ),
                                  10.heightBox,
                                  Text(
                                    snapshot.data![index]['fullName'],
                                    style: manoropeFontFamily(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: blackcolor),
                                  ),
                                  5.heightBox,
                                  Text(
                                    snapshot.data![index]['mentorshipStyle'],
                                    style: manoropeFontFamily(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: blackcolor),
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: mainbetween,
                                  //   children: [
                                  //     Text(
                                  //       "Health",
                                  //       style: manoropeFontFamily(
                                  //           fontSize: 10,
                                  //           fontWeight: FontWeight.w400,
                                  //           color: textfieldgrey),
                                  //     ),
                                  //     Row(
                                  //       children: [
                                  //         Text(
                                  //           "4.9",
                                  //           style: manoropeFontFamily(
                                  //               fontSize: 12.sp,
                                  //               fontWeight: FontWeight.w500,
                                  //               color: blackcolor),
                                  //         ),
                                  //         10.widthBox,
                                  //         Icon(
                                  //           Icons.star,
                                  //           color: ratingcolor,
                                  //           size: 17.sp,
                                  //         )
                                  //       ],
                                  //     )
                                  //   ],
                                  // )
                                ],
                              )
                                  .box
                                  .height(110.h)
                                  .padding(const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10))
                                  .white
                                  .outerShadow
                                  .roundedSM
                                  .make()
                                  .onTap(() {
                                Get.toNamed(Routes.MENTOR_PROFILE,
                                    arguments: snapshot.data![index]['email']);
                              });
                            }),
                      );
                    })
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
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
                  controller.searchMentors(
                      availablility: 'Accept new mentees',
                      industry: controller.selectedIndustries.value,
                      search: '',
                      skills: controller.selectedSkills);
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

  void showskillsdropdown(BuildContext context) {
    // Display the PopupMenuButton
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          color: whitecolor,
          child: Column(
            children: [
              Expanded(
                child: GetBuilder<HomeController>(builder: (contextsss) {
                  return ListView.builder(
                    itemCount: controller.computerScienceSkills.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final skill = controller.computerScienceSkills[index];
                      final isSelected =
                          controller.selectedSkills.contains(skill);
                      return ListTile(
                        title: Text(
                          skill,
                          style: const TextStyle(fontSize: 14),
                        ),
                        leading: Image.asset(
                          skills,
                          height: 25,
                          width: 25,
                        ),
                        trailing: isSelected == true
                            ? SizedBox(
                                height: 10.h,
                                width: 10.h,
                              ).box.color(darkBrownColor).rounded.make()
                            : SizedBox(
                                height: 10.h,
                                width: 10.h,
                              )
                                .box
                                .border(color: darkBrownColor)
                                .rounded
                                .make(),
                      )
                          .box
                          .margin(const EdgeInsets.all(8))
                          .color(halfwhitecolor)
                          .rounded
                          .make()
                          .onTap(() {
                        if (isSelected) {
                          controller.selectedSkills.remove(skill);
                          contextsss.update();
                        } else {
                          controller.selectedSkills.add(skill);
                          contextsss.update();
                        }
                      });
                    },
                  );
                }),
              ),
              CustomButton(
                backgroundColor: darkBrownColor,
                textSize: 14.sp,
                width: double.infinity,
                height: 40.h,
                textcolor: whitecolor,
                buttonName: "Search",
                loading: false,
                rounded: false,
                onPressed: () {
                  controller.isSkillsOpen.value = false;
                  controller.searchMentors(
                      availablility: 'Accept new mentees',
                      industry: controller.selectedIndustries.value,
                      search: '',
                      skills: controller.selectedSkills);
                  setState(() {});
                  Navigator.pop(
                      context); // Close the bottom sheet after selection
                },
              ),
            ],
          ),
        ).box.topRounded(value: 20).clip(Clip.antiAlias).make();
      },
    );
  }
}
