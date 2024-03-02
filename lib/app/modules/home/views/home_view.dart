import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/textfield.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pad20,
          child: Column(
            children: [
              Row(
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
                  const CircleAvatar(
                    backgroundImage: AssetImage(profilepicture),
                  )
                ],
              ),
              10.heightBox,
              customSearchTextField(),
              10.heightBox,
              Row(
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
              20.heightBox,
              Row(
                mainAxisAlignment: mainbetween,
                children: [
                  Container(
                             padding: const EdgeInsets.symmetric(horizontal: 17),
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
                          padding: const EdgeInsets.symmetric(horizontal: 17),
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
                                'Q&A forum',
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
                      .make(),
                  Container(
                             padding: const EdgeInsets.symmetric(horizontal: 17),
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
                                'Job Forum',
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
                      .make(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
