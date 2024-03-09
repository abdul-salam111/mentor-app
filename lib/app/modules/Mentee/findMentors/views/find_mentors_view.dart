import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/textfield.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/resources/physics.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/icons.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/find_mentors_controller.dart';

class FindMentorsView extends GetView<FindMentorsController> {
  const FindMentorsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'All mentors',
            style: GoogleFonts.manrope(
                fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
        ),
      body:  Padding(
        padding: pad16,
        child: Column(
          children: [
            customSearchTextField(),
           
              Row(
                mainAxisAlignment: mainbetween,
                children: [
                  Text(
                    'All members',
                    style: manoropeFontFamily(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: darkBrownColor),
                  ),
                  TextButton(
                    child: Text(
                      'Favorite',
                      style: manoropeFontFamily(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: blackcolor),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.FIND_MENTORS);
                    },
                  ),
                ],
              ),
            Expanded(
              child: GridView.builder(
                          physics: bouncingscroll,
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
                                      Icons.favorite_border,
                                      color: redColor,
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
                                .height(100.h)
                                .padding(pad18)
                                .white
                                .border(color: greyColor.withOpacity(0.5))
                                .withRounded(value: 5)
                                .make().onTap(() {
                                  Get.toNamed(Routes.MENTOR_PROFILE);
                                });
                          }),
            ),
          ],
        ),
      )
    );
  }
}
