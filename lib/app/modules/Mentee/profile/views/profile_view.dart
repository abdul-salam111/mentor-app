import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/resources/physics.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ProfileController());
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          backgroundColor: whitecolor,
          surfaceTintColor: whitecolor,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Edit Profile',
            style: GoogleFonts.manrope(
                fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: mainbetween,
                  children: [
                    Text(
                      "Your Skills",
                      style: manoropeFontFamily(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: blackcolor),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/addmore.png",
                          height: 20,
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Add more',
                              style: manoropeFontFamily(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: darkBrownColor),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              GridView.builder(
                physics: neverscroll,
                itemCount: controller.selectedSkills.length,
                shrinkWrap: true,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    
                    mainAxisExtent: 50.h,
                      crossAxisCount: 2,mainAxisSpacing: 6,crossAxisSpacing: 6),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Image.asset(
                          skills,
                          width: 25,
                          height: 25,
                         fit: BoxFit.cover,
                        ),
                        5.widthBox,
                        SizedBox(
                          width: 100.w,
                          child: Text(
                          controller.selectedSkills[index]!,
                            style: GoogleFonts.lato(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xff656466),
                            ),
                          ),
                        )
                      ],
                    ).box.rounded.padding(const EdgeInsets.only(left: 5)).white.make();
                  }).box.color(const Color(0xffEFEFEF)).rounded.clip(Clip.antiAlias).margin( const EdgeInsets.only(left: 20,right: 20)).padding(pad16).make(),
           
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Row(
                  children: [
                    Image.asset(
                      daysoftheweek,
                      width: 15,
                      height: 15,
                    ),
                    10.widthBox,
                    Text(
                      "Days of the week available",
                      style: manoropeFontFamily(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: blackcolor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w,right: 5),
                child: Wrap(
                  spacing: 5.0, // Adjust the spacing between checkboxes
                  children: List.generate(
                    controller.daysOfWeek.length,
                    (index) => Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            checkColor: blackcolor,
                            side: const BorderSide(color: greyColor),
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return halfwhitecolor;
                                }
                                return Colors.transparent;
                              },
                            ),
                            value: controller.availabilityList
                                .contains(controller.daysOfWeek[index]),
                            onChanged: (bool? value) {
                              if (value != null) {
                                String selectedDay =
                                    controller.daysOfWeek[index];
                                if (value) {
                                  if (!controller.availabilityList
                                      .contains(selectedDay)) {
                                    controller.availabilityList
                                        .add(selectedDay);
                                  }
                                } else {
                                  controller.availabilityList
                                      .remove(selectedDay);
                                }
                              }
                            },
                          ),
                          Text(
                            controller.daysOfWeek[index],
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              10.heightBox,
                Padding(
                  padding:const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Row(
                  children: [
                    Image.asset(
                      mentorshipStyle,
                      height: 15,
                      width: 15,
                    ),
                    10.widthBox,
                    Text(
                      "Duration of mentor session",
                      style: manoropeFontFamily(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: blackcolor),
                    ),
                  ],
                                ),
                ),
            
              Padding(
               padding:const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  crossAxisAlignment: crosstart,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        mainAxisAlignment: mainbetween,
                        children: [
                          Obx(
                            () => Text(
                              controller.selectedDuration.value,
                              style: manoropeFontFamily(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackcolor),
                            ),
                          ),
                          const Icon(Icons.expand_more),
                        ],
                      ).box.make().onTap(() {
                        controller.isDurationOpen.value =
                            !controller.isDurationOpen.value;
                      }),
                    ),
                    Obx(
                      () => controller.isDurationOpen.value
                          ? Column(
                              children: [
                                10.heightBox,
                                Container(
                                  color: greyColor,
                                  height: 1,
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                    Obx(() => controller.isDurationOpen.value
                        ? GetBuilder<ProfileController>(
                            builder: (contextsss) {
                            return SizedBox(
                              height: 200.h,
                              child: ListView.builder(
                                itemCount: controller.durations.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final skill = controller.durations[index];
                                  // final isSelected =
                                  //     controller.selectedSkills.contains(skill);
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          skill,
                                          style: manoropeFontFamily(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: blackcolor),
                                        ),
                                        //   trailing: isSelected == true
                                        //       ? SizedBox(
                                        //           height: 10.h,
                                        //           width: 10.h,
                                        //         )
                                        //           .box
                                        //           .color(darkBrownColor)
                                        //           .rounded
                                        //           .make()
                                        //       : SizedBox(
                                        //           height: 10.h,
                                        //           width: 10.h,
                                        //         )
                                        //           .box
                                        //           .border(color: darkBrownColor)
                                        //           .rounded
                                        //           .make(),
                                        // ).box.make().onTap(() {
                                        //   if (controller.selectedSkills.length > 4) {
                                        //     if (isSelected) {
                                        //       controller.selectedSkills.remove(skill);
                                        //       contextsss.update();
                                        //     } else {
                                        //       Utils.snakbar(
                                        //           title: 'Maximum 5 goals',
                                        //           body:
                                        //               'You cannot select more than 5 goals.');
                                        //     }
                                        //   } else {
                                        //     if (isSelected) {
                                        //       controller.selectedSkills.remove(skill);
                                        //       contextsss.update();
                                        //     } else {
                                        //       controller.selectedSkills.add(skill);
                                        //       contextsss.update();
                                        //     }
                                        //   }
                                        // }),
                                      ),
                                      Container(
                                        color: greyColor,
                                        height: 1,
                                      ),
                                    ],
                                  ).onTap(() {
                                    controller.selectedDuration.value =
                                        controller.durations[index];
                                    controller.isDurationOpen.value = false;
                                  });
                                },
                              ),
                            );
                          })
                        : const SizedBox.shrink())
                  ],
                )
                    .box
                    .white
                    .padding(defaultpad)
                    .width(double.infinity)
                    .outerShadow
                    .roundedSM
                    .make(),
              ),
              10.heightBox,
                Padding(
                   padding:const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Row(
                  children: [
                    Image.asset(
                      daysoftheweek,
                      width: 15,
                      height: 15,
                    ),
                    10.widthBox,
                    Text(
                      "Preferred communication channel",
                      style: manoropeFontFamily(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: blackcolor),
                    ),
                  ],
                                ),
                ),
              10.heightBox,
              Padding(
   padding: EdgeInsets.only(left: 5.w,right: 5),
                child: Wrap(
                  spacing: 5.0, // Adjust the spacing between checkboxes
                  children: List.generate(
                    controller.communitcationChannels.length,
                    (index) => Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            checkColor: blackcolor,
                            side: const BorderSide(color: greyColor),
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return halfwhitecolor;
                                }
                                return Colors.transparent;
                              },
                            ),
                            value: controller.selectedChannles.contains(
                                controller.communitcationChannels[index]),
                            onChanged: (bool? value) {
                              if (value != null) {
                                String selectedChannel =
                                    controller.communitcationChannels[index];
                                if (value) {
                                  if (!controller.selectedChannles
                                      .contains(selectedChannel)) {
                                    controller.selectedChannles
                                        .add(selectedChannel);
                                  }
                                } else {
                                  controller.selectedChannles
                                      .remove(selectedChannel);
                                }
                              }
                            },
                          ),
                          Text(
                            controller.communitcationChannels[index],
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              30.heightBox,
              Padding(
                padding: EdgeInsets.only(left: 20.w,right: 20,bottom: 30),
                child: CustomButton(buttonName: "Save Profile", onPressed: (){}, textcolor: whitecolor, loading: false, backgroundColor: darkBrownColor, rounded: true, height: 40.h, textSize: 15.sp, width: double.infinity),
              )
            ],
          ),

        ));
  }
}
