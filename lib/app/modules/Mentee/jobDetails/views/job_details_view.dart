import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/models/jobs/getJobById.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../resources/paddings.dart';
import '../controllers/job_details_controller.dart';

class JobDetailsView extends GetView<JobDetailsController> {
  const JobDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    var id = Get.arguments;

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
            'Job Details',
            style: GoogleFonts.manrope(
                fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          centerTitle: false,
        ),
        body: ListView(
          children: [
            20.heightBox,
            FutureBuilder(
                future: controller.getJobsDetail(id),
                builder: (context, AsyncSnapshot<GetJobById> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center();
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  return Column(
                    children: [
                      10.heightBox,
                      Row(
                        crossAxisAlignment: crosstart,
                        children: [
                          CircleAvatar(
                            radius: 23.r,
                            backgroundImage: CachedNetworkImageProvider( snapshot.data!.mentor!.profilePicUrl.toString()),
                          ),
                          10.widthBox,
                          Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80.w,
                                    child: Text(
                                      snapshot.data!.mentor!.fullName
                                          .toString(),
                                      style: manoropeFontFamily(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: blackcolor),
                                    ),
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
                                    snapshot.data!.mentor!.industry.toString(),
                                    style: manoropeFontFamily(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: darkBrownColor),
                                  ),
                                  (MediaQuery.sizeOf(context).width / 8)
                                      .widthBox,
                                  Column(
                                    crossAxisAlignment: crosstart,
                                    children: [
                                      Text(
                                        snapshot.data!.postTime.toString(),
                                        style: manoropeFontFamily(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff656466)),
                                      ),
                                      Text(
                                        snapshot.data!.postDate.toString(),
                                        style: manoropeFontFamily(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff656466)),
                                      ),
                                    ],
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
                                  snapshot.data!.description.toString(),
                                  style: manoropeFontFamily(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff656466)),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              10.heightBox,
                              Text(
                                "Job type",
                                style: manoropeFontFamily(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: blackcolor),
                              ),
                              5.heightBox,
                              Text(
                                snapshot.data!.jobType.toString(),
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
                              Text(
                                  "\$ ${snapshot.data!.compensation.toString()}",
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
                              Text(snapshot.data!.location.toString(),
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
                                      onPressed: () async {
                                        final uri = Uri.parse(
                                            snapshot.data!.jobUrl.toString());
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri);
                                        } else {
                                          Utils.snakbar(title: "Error", body: "Cannot launch the browswer");
                                        }
                                      },
                                      textcolor: whitecolor,
                                      loading: false,
                                      backgroundColor: const Color(0xff109804),
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
                      .make();
                }),
          ],
        ));
  }
}
