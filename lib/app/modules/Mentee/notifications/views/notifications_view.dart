import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            'Notifications',
            style: GoogleFonts.manrope(
                fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          centerTitle: false,
        ),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, indext) {
              return Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "2:30pm",
                        style: manoropeFontFamily(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: blackcolor),
                      )),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/browntimer.png",
                        height: 40,
                        width: 40,
                      ),
                      5.widthBox,
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          "Your session with Chinyere Njoku has been confirmed",
                          style: manoropeFontFamily(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: blackcolor),
                        ),
                      )
                    ],
                  )
                ],
              )
                  .box
                  .padding(pad16)
                  .margin(EdgeInsets.fromLTRB(20, 10, 20, 0))
                  .rounded
                  .outerShadow
                  .white
                  .make();
            }));
  }
}
