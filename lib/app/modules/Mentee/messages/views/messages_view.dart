import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../../resources/colors.dart';
import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  const MessagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Row(children: [
          Text(
            "Welcome",
            style: manoropeFontFamily(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: blackcolor),
          ),
          2.widthBox,
          Text(
            "Damilola",
            style: manoropeFontFamily(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: darkBrownColor),
          )
        ]),
        centerTitle: true,
        actions: [
          ZegoSendCallInvitationButton(
            buttonSize: const Size(50, 20),
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            isVideoCall: true,
            iconSize: Size(
              20.h,
              20.w,
            ),
            icon: ButtonIcon(
              icon: Image.asset(
                videocalling,
              ),
            ),
          
            invitees: [
              ZegoUIKitUser(
                id: 'abdulsalam.0302@gmail.com',
                name: 'Hasssan',
              ),
            ],
          ),
          ZegoSendCallInvitationButton(
           
            buttonSize: const Size(50, 20),
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            isVideoCall: false,
            iconSize: Size(
              20.h,
              20.w,
            ),
            icon: ButtonIcon(
              icon: Image.asset(
                audiocalling,
              ),
            ),
          
            invitees: [
              ZegoUIKitUser(
                id: 'abdulsalam.0302@gmail.com',
                name: 'Hasssan',
              ),
            ],
          ),
          Image.asset(
            verticalmenu,
            height: 15,
            width: 20,
          ),
          10.widthBox,
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true, // Start from the bottom
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, bottom: 10),
                    child: Column(
                      children: [
                        index == 0
                            ? Text(
                                "Today",
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    color: const Color(0xff656466)),
                              )
                            : Text(
                                "Wed 22 June",
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    color: const Color(0xff656466)),
                              ),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: index == 0 ? mainstart : mainend,
                          children: [
                            index == 0
                                ? CircleAvatar(
                                    radius: 20.r,
                                    backgroundImage: const AssetImage(mentor),
                                  )
                                : const SizedBox.shrink(),
                            10.widthBox,
                            Container(
                              padding: pad14,
                              decoration: BoxDecoration(
                                color: index == 0
                                    ? const Color(0xffE1D1FA)
                                    : const Color(0xffA4DCF4),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.r),
                                    topRight: Radius.circular(20.r),
                                    bottomRight: index == 0
                                        ? Radius.circular(20.r)
                                        : const Radius.circular(0),
                                    bottomLeft: index == 1
                                        ? Radius.circular(20.r)
                                        : const Radius.circular(0)),
                              ),
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.6,
                              ),
                              child: Text(
                                "Can you please send a detailed direction to your house from Oshodi",
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp, color: blackcolor),
                              ),
                            ),
                            10.widthBox,
                            index == 1
                                ? CircleAvatar(
                                    radius: 20.r,
                                    backgroundImage: const AssetImage(mentor),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ],
                    ));
              },
            ),
          ),
          Obx(
            () => controller.ismobileNumber.value
                ? Text(
                    '@ WARNING dont share phone number or personal informations',
                    style: manoropeFontFamily(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffFF0000)),
                  )
                : const SizedBox.shrink(),
          ),
          5.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: darkestBrownColor,
                  child: Image.asset(attactFile),
                ),
                10.widthBox,
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      if (value.contains(RegExp(r'\b\d{10}\b'))) {
                        controller.ismobileNumber.value = false;
                      }
                    },
                    cursorHeight: 20.h,
                    style: manoropeFontFamily(
                        fontSize: 12.sp,
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
                      hintText: 'Enter your message',
                      hintStyle: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: textfieldgrey),
                      contentPadding:
                          const EdgeInsets.only(left: 10, bottom: 5, top: 5),
                    ),
                  ),
                ),
                10.widthBox,
                CircleAvatar(
                  backgroundColor: darkestBrownColor,
                  child: Image.asset(
                    sendmessage,
                    color: whitecolor,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
