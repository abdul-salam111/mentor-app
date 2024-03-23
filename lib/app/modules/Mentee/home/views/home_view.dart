import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/textfield.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/resources/physics.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';
import 'profile_drawer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
       endDrawer: ProfileDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            10.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
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
                        "Damilola",
                        style: manoropeFontFamily(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: darkBrownColor),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
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
                padding: const EdgeInsets.only(left: 15,right: 15),
              child: customSearchTextField(),
            ),
            10.heightBox,
            Padding(
               padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: 90.w,
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
                    ),
                  ).box.border(color: greyColor).rounded.make(),
                  10.widthBox,
                  SizedBox(
                    width: 70.w,
                    child: Padding(
                      padding: symetrichorizontal8,
                      child: Row(
                        mainAxisAlignment: mainbetween,
                        children: [
                          Text(
                            'Skills',
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
                    ),
                  ).box.border(color: greyColor).rounded.make(),
                  10.widthBox,
                  SizedBox(
                    width: 100.w,
                    child: Padding(
                      padding: symetrichorizontal8,
                      child: Row(
                        mainAxisAlignment: mainbetween,
                        children: [
                          Text(
                            'Availability',
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
                    ),
                  ).box.border(color: greyColor).rounded.make(),
                ],
              ),
            ),
            20.heightBox,
            Padding(
               padding: const EdgeInsets.only(left: 15,right: 15),
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
                                'Find Mentors',
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
                      .make(),
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
                      .make().onTap(() {
                         Get.toNamed(Routes.POSTED_JOBS);
                      }),
                ],
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
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
             padding: const EdgeInsets.only(left: 15,right: 15),
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
             padding: const EdgeInsets.only(left: 15,right: 15),
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
            Padding(
               padding: const EdgeInsets.only(left: 15,right: 15),
              child: GridView.builder(
                  physics: neverscroll,
                  shrinkWrap: true,
                  itemCount: 12,
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
                        .padding(EdgeInsets.symmetric(horizontal: 20,vertical: 10))
                        .white
                        .outerShadow
                        .roundedSM
                        .make().onTap(() {Get.toNamed(Routes.MENTOR_PROFILE);});
                  }),
            )
          ],
        ),
      ),
    );
  }
}
