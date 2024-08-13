import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/shimmerEffect.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/resources/physics.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/icons.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/find_mentors_controller.dart';

class FindMentorsView extends StatefulWidget {
  const FindMentorsView({Key? key}) : super(key: key);

  @override
  State<FindMentorsView> createState() => _FindMentorsViewState();
}

class _FindMentorsViewState extends State<FindMentorsView> {
  final controller = Get.put(FindMentorsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: Padding(
          padding: pad16,
          child: Column(
            children: [
              TextField(
                onChanged: (val) {
                  controller.searchQuery.value = val;
                  if (StorageServices.to.getString(selectedUserType) ==
                      "Mentee") {
                    controller.searchMentors(
                        availablility: 'Accept new mentees',
                        industry:
                            controller.selectedIndustries.value.toString(),
                        search: val,
                        skills: controller.selectedSkills);
                  } else {
                    controller.searchMenetees(
                        availablility: "Monday",
                        skills: [],
                        search: '',
                        industry: controller.selectedIndustries.value);
                  }

                  setState(() {});
                },
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
              ),
              15.heightBox,
              Row(
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
              Obx(() => controller.searchQuery.value.isEmpty
                  ? FutureBuilder(
                      future: StorageServices.to.getString(selectedUserType) ==
                              "Mentee"
                          ? controller.searchMentors(
                              availablility: "Accept new mentees",
                              skills: controller.selectedSkills,
                              search: '',
                              industry: controller.selectedIndustries.value)
                          : controller.searchMenetees(
                              availablility: "Monday",
                              skills: [],
                              search: '',
                              industry: controller.selectedIndustries.value),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Expanded(child: HomeScreenShimmerList());
                        } else if (!snapshot.hasData) {
                          return const Center(
                            child: Text("Not found"),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.data!.isEmpty) {
                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                if (StorageServices.to
                                        .getString(selectedUserType) ==
                                    "Mentee") {
                                  Get.toNamed(Routes.FIND_MENTORS);
                                }
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
                        return Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 0,
                                      mainAxisExtent: 115.h,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: crosstart,
                                  children: [
                                    Row(
                                      mainAxisAlignment: mainbetween,
                                      children: [
                                        snapshot.data![index]
                                                        ['profilePicUrl'] !=
                                                    null &&
                                                snapshot.data![index]
                                                        ['profilePicUrl'] !=
                                                    ""
                                            ? CircleAvatar(
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                        snapshot.data![index]
                                                            ['profilePicUrl']),
                                              )
                                            : const CircleAvatar(
                                                backgroundImage:
                                                    AssetImage(mentor),
                                              ),
                                        // Icon(
                                        //   Icons.favorite,
                                        //   color: greencolor,
                                        // )
                                      ],
                                    ),
                                    10.heightBox,
                                    Text(
                                      snapshot.data![index]['fullName'],
                                      style: manoropeFontFamily(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: blackcolor),
                                    ),
                                    5.heightBox,
                                    Text(
                                      snapshot.data![index]['mentorshipStyle'],
                                      style: manoropeFontFamily(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: blackcolor),
                                    ),
                                  ],
                                )
                                    .box
                                    .height(110.h)
                                    .padding(const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10))
                                    .margin(const EdgeInsets.all(3))
                                    .white
                                    .outerShadow
                                    .roundedSM
                                    .make()
                                    .onTap(() {
                                  if (StorageServices.to
                                          .getString(selectedUserType) ==
                                      "Mentee") {
                                    Get.toNamed(Routes.MENTOR_PROFILE,
                                        arguments: snapshot.data![index]
                                            ['email']);
                                  }
                                });
                              }),
                        );
                      })
                  : FutureBuilder(
                      future: StorageServices.to.getString(selectedUserType) ==
                              "Mentee"
                          ? controller.searchMentors(
                              availablility: "Accept new mentees",
                              skills: controller.selectedSkills,
                              search: controller.searchQuery.value,
                              industry: controller.selectedIndustries.value)
                          : controller.searchMenetees(
                              availablility: "Monday",
                              skills: controller.selectedSkills,
                              search: controller.searchQuery.value,
                              industry: controller.selectedIndustries.value),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Expanded(child: HomeScreenShimmerList());
                        } else if (!snapshot.hasData) {
                          return const Center(
                            child: Text("Not found"),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.data!.isEmpty) {
                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                if (StorageServices.to
                                        .getString(selectedUserType) ==
                                    "Mentee") {
                                  Get.toNamed(Routes.FIND_MENTORS);
                                }
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

                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: GridView.builder(
                                physics: neverscroll,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
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
                                        snapshot.data![index]['fullName'],
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
                                      .padding(const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10))
                                      .white
                                      .outerShadow
                                      .roundedSM
                                      .make()
                                      .onTap(() {
                                    if (StorageServices.to
                                            .getString(selectedUserType) ==
                                        "Mentee") {
                                      Get.toNamed(Routes.MENTOR_PROFILE,
                                          arguments: snapshot.data![index]
                                              ['email']);
                                    }
                                  });
                                }),
                          ),
                        );
                      }))
            ],
          ),
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
                  controller.searchMentors(
                      availablility: 'Accept new mentees',
                      industry: controller.selectedIndustries.value,
                      search: '',
                      skills: controller.selectedSkills);
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
                child: GetBuilder<FindMentorsController>(builder: (contextsss) {
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
                  controller.searchMentors(
                      availablility: 'Accept new mentees',
                      industry: controller.selectedIndustries.value,
                      search: '',
                      skills: controller.selectedSkills);
                  setState(() {});
                  Navigator.pop(
                      context); // Close the bottom sheet after selection
                },
              ),
            ],
          ),
        ).box.topRounded(value: 20).clip(Clip.antiAlias).make();
      },
    );
  }
}
