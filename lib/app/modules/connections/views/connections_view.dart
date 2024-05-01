import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/shimmerEffect.dart';
import 'package:mentor_app/app/commonWidgets/textfield.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/connections/getMentorAcceptedConnections.dart';
import 'package:mentor_app/app/models/connections/getMentorConnections.dart';
import 'package:mentor_app/app/models/connections/getMentorrecievedConnections.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/modules/Mentee/messages/views/messages_view.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/connections_controller.dart';

class ConnectionsView extends StatefulWidget {
  const ConnectionsView({Key? key}) : super(key: key);

  @override
  State<ConnectionsView> createState() => _ConnectionsViewState();
}

class _ConnectionsViewState extends State<ConnectionsView> {
  final controller = Get.put(ConnectionsController());
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
            'Requests',
            style: GoogleFonts.manrope(
                fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          centerTitle: false,
        ),
        body: Obx(() => controller.index.value == 0
            ? SafeArea(
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
                          Obx(
                            () => Text(
                              "Request",
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
                                .color(controller.index.value == 0
                                    ? greyColor
                                    : whitecolor)
                                .make()
                                .onTap(() {
                              controller.index.value = 0;
                            }),
                          ),
                          5.widthBox,
                          Obx(
                            () => Text(
                              "Connections",
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
                                .color(controller.index.value == 1
                                    ? greyColor
                                    : whitecolor)
                                .make()
                                .onTap(() {
                              controller.index.value = 1;
                            }),
                          ),
                        ],
                      ),
                    ),
                    5.heightBox,
                    FutureBuilder(
                        future: controller.getMentorRecievedRequest(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return ShimmerList(10);
                          } else if (!snapshot.hasData) {
                            return  Center(
                              child: Image.asset("assets/images/no friend found.png",height: 100.h,width: 100.w,),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          }

                          return Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    snapshot.data!['connectionRequests'].length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment: crosstart,
                                    children: [
                                      CircleAvatar(
                                        radius: 30.r,
                                        backgroundImage:
                                            CachedNetworkImageProvider(snapshot
                                                        .data[
                                                    'connectionRequests'][index]
                                                ['mentee']['profilePicUrl']),
                                      ),
                                      10.widthBox,
                                      Column(
                                        crossAxisAlignment: crosstart,
                                        children: [
                                          Text(
                                            snapshot.data!['connectionRequests']
                                                    [index]['mentee']
                                                    ['fullName']
                                                .toString(),
                                            style: manoropeFontFamily(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                                color: blackcolor),
                                          ),
                                          5.heightBox,
                                          Text(
                                            snapshot.data!['connectionRequests']
                                                    [index]['mentee']
                                                    ['mentorshipStyle']
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: manoropeFontFamily(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500,
                                                color: textfieldgrey),
                                          )
                                              .box
                                              .padding(
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 8, 2))
                                              .width(150)
                                              .border(color: greyColor)
                                              .rounded
                                              .make(),
                                          Row(
                                            children: [
                                              CustomButton(
                                                  buttonName: "Deny",
                                                  onPressed: () {
                                                    controller
                                                        .cancelMenteeRequestSentToMentors(
                                                            snapshot.data![
                                                                    'connectionRequests']
                                                                [index]['id']);
                                                    setState(() {});
                                                  },
                                                  textcolor: whitecolor,
                                                  loading: false,
                                                  backgroundColor:
                                                      darkBrownColor,
                                                  rounded: true,
                                                  height: 20.h,
                                                  textSize: 12.sp,
                                                  width: 100.w),
                                              10.widthBox,
                                              CustomButton(
                                                  buttonName: "Accept",
                                                  onPressed: () async {
                                                    await controller
                                                        .acceptConnections(snapshot
                                                                        .data![
                                                                    'connectionRequests']
                                                                [index]
                                                            ['mentee']['id']);
                                                    setState(() {});
                                                  },
                                                  textcolor: whitecolor,
                                                  loading: false,
                                                  backgroundColor:
                                                      const Color(0xff036118),
                                                  rounded: true,
                                                  height: 20.h,
                                                  textSize: 12.sp,
                                                  width: 100.w)
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${snapshot.data['connectionRequests'][index]['connectionRequestTime']}",
                                        style: manoropeFontFamily(
                                            fontSize: 10.sp,
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
              )
            : SafeArea(
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
                          Obx(
                            () => Text(
                              "Request",
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
                                .color(controller.index.value == 0
                                    ? greyColor
                                    : whitecolor)
                                .make()
                                .onTap(() {
                              controller.index.value = 0;
                            }),
                          ),
                          5.widthBox,
                          Obx(
                            () => Text(
                              "Connections",
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
                                .color(controller.index.value == 1
                                    ? greyColor
                                    : whitecolor)
                                .make()
                                .onTap(() {
                              controller.index.value = 1;
                            }),
                          ),
                        ],
                      ),
                    ),
                    5.heightBox,
                    FutureBuilder(
                        future: controller.getMentorAcceptedConnections(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return ShimmerList(10);
                          } else if (!snapshot.hasData) {
                            return  Center(
                              child: Image.asset("assets/images/no friend found.png",height: 100.h,width: 100.w,),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          }

                          return Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    snapshot.data!['mentorConnections'].length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment: crosstart,
                                    children: [
                                      CircleAvatar(
                                        radius: 30.r,
                                        backgroundImage:
                                            CachedNetworkImageProvider(snapshot
                                                    .data!['mentorConnections']
                                                [index]['profilePicUrl']),
                                      ),
                                      10.widthBox,
                                      Column(
                                        crossAxisAlignment: crosstart,
                                        children: [
                                          SizedBox(
                                            width: 200.w,
                                            child: Text(
                                              snapshot.data![
                                                      'mentorConnections']
                                                  [index]['fullName'],
                                              style: manoropeFontFamily(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: blackcolor),
                                            ),
                                          ),
                                          5.heightBox,
                                          Text(
                                            snapshot.data!['mentorConnections']
                                                [index]['industry'],
                                            textAlign: TextAlign.center,
                                            style: manoropeFontFamily(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500,
                                                color: textfieldgrey),
                                          )
                                              .box
                                              .padding(
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 8, 2))
                                              .border(color: greyColor)
                                              .rounded
                                              .make(),
                                          Row(
                                            children: [
                                              CustomButton(
                                                  buttonName: "Remove",
                                                  onPressed: () {
                                                    controller
                                                        .deleteAcceptedMentorRequest(
                                                            snapshot.data![
                                                                        'mentorConnections']
                                                                    [index][
                                                                'connectionId']);
                                                    setState(() {});
                                                  },
                                                  textcolor: whitecolor,
                                                  loading: false,
                                                  backgroundColor:
                                                      darkBrownColor,
                                                  rounded: true,
                                                  height: 20.h,
                                                  textSize: 12.sp,
                                                  width: 100.w),
                                              10.widthBox,
                                              CustomButton(
                                                  buttonName: "Message",
                                                  onPressed: () {
                                                    var chatRoomId = controller.chatRoomId(
                                                        recieverId: snapshot
                                                            .data!['mentorConnections']
                                                                [index]['email']
                                                            .toString(),
                                                        senderId: StorageServices
                                                                    .to
                                                                    .getString(
                                                                        selectedUserType) ==
                                                                "Mentee"
                                                            ? getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                                                                .email
                                                            : getMentorInfoFromJson(
                                                                    StorageServices
                                                                        .to
                                                                        .getString(getMentorInformationsss))
                                                                .email);

                                                    Get.to(
                                                        () => MessagesView(
                                                              gofromChat: false,
                                                              recId: snapshot
                                                                  .data![
                                                                      'mentorConnections']
                                                                      [index]
                                                                      ['id']
                                                                  .toString(),
                                                              recName: snapshot
                                                                          .data![
                                                                      'mentorConnections']
                                                                  [
                                                                  index]['fullName'],
                                                            ),
                                                        arguments: [
                                                          snapshot.data![
                                                                  'mentorConnections']
                                                              [index],
                                                          chatRoomId
                                                        ]);

                                   
                                                  },
                                                  textcolor: whitecolor,
                                                  loading: false,
                                                  backgroundColor:
                                                      darkBrownColor,
                                                  rounded: true,
                                                  height: 20.h,
                                                  textSize: 12.sp,
                                                  width: 100.w),
                                            ],
                                          ),
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
              )));
  }
}
