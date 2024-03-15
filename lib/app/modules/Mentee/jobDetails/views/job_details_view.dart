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
import 'package:velocity_x/velocity_x.dart';

import '../../../../resources/paddings.dart';
import '../controllers/job_details_controller.dart';

class JobDetailsView extends GetView<JobDetailsController> {
  const JobDetailsView({Key? key}) : super(key: key);
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
              child: customSearchTextField(hinttext: "Search"),
            ),
         20.heightBox,
            Column(
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
                            140.widthBox,
                            Image.asset(
                              horizontalIcon,
                              width: 20,
                              height: 10,
                            )
                          ],
                        ),
                        5.heightBox,
                        Row(
                          children: [
                            Text(
                              "Web Design",
                              style: manoropeFontFamily(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: darkBrownColor),
                            ),
                            (MediaQuery.sizeOf(context).width / 3).widthBox,
                            Text(
                              '11:20am',
                              style: manoropeFontFamily(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff656466)),
                            ),
                          ],
                        ),
                        20.heightBox,
                        Text(
                          "Description",
                          style: manoropeFontFamily(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: blackcolor),
                        ),
                        2.heightBox,
                        SizedBox(
                          width: 245.w,
                          child: Text(
                            "Feugiat suspendisse rhoncus enim orci. Lectus nisl tortor accumsan ornare odio ridiculus. Sed non blandit amet diam. A id vel pellentesque turpis ipsum laoreet ut netus. Sit aliquet mauris sed neque risus integer in.Cras justo in vehicula porttitor. Etiam laoreet vehicula aenean gravida. Vivamus quis semper sit orci ipsum auctor feugiat lorem ultrices. Etiam in et lacus massa tortor. Ridiculus non aenean amet tempus. Lorem et cras gravida nibh. Ac eget gravida tempor tincidunt. Pharetra magna venenatis felis aliquet ac. Blandit volutpat purus sed blandit dui vitae arcu mattis. ",
                            style: manoropeFontFamily(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff656466)),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        10.heightBox,
                        Text(
                          "Full time /part time",
                          style: manoropeFontFamily(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: darkBrownColor),
                        ),
                        20.heightBox,
                        Text(
                          "compensation range",
                          style: manoropeFontFamily(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: blackcolor),
                        ),
                        5.heightBox,
                        Text("\$200",
                            style: manoropeFontFamily(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: darkBrownColor)),
                        10.heightBox,
                        Text(
                          "Location",
                          style: manoropeFontFamily(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: blackcolor),
                        ),
                        5.heightBox,
                        Text("Remote",
                            style: manoropeFontFamily(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: darkBrownColor)),
                        20.heightBox,
                         Row(
                           children: [
                            20.widthBox,
                             CustomButton(
                               buttonName: "Apply Link",
                               onPressed: () {},
                               textcolor: whitecolor,
                               loading: false,
                               backgroundColor:  const Color(0xff109804),
                               rounded: false,
                               height: 30.h,
                               textSize: 11.sp,
                               width: 200.w),
                           ],
                         ) 
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
          
          ],
        ));
  }
}
