import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../resources/icons.dart';
import '../controllers/mentor_profile_information_controller.dart';

class MentorProfileInformationView
    extends GetView<MentorProfileInformationController> {
  const MentorProfileInformationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
  Get.put(MentorProfileInformationController());
    return Scaffold(
        appBar: AppBar(
         
          title: Text(
            'Mentor Profile',
            style: GoogleFonts.manrope(
                fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
        ),
        body:FutureBuilder(
            future: controller.getOthersMentorsProfile(getMentorInfoFromJson(StorageServices.to.getString(getMentorInformationsss)).email),
            builder: (context, AsyncSnapshot<GetMentorInfo> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text("Not found"),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return Stack(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Spacer(),
                          Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              20.heightBox,
                              Center(
                                child: Text(
                                  snapshot.data!.fullName.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              // 10.heightBox,
                              // Row(
                              //   mainAxisAlignment: maincenter,
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment: maincenter,
                              //       children: List.generate(
                              //           5,
                              //           (index) => const Padding(
                              //                 padding: EdgeInsets.symmetric(
                              //                     horizontal: 7),
                              //                 child: Icon(
                              //                   Icons.star,
                              //                   color: ratingcolor,
                              //                 ),
                              //               )),
                              //     ),
                              //     10.widthBox,
                              //     Text(
                              //       '15 reviews',
                              //       style: GoogleFonts.lato(
                              //           fontSize: 14.sp,
                              //           color: ratingcolor,
                              //           fontWeight: FontWeight.w600),
                              //     )
                              //   ],
                              // ),
                              10.heightBox,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: crosstart,
                                  children: [
                                    Text(
                                      "About",
                                      style: manoropeFontFamily(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: darkBrownColor),
                                    ),
                                    Text(
                                      snapshot.data!.about.toString(),
                                      style: manoropeFontFamily(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: blackcolor),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                            10.heightBox,
                              Row(
                                children: [
                                  Image.asset(
                                    gender,
                                    color: darkBrownColor,
                                    height: 15,
                                    width: 15,
                                  ),
                                  10.widthBox,
                                  Text(
                                    "Skills",
                                    style: manoropeFontFamily(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: darkBrownColor),
                                  )
                                ],
                              ),
                              10.heightBox,
                              SizedBox(
                                height: 30.h,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.skills.length,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        child: Text(
                                          snapshot.data!.skills[index],
                                          style: manoropeFontFamily(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: textfieldgrey),
                                        ),
                                      )
                                          .box
                                          .white
                                          .margin(const EdgeInsets.symmetric(
                                              horizontal: 8))
                                          .padding(defaultpad)
                                          .border(
                                              color: greyColor.withOpacity(0.5))
                                          .roundedSM
                                          .make();
                                    }),
                              ),
                              20.heightBox,
                              Row(
                                children: [
                                  Image.asset(
                                    industry,
                                    color: darkBrownColor,
                                    height: 20,
                                    width: 20,
                                  ),
                                  10.widthBox,
                                  Text(
                                    "Industry",
                                    style: manoropeFontFamily(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: darkBrownColor),
                                  )
                                ],
                              ),
                              10.heightBox,
                              SizedBox(
                                child: Text(
                                  snapshot.data!.industry.toString(),
                                  style: manoropeFontFamily(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textfieldgrey),
                                ),
                              )
                                  .box
                                  .white
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 8))
                                  .padding(defaultpad)
                                  .border(color: greyColor.withOpacity(0.5))
                                  .roundedSM
                                  .make(),
                              20.heightBox,
                              Row(
                                children: [
                                  Image.asset(
                                    experience,
                                    height: 20,
                                    width: 20,
                                  ),
                                  10.widthBox,
                                  Text(
                                    "Experience",
                                    style: manoropeFontFamily(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: darkBrownColor),
                                  ),
                                ],
                              ),
                              10.heightBox,
                              SizedBox(
                                child: Text(
                                  "${snapshot.data!.yearsOfExperience} Years",
                                  style: manoropeFontFamily(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: textfieldgrey,
                                  ),
                                ),
                              )
                                  .box
                                  .white
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 8))
                                  .padding(defaultpad)
                                  .border(color: greyColor.withOpacity(0.5))
                                  .roundedSM
                                  .make(),
                              70.heightBox,
                            CustomButton(
                                    buttonName: "Update Profile",
                                    onPressed: () {
                                    StorageServices.to.setBool(key: 'updateProfile', value: true);
                                    Get.toNamed(Routes.SKILLS);
                                    },
                                    textcolor: whitecolor,
                                    loading: false,
                                    backgroundColor: darkBrownColor,
                                    rounded: true,
                                    height: 50,
                                    textSize: 15,
                                    width: double.infinity),
                              
                              20.heightBox,
                            ],
                          )
                              .box
                              .topRounded()
                              .padding(
                                  const EdgeInsets.symmetric(horizontal: 12))
                              .width(double.infinity)
                              .shadow
                              .clip(Clip.antiAlias)
                              .color(const Color(0xffF6F6F6))
                              .make(),
                        ],
                      )),
                  Positioned(
                    top: height > 770 ? 40 : 20.h,
                    left: height > 770
                        ? MediaQuery.sizeOf(context).width / 2.8
                        : MediaQuery.sizeOf(context).width / 3.4,
                    child: CircleAvatar(
                            radius: height > 770 ? 50.r : 50.r,
                            backgroundImage: CachedNetworkImageProvider(
                              snapshot.data!.profilePicUrl.toString(),
                            ))
                        .box
                        .outerShadowLg
                        .clip(Clip.antiAlias)
                        .roundedFull
                        .make(),
                  )
                ],
              );
            }));
  }
}
