import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/shimmerEffect.dart';
import 'package:mentor_app/app/commonWidgets/textfield.dart';
import 'package:mentor_app/app/models/jobs/getJobByIndustry.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/posted_jobs_controller.dart';

class PostedJobsView extends StatefulWidget {
  const PostedJobsView({Key? key}) : super(key: key);

  @override
  State<PostedJobsView> createState() => _PostedJobsViewState();
}

class _PostedJobsViewState extends State<PostedJobsView> {
  final controller = Get.put(PostedJobsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          surfaceTintColor: whitecolor,
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
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
              child: Row(
                children: [
                  Expanded(child: customSearchTextField(hinttext: "Search")),
                  10.widthBox,
                  StorageServices.to.getString(selectedUserType) == "Mentor"
                      ? CustomButton(
                          buttonName: "Create Job",
                          onPressed: () {
                            Get.toNamed(Routes.JOB_APPLICATION_FORM)!
                                .then((value) {
                              setState(() {});
                            });
                          },
                          textcolor: whitecolor,
                          loading: false,
                          backgroundColor: darkBrownColor,
                          rounded: false,
                          height: 40.h,
                          textSize: 13.sp,
                          width: 100.w)
                      : SizedBox.shrink()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
            10.heightBox,
            FutureBuilder<GetJobByIndustry>(
                future: controller.getJobByIndustry(),
                builder: (context, AsyncSnapshot<GetJobByIndustry> snapshot) {
                  if (!snapshot.hasData) {
                    return ShimmerList();
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return ShimmerList();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.mentorJobs!.length,
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
                                            SizedBox(
                                              width: 80.w,
                                              child: Text(
                                                snapshot
                                                    .data!
                                                    .mentorJobs![index]
                                                    .mentor!
                                                    .fullName
                                                    .toString(),
                                                style: manoropeFontFamily(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: blackcolor),
                                              ),
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
                                          snapshot.data!.mentorJobs![index]
                                              .mentor!.industry
                                              .toString(),
                                          style: manoropeFontFamily(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: darkBrownColor),
                                        ),
                                        5.heightBox,
                                        SizedBox(
                                          width: 240.w,
                                          child: Text(
                                            snapshot.data!.mentorJobs![index]
                                                .description
                                                .toString(),
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
                                              snapshot.data!.mentorJobs![index]
                                                  .postTime
                                                  .toString(),
                                              style: manoropeFontFamily(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff656466)),
                                            ),
                                            (MediaQuery.sizeOf(context).width /
                                                    3.5)
                                                .widthBox,
                                            CustomButton(
                                                buttonName: "View",
                                                onPressed: () {
                                                  Get.toNamed(
                                                      Routes.JOB_DETAILS,
                                                      arguments: snapshot
                                                          .data!
                                                          .mentorJobs![index]
                                                          .id);
                                                },
                                                textcolor: whitecolor,
                                                loading: false,
                                                backgroundColor:
                                                    const Color(0xff109804),
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
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 20))
                                .width(double.infinity)
                                .make(),
                          );
                        }),
                  );
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
                  controller.getJobByIndustry();
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
