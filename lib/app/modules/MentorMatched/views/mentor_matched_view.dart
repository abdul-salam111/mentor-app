import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zego_zimkit/zego_zimkit.dart';
import '../../../storage/keys.dart';
import '../controllers/mentor_matched_controller.dart';

class MentorMatchedView extends GetView<MentorMatchedController> {
  const MentorMatchedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.sizeOf(context).height / 5,
            left: 100.w,
            child: Text(
              "You have a new Match!",
              style: manoropeFontFamily(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: darkBrownColor),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/pinkcircle.png",
              height: 300.h,
              width: 350.w,
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.back();
                  },
                  child: Text(
                    "Cancel",
                    style: manoropeFontFamily(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: blackcolor),
                  ),
                ),
              )),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 2.5,
            right: MediaQuery.sizeOf(context).width / 2.2,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: blackcolor,
                  radius: 62.r,
                  child: CircleAvatar(
                    radius: 60.r,
                    backgroundImage: const AssetImage(mentor),
                  ),
                ),
                Text(
                  data['fullName'],
                  style: manoropeFontFamily(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: blackcolor),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 2.5,
            left: MediaQuery.sizeOf(context).width / 2.2,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: blackcolor,
                  radius: 62.r,
                  child: CachedNetworkImage(
                    imageUrl: StorageServices.to.getString(selectedUserType) ==
                            "Mentee"
                        ? getMenteeInfoFromJson(
                                StorageServices.to.getString(getmenteeinfo))
                            .profilePicUrl
                            .toString()
                        : getMentorInfoFromJson(StorageServices.to
                                .getString(getMentorInformationsss))
                            .profilePicUrl,
                    height: 120.h,
                    width: 120.w,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                ),
                Text(
                  getMenteeInfoFromJson(
                              StorageServices.to.getString(getmenteeinfo))
                          .fullName ??
                      "Name",
                  style: manoropeFontFamily(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: blackcolor),
                )
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height / 7,
            left: 30.w,
            child: CustomButton(
                buttonName: "Start Messaging",
                onPressed: () async {
                  var chatRoomId = controller.chatRoomId(
                      recieverId: data['id'].toString(),
                      senderId:
                          StorageServices.to.getString(userId).toString());

                  Get.toNamed(Routes.MESSAGES, arguments: [data, chatRoomId]);
                },
                textcolor: whitecolor,
                loading: false,
                backgroundColor: darkBrownColor,
                rounded: true,
                height: 40.h,
                textSize: 15.sp,
                width: 300.w),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 1.2,
            left: 30.w,
            child: CustomButton(
                buttonName: "Schedule Session",
                onPressed: () {},
                textcolor: whitecolor,
                loading: false,
                backgroundColor: const Color(0xff3D3D3D),
                rounded: true,
                height: 40.h,
                textSize: 15.sp,
                width: 300.w),
          )
        ],
      ),
    ));
  }
}
