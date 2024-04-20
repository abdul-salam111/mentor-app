import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/shimmerEffect.dart';
import 'package:mentor_app/app/commonWidgets/textfield.dart';
import 'package:mentor_app/app/models/connections/getMentorConnections.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/connections_controller.dart';

class ConnectionsView extends GetView<ConnectionsController> {
  const ConnectionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: whitecolor,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Connenctions',
            style: GoogleFonts.manrope(
                fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customSearchTextField(hinttext: "Search"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                child: Row(
                  children: [
                    Text(
                      "Recent",
                      textAlign: TextAlign.center,
                      style: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: blackcolor),
                    )
                        .box
                        .padding(const EdgeInsets.fromLTRB(8, 4, 8, 4))
                        .width(100)
                        .border(color: greyColor)
                        .rounded
                        .make(),
                    5.widthBox,
                    Text(
                      "Request",
                      textAlign: TextAlign.center,
                      style: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: darkBrownColor),
                    )
                        .box
                        .padding(const EdgeInsets.fromLTRB(8, 4, 8, 4))
                        .width(100)
                        .border(color: greyColor)
                        .rounded
                        .make(),
                  ],
                ),
              ),
              5.heightBox,
              FutureBuilder(
                  future: controller.getMentorConnections(),
                  builder:
                      (context, AsyncSnapshot<GetMentorConnections> snapshot) {
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
                          itemCount: snapshot.data!.mentorConnections.length,
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: crosstart,
                              children: [
                                CircleAvatar(
                                  radius: 30.r,
                                  backgroundImage: const AssetImage(mentor),
                                ),
                                10.widthBox,
                                Column(
                                  crossAxisAlignment: crosstart,
                                  children: [
                                    Text(
                                      snapshot.data!.mentorConnections[index].fullName.toString(),
                                      style: manoropeFontFamily(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: blackcolor),
                                    ),
                                    5.heightBox,
                                    Text(
                                      snapshot.data!.mentorConnections[index].industry,
                                      textAlign: TextAlign.center,
                                      style: manoropeFontFamily(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: textfieldgrey),
                                    )
                                        .box
                                        .padding(const EdgeInsets.fromLTRB(
                                            8, 2, 8, 2))
                                        .width(100)
                                        .border(color: greyColor)
                                        .rounded
                                        .make(),
                                    Row(
                                      children: [
                                        CustomButton(
                                            buttonName: "Deny",
                                            onPressed: () {
                                              
                                            },
                                            textcolor: whitecolor,
                                            loading: false,
                                            backgroundColor: darkBrownColor,
                                            rounded: true,
                                            height: 20.h,
                                            textSize: 12.sp,
                                            width: 100.w),
                                        10.widthBox,
                                        CustomButton(
                                            buttonName: "Accept",
                                            onPressed: () {},
                                            textcolor: whitecolor,
                                            loading: false,
                                            backgroundColor: Color(0xff036118),
                                            rounded: true,
                                            height: 20.h,
                                            textSize: 12.sp,
                                            width: 100.w)
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                  "2:30pm",
                                  style: manoropeFontFamily(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: blackcolor),
                                )
                              ],
                            )
                                .box
                                .white
                                .outerShadow
                                .margin(defaultpad)
                                .rounded
                                .padding(defaultpad)
                                .make();
                          }),
                    );
                  })
            ],
          ),
        ));
  }
}
