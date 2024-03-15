import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/textfield.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/posted_jobs_controller.dart';

class PostedJobsView extends GetView<PostedJobsController> {
  const PostedJobsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
            backgroundColor: whitecolor,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back)),
            title: Text(
              'Jobs posted by mentors',
              style: GoogleFonts.manrope(
                  fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            centerTitle: false,
            actions: [
              Image.asset(
                filter,
                height: 20,
                width: 20,
              ),
              10.widthBox,
            ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
              child: customSearchTextField(hinttext: "Search"),
            ),
            20.heightBox,
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Column(
                        children: [
                          10.heightBox,
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
                                  Row(
                                    children: [
                                      Text(
                                        'Chinyere Njoku',
                                        style: manoropeFontFamily(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: blackcolor),
                                      ),
                                      130.widthBox,
                                      Image.asset(
                                        horizontalIcon,
                                        width: 20,
                                        height: 10,
                                      )
                                    ],
                                  ),
                                  5.heightBox,
                                  Text(
                                    "Web Design",
                                    style: manoropeFontFamily(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: darkBrownColor),
                                  ),
                                  5.heightBox,
                                  SizedBox(
                                    width: 240.w,
                                    child: Text(
                                      "Lorem ipsum dolor sit amet consectetur. Proin volutpat faucibus malesuada venenatis sollicitudin proin sit dignissim. ",
                                      style: manoropeFontFamily(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff656466)),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  20.heightBox,
                                  Row(
                                      mainAxisAlignment: mainbetween,
                                      children: [
                                        Text(
                                          '11:20am',
                                          style: manoropeFontFamily(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff656466)),
                                        ),
                                       (MediaQuery.sizeOf(context).width/3.5).widthBox,
                                        CustomButton(
                                            buttonName: "View",
                                            onPressed: () {
                                               Get.toNamed(Routes.JOB_DETAILS);
                                            },
                                            textcolor: whitecolor,
                                            loading: false,
                                            backgroundColor: const Color(0xff109804),
                                            rounded: true,
                                            height: 20.h,
                                            textSize: 10.sp,
                                            width: 80.w)
                                      ],
                                    ),
                                  
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
                          .margin(const EdgeInsets.symmetric(horizontal: 20))
                          .width(double.infinity)
                          .make(),
                    );
                  }),
            )
          ],
        ));
  }
}
