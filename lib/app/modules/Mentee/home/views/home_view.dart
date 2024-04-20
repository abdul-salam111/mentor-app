import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/textfield.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
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
                        getMenteeInfoFromJson(
                                    StorageServices.to.getString(getmenteeinfo))
                                .fullName ??
                            "Damilola",
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
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(profilepicture),
                    ),
                  )
                ],
              ),
            ),
            10.heightBox,
            Padding(
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
                          borderSide:
                              BorderSide(color: greyColor.withOpacity(0.5))),
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide:
                              BorderSide(color: greyColor.withOpacity(0.5))),
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
                )),
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
            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.r,
                      backgroundImage: const AssetImage(mentor),
                    ),
                    title: Text(
                      "Health chat with Lidia",
                      style: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: blackcolor),
                    ),
                    subtitle: Text(
                      "Today at 9:00 PM - 30 min",
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
                  ).box.outerShadow.white.padding(defaultpad).roundedSM.make(),
                  10.heightBox,
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.r,
                      backgroundImage: const AssetImage(mentor2),
                    ),
                    title: Text(
                      "Mentoring with Tom",
                      style: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: blackcolor),
                    ),
                    subtitle: Text(
                      "Today at 9:00 PM - 30 min",
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
                  ).box.outerShadow.white.padding(defaultpad).roundedSM.make(),
                ],
              ),
            ),
            20.heightBox,
            Padding(
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
            ),
            FutureBuilder(
                future: controller.searchMentors(
                    availablility: "accept new mentees",
                    skills: [
                      'app',
                      'web',
                    ],
                    search: 'abdul salam',
                    industry: 'Information Technology (IT)'),
                builder: (context,
                    AsyncSnapshot<List<GetSearchedMentors>> snapshot) {
                  if (!snapshot.hasData) {
                    return SizedBox.shrink();
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center();
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
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 115.h,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              const Row(
                                mainAxisAlignment: mainbetween,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(mentor),
                                  ),
                                  Icon(
                                    Icons.favorite,
                                    color: greencolor,
                                  )
                                ],
                              ),
                              10.heightBox,
                              Text(
                                "Anna Tchaiko",
                                style: manoropeFontFamily(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: blackcolor),
                              ),
                              5.heightBox,
                              Row(
                                mainAxisAlignment: mainbetween,
                                children: [
                                  Text(
                                    "Health",
                                    style: manoropeFontFamily(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: textfieldgrey),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "4.9",
                                        style: manoropeFontFamily(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: blackcolor),
                                      ),
                                      10.widthBox,
                                      Icon(
                                        Icons.star,
                                        color: ratingcolor,
                                        size: 17.sp,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                              .box
                              .height(110.h)
                              .padding(EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10))
                              .white
                              .outerShadow
                              .roundedSM
                              .make()
                              .onTap(() {
                            Get.toNamed(Routes.MENTOR_PROFILE);
                          });
                        }),
                  );
                })
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
                },
              ),
            ],
          ),
        ).box.topRounded(value: 20).clip(Clip.antiAlias).make();
      },
    );
  }
}
